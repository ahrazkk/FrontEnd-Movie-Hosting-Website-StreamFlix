package ryerson.ca.lab3.business;

import ryerson.ca.lab3.Helper.UserInfo;
import ryerson.ca.lab3.persistence.UserCred;

public class LoginBusiness {
    private final UserCred userCred = new UserCred();

    public String getUserRole(String email, String password) {
        return userCred.getUserRole(email, password);
    }

    public String getUserID(String email, String password) {
        return userCred.getUserID(email, password);
    }
}
