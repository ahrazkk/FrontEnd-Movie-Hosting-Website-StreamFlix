package ryerson.ca.lab3.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;


public class SubscriptionCred {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    private Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    public boolean createSubscription(String userID, String subscriptionType, double price) {
        try (Connection con = getCon()) {
            if (con == null) {
                System.out.println("Connection is null");
                return false;
            }

            String subscriptionID = generateSubscriptionID();
            Date startDate = new Date(System.currentTimeMillis());

            String q = "INSERT INTO Subscription (SubscriptionID, StartDate, SubscriptionType, Price, UserID) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, subscriptionID);
            ps.setDate(2, startDate);
            ps.setString(3, subscriptionType);
            ps.setDouble(4, price);
            ps.setString(5, userID);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    private String generateSubscriptionID() {
        String subscriptionID = "ID0001"; // Default SubscriptionID
        try (Connection con = getCon()) {
            if (con == null) {
                System.out.println("Connection is null");
                return subscriptionID;
            }

            String q = "SELECT SubscriptionID FROM Subscription ORDER BY SubscriptionID DESC LIMIT 1";
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String lastSubscriptionID = rs.getString("SubscriptionID");
                int num = Integer.parseInt(lastSubscriptionID.substring(2));
                num++; // Increment the number by 1
                subscriptionID = "ID" + String.format("%04d", num); // Format the number as a 4-digit string
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return subscriptionID;
    }
}