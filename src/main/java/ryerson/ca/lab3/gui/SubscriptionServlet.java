package ryerson.ca.lab3.gui;

import ryerson.ca.lab3.business.SubscriptionBusiness;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SubscriptionServlet", urlPatterns = {"/SubscriptionServlet"})
public class SubscriptionServlet extends HttpServlet {
    private final SubscriptionBusiness subscriptionBusiness = new SubscriptionBusiness();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subscriptionType = request.getParameter("subscriptionType");
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");

        if (subscriptionBusiness.createSubscription(userID, subscriptionType)) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}