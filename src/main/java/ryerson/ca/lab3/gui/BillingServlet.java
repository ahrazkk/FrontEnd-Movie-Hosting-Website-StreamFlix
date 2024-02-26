package ryerson.ca.lab3.gui;

import ryerson.ca.lab3.business.BillingBusiness;
import ryerson.ca.lab3.Helper.BillingInfo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BillingServlet", urlPatterns = {"/BillingServlet"})
public class BillingServlet extends HttpServlet {
    private final BillingBusiness billingBusiness = new BillingBusiness();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cardholderName = request.getParameter("cardholderName");
        String billingAddress = request.getParameter("billingAddress");
        String cardNumber = request.getParameter("cardNumber");
        String cvv = request.getParameter("cvv");
        String expirationDate = request.getParameter("expirationDate");
        String userID = (String) request.getSession().getAttribute("userID");

        // Check if the user already has a billing ID
        if (billingBusiness.hasBillingInfo(userID)) {
            // If the user already has a billing ID, retrieve it and store it in the session
            BillingInfo billingInfo = billingBusiness.getBillingInfo(userID);
            request.getSession().setAttribute("billingInfo", billingInfo);
            response.sendRedirect("/lab2/subscription.jsp");
        } else {
            // If the user doesn't have a billing ID, save their billing info
            boolean isBillingInfoSaved = billingBusiness.saveBillingInfo(userID, cardholderName, billingAddress, cardNumber, cvv, expirationDate);
            if (isBillingInfoSaved) {
                // If the billing info is saved successfully, create the billingInfo object
                BillingInfo billingInfo = new BillingInfo(userID, cardholderName, billingAddress, cardNumber, cvv, expirationDate);
                
                // Check if billingInfo is not null before setting it in the session
                if (billingInfo == null) {
                    // If billingInfo is null, redirect back to the billing page and show an error message
                    request.setAttribute("errorMessage", "Failed to create billing info. Please try again.");
                    request.getRequestDispatcher("/lab2/billing.jsp").forward(request, response);
                } else {
                    request.getSession().setAttribute("billingInfo", billingInfo);
                    response.sendRedirect("/lab2/subscription.jsp");
                }
            }
        }
    }
}

