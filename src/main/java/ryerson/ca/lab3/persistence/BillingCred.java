package ryerson.ca.lab3.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import ryerson.ca.lab3.Helper.BillingInfo; // Assuming you have a BillingInfo class in this package

public class BillingCred {
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

    public boolean saveBillingInfo(String userID, String cardholderName, String billingAddress, String cardNumber, String cvv, String expirationDate) {
        try (Connection con = getCon()) {
            if (con == null) {
                System.out.println("Connection is null");
                return false;
            }

            String billingID = generateBillingID();

            String q = "INSERT INTO BillingInfo (BillingID, UserID, CardholderName, BillingAddress, CardNumber, CVV, ExpirationDate) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, billingID);
            ps.setString(2, userID);
            ps.setString(3, cardholderName);
            ps.setString(4, billingAddress);
            ps.setString(5, cardNumber);
            ps.setInt(6, Integer.parseInt(cvv));
            ps.setString(7, expirationDate);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    private String generateBillingID() {
        String billingID = "BillID0001"; 
        try (Connection con = getCon()) {
            if (con == null) {
                System.out.println("Connection is null");
                return billingID;
            }

            String q = "SELECT BillingID FROM BillingInfo ORDER BY BillingID DESC LIMIT 1";
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String lastBillingID = rs.getString("BillingID");
                if (lastBillingID.length() >= 7) {
                    int num = Integer.parseInt(lastBillingID.substring(6)); // Get the number part of the last ID
                    num++; // Increment the number by 1
                    billingID = "BillID" + String.format("%04d", num); // Format the number as a 4-digit string
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return billingID;
    }

    public boolean hasBillingInfo(String userID) {
        try (Connection con = getCon()) {
            if (con == null) {
                System.out.println("Connection is null");
                return false;
            }

            String q = "SELECT * FROM BillingInfo WHERE UserID = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, userID);

            ResultSet rs = ps.executeQuery();
            return rs.next();  // Return true if there's a record, false otherwise
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public BillingInfo getBillingInfo(String userID) {
        try (Connection con = getCon()) {
            if (con == null) {
                System.out.println("Connection is null");
                return null;
            }

            String q = "SELECT * FROM BillingInfo WHERE UserID = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, userID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String cardholderName = rs.getString("CardholderName");
                String billingAddress = rs.getString("BillingAddress");
                String cardNumber = rs.getString("CardNumber");
                String cvv = rs.getString("CVV");
                String expirationDate = rs.getString("ExpirationDate");

                return new BillingInfo(userID, cardholderName, billingAddress, cardNumber, cvv, expirationDate);
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
}
