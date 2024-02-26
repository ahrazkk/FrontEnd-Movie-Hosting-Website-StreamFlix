package ryerson.ca.lab3.persistence;

import ryerson.ca.lab3.Helper.UserInfo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserCred {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    private static Connection getCon(){
        Connection con=null;
        try{     
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Connection established!");
        }
        catch(Exception e){System.out.println(e);}

        return con; 
    }

     public String getUserRole(String email, String password) {
        String role = null;
        try{
            Connection con=getCon();

            if (con == null) {
                System.out.println("Connection is null");
                return null;
            }

            String q = "SELECT Role FROM Account WHERE Email = ? AND Password = ?";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs=ps.executeQuery();

            if(rs.next()){
                role = rs.getString("Role");
            }

            con.close();
        } catch(SQLException e){
            System.out.println(e);
        }

        return role;
    }

    public String getUserID(String email, String password) {
        String userID = null;
        try{
            Connection con=getCon();

            if (con == null) {
                System.out.println("Connection is null");
                return null;
            }

            String q = "SELECT UserID FROM Account WHERE Email = ? AND Password = ?";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs=ps.executeQuery();

            if(rs.next()){
                userID = rs.getString("UserID");
            }

            con.close();
        } catch(SQLException e){
            System.out.println(e);
        }

        return userID;
    }


    private String generateUserID() {
        String userID = "ID0001"; // Default UserID
        try (Connection con = getCon()) {
            if (con == null) {
                System.out.println("Connection is null");
                return userID;
            }

            String q = "SELECT UserID FROM Account ORDER BY UserID DESC LIMIT 1";
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String lastUserID = rs.getString("UserID");
                int num = Integer.parseInt(lastUserID.substring(2));
                num++; // Increment the number by 1
                userID = "ID" + String.format("%04d", num); // Format the number as a 4-digit string
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return userID;
    }

    public boolean registerUser(String fname, String lname, String email, String password, String phone, String bday) {
        try (Connection con = getCon()) {
            if (con == null) {
                System.out.println("Connection is null");
                return false;
            }

            String userID = generateUserID();
            String role = "Registered";

            String q = "INSERT INTO Account (UserID, FirstName, LastName, Email, Password, Phone, Birthdate, Role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, userID);
            ps.setString(2, fname);
            ps.setString(3, lname);
            ps.setString(4, email);
            ps.setString(5, password);
            ps.setString(6, phone);
            ps.setString(7, bday);
            ps.setString(8, role);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean isEmailUsed(String email) {
        try (Connection con = getCon()) {
            if (con == null) {
                System.out.println("Connection is null");
                return false;
            }

            String q = "SELECT * FROM Account WHERE Email = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            return rs.next();  // returns true if there is a result, false otherwise
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }
}