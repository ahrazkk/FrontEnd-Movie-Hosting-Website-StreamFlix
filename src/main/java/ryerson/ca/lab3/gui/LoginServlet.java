package ryerson.ca.lab3.gui;

import ryerson.ca.lab3.Helper.Movie;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ryerson.ca.lab3.business.LoginBusiness;
import ryerson.ca.lab3.Helper.UserInfo;
import ryerson.ca.lab3.business.BillingBusiness;
import ryerson.ca.lab3.Helper.BillingInfo;


@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {
    private final LoginBusiness loginBusiness = new LoginBusiness();
    private final BillingBusiness billingBusiness = new BillingBusiness();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email").toLowerCase(); // Convert email to lowercase
        String password = request.getParameter("pass");

        String role = loginBusiness.getUserRole(email, password);
        String userID = loginBusiness.getUserID(email, password);

        if (role == null || userID == null) {
            response.sendRedirect("loginfailed.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("userID", userID);  // Store the userID in the session

            // Retrieve the billingInfo for the user and store it in the session
            BillingInfo billingInfo = billingBusiness.getBillingInfo(userID);
            session.setAttribute("billingInfo", billingInfo);

            if ("Admin".equals(role)) {
                response.sendRedirect("adminPortal.jsp");
            } else if ("Registered".equals(role)) {
                // Check if billing info exists for the user
                boolean hasBillingInfo = billingBusiness.hasBillingInfo(userID);
                if (hasBillingInfo) {
                    // If billing info exists, redirect to Subscription.jsp
                    response.sendRedirect("/lab2/subscription.jsp");
                } else {
                    // If billing info does not exist, redirect to Billing.jsp
                    response.sendRedirect("/lab2/Billing.jsp");
                }
            } else if ("Subscribed".equals(role)) {
                response.sendRedirect("BrowseMovie");
            } else {
                // Handle unexpected roles here, or just redirect to a default page
                response.sendRedirect("index.html");
            }
        }
    }
}
