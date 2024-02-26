package ryerson.ca.lab3.business;

import ryerson.ca.lab3.persistence.UserCred;

public class RegisterBusiness {
    private final UserCred userCred = new UserCred();

    public boolean registerUser(String fname, String lname, String email, String password, String phone, String bday) {
        return userCred.registerUser(fname, lname, email, password, phone, bday);
    }

    public boolean isEmailUsed(String email) {
        return userCred.isEmailUsed(email);
    }
}
