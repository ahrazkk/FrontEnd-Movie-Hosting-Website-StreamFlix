package ryerson.ca.lab3.business;

import ryerson.ca.lab3.persistence.SubscriptionCred;


public class SubscriptionBusiness {
    private final SubscriptionCred subscriptionCred = new SubscriptionCred();

    public boolean createSubscription(String userID, String subscriptionType) {
        double price;
        switch (subscriptionType) {
            case "subscription_i":
                price = 14.00;
                break;
            case "subscription_ii":
                price = 22.00;
                break;
            case "subscription_iii":
                price = 12.00;
                break;
            default:
                return false;
        }
        return subscriptionCred.createSubscription(userID, subscriptionType, price);
    }
}
