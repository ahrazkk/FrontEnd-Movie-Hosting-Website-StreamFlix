package ryerson.ca.lab3.Helper;

public class UserInfo {
    private String email;
    private String password;
    private String role;
        private String userID;


    public UserInfo(String email, String password, String role,String userID) {
        this.email = email;
        this.password = password;
        this.role = role;
        this.userID = userID;
    }
    

    // getters and setters
    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getUserID() {
        return userID;
    }


}
