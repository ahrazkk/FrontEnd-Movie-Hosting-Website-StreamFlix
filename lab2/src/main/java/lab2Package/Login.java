package lab2Package;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    private static final UserInfo USER_PAYED = new UserInfo("akibria@torontomu.ca", "Ahraz", "payed");
    private static final UserInfo USER_ADMIN = new UserInfo("1kibriaahr@gmail.com", "Ahraz", "admin");
    private static final UserInfo USER_REGISTERED = new UserInfo("ahrazkibria@gmail.com", "Ahraz", "registered");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        UserInfo uinfo = getUserInfo(email, password);

        if (uinfo == null) {
            RequestDispatcher rd = request.getRequestDispatcher("loginfailed.jsp");
            rd.forward(request, response);
        } else {
            request.getSession().setAttribute("email", email);
            request.setAttribute("roleInfo", uinfo.getRole());

            // Get the movie list based on the user's role
            ArrayList<Movie> movies = getMovieListForRole(uinfo.getRole());
            request.setAttribute("movieList", movies);

            // Forward to the JSPs
            if ("payed".equals(uinfo.getRole())) {
                RequestDispatcher rd = request.getRequestDispatcher("watchMovie.jsp");
                rd.forward(request, response);
            } else if ("admin".equals(uinfo.getRole())) {
                RequestDispatcher rd = request.getRequestDispatcher("adminPortal.jsp");
                rd.forward(request, response);
            } else if ("registered".equals(uinfo.getRole())) {
                RequestDispatcher rd = request.getRequestDispatcher("subscription.jsp");
                rd.forward(request, response);
            }
        }
    }

    private UserInfo getUserInfo(String email, String password) {
        // Check if entered credentials  are same as the ones above
        if (email.equals(USER_PAYED.getEmail()) && password.equals(USER_PAYED.getPassword())) {
            return USER_PAYED;
        } else if (email.equals(USER_ADMIN.getEmail()) && password.equals(USER_ADMIN.getPassword())) {
            return USER_ADMIN;
        } else if (email.equals(USER_REGISTERED.getEmail()) && password.equals(USER_REGISTERED.getPassword())) {
            return USER_REGISTERED;
        }

        return null;
    }

    private ArrayList<Movie> getMovieListForRole(String role) {
        ArrayList<Movie> movies = new ArrayList<>();

        if ("payed".equals(role) || "registered".equals(role) ) {
            
            
        //the normal subscription package and for registered accounts to see the movies
           movies.add(new Movie("tangle 2", "images/111.jpg", ""));
            movies.add(new Movie("Shrek 2", "images/222.jpg", ""));
            movies.add(new Movie("Toy Story 6", "images/333.jpg", ""));
            movies.add(new Movie("Ayeshas Great Adventure", "images/444.jpg", ""));
             movies.add(new Movie("The Coder", "images/555.jpg", ""));
              movies.add(new Movie("The Samiiost Movie", "images/666.jpg", ""));
        }
        
        
        
        else if ("admin".equals(role)) {    
           //for the admin to see, he might have more movies that are not uploaded yet, not sure if thats what i want to go with, but as of now yes 
          movies.add(new Movie("tangle 2", "images/111.jpg", ""));
            movies.add(new Movie("Shrek 2", "images/222.jpg", ""));
            movies.add(new Movie("Toy Story 6", "images/333.jpg", ""));
            movies.add(new Movie("Ayeshas Great Adventure", "images/444.jpg", ""));
             movies.add(new Movie("The Coder", "images/555.jpg", ""));
              movies.add(new Movie("The Samiiost Movie", "images/666.jpg", ""));
              
              
              
        } 
        return movies;
    }
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
