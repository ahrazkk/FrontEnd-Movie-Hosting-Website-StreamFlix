package ryerson.ca.lab3.gui;

import ryerson.ca.lab3.business.RegisterBusiness;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    private final RegisterBusiness registerBusiness = new RegisterBusiness();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/LoginRegister.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email").toLowerCase();
        String password = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String bday = request.getParameter("bday");

        if (fname.isEmpty() || lname.isEmpty() || email.isEmpty() || password.isEmpty() || phone.isEmpty() || bday.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/registerfailed.jsp").forward(request, response);
            return;
        }

        if (!isValidEmail(email)) {
            request.setAttribute("errorMessage", "Invalid email address. Please enter a valid email.");
            request.getRequestDispatcher("/registerfailed.jsp").forward(request, response);
            return;
        }

        boolean isEmailUsed = registerBusiness.isEmailUsed(email);
        if (isEmailUsed) {
            // Redirect to the registration page and show an error message
            request.setAttribute("errorMessage", "Email already in use, Login Instead?");
            request.getRequestDispatcher("/registerfailed.jsp").forward(request, response);
        } else {
            boolean isRegistered = registerBusiness.registerUser(fname, lname, email, password, phone, bday);

            if (isRegistered) {
                request.getSession().setAttribute("accountCreated", "Account created successfully!");
                // Redirect to the login page after successful registration
                response.sendRedirect("LoginRegister.jsp");
            } else {
                // Redirect to the registration page and show an error message
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("/registerfailed.jsp").forward(request, response);
            }
        }
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        Pattern pattern = Pattern.compile(emailRegex);
        return pattern.matcher(email).matches();
    }
}
