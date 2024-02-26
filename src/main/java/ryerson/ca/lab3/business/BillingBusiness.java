package ryerson.ca.lab3.business;

import ryerson.ca.lab3.persistence.BillingCred;
import ryerson.ca.lab3.Helper.BillingInfo; // Assuming you have a BillingInfo class in this package

public class BillingBusiness {
    private final BillingCred billingCred = new BillingCred();

    public boolean saveBillingInfo(String userID, String cardholderName, String billingAddress, String cardNumber, String cvv, String expirationDate) {
        return billingCred.saveBillingInfo(userID, cardholderName, billingAddress, cardNumber, cvv, expirationDate);
    }

    public boolean hasBillingInfo(String userID) {
        return billingCred.hasBillingInfo(userID);
    }

    public BillingInfo getBillingInfo(String userID) {
        return billingCred.getBillingInfo(userID);
    }
}
