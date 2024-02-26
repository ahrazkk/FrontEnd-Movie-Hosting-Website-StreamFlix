package ryerson.ca.lab3.persistence;

import ryerson.ca.lab3.Helper.Movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MovieCred {
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

    public ArrayList<Movie> getMovies() {
    ArrayList<Movie> movies = new ArrayList<>();

    try{
        Connection con = getCon();

        if (con == null) {
            System.out.println("Connection is null");
            return null;
        }

        String q = "SELECT * FROM Movies";
        PreparedStatement ps = con.prepareStatement(q);
        ResultSet rs = ps.executeQuery();

        if (rs == null) {
            System.out.println("ResultSet is null");
            return null;
        }

        while(rs.next()){
            String movieID = rs.getString("MovieID");
            String title = rs.getString("Title");
            String rating = rs.getString("Rating");
            int published = rs.getInt("Published");
            String genre = rs.getString("Genre");
            String imageUrl = rs.getString("ImageUrl");
            String description = rs.getString("Description");

            Movie movie = new Movie(movieID, title, rating, published, imageUrl, description, genre);
            movies.add(movie);
        }
        
        con.close();
    } catch(SQLException e){
        System.out.println(e);
    }

    return movies;
}
}