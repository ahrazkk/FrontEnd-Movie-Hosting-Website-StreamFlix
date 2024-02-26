package ryerson.ca.lab3.Helper;

public class BillingInfo {
    private String userID;
    private String cardholderName;
    private String billingAddress;
    private String cardNumber;
    private String cvv;
    private String expirationDate;

    public BillingInfo(String userID, String cardholderName, String billingAddress, String cardNumber, String cvv, String expirationDate) {
        this.userID = userID;
        this.cardholderName = cardholderName;
        this.billingAddress = billingAddress;
        this.cardNumber = cardNumber;
        this.cvv = cvv;
        this.expirationDate = expirationDate;
    }

    public String getUserID() {
        return userID;
    }

    public String getCardholderName() {
        return cardholderName;
    }

    public String getBillingAddress() {
        return billingAddress;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getCVV() {
        return cvv;
    }

    public String getExpirationDate() {
        return expirationDate;
    }
}
