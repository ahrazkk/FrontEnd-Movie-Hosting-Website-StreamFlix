package lab2Package;

import ryerson.ca.lab3.Helper.Movie;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Logkin", urlPatterns = {"/Lkogin"})
public class Login extends HttpServlet {

    private static final UserInfo USER_PAYED = new UserInfo("akibria@torontomu.ca", "Password", "payed");
    private static final UserInfo USER_ADMIN = new UserInfo("1kibriaahr@gmail.com", "Password", "admin");
    private static final UserInfo USER_REGISTERED = new UserInfo("ahrazkibria@gmail.com", "Ahraz", "registered");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email").toLowerCase(); // Convert email to lowercase
        String password = request.getParameter("pass");

        UserInfo uinfo = getUserInfo(email, password);

        if (uinfo == null) {
            RequestDispatcher rd = request.getRequestDispatcher("loginfailed.jsp");
            rd.forward(request, response);
        } else {
            request.getSession().setAttribute("email", email);
            request.setAttribute("roleInfo", uinfo.getRole());

            // Get the movie list based on the user's role
           // ArrayList<Movie> movies = getMovieListForRole(uinfo.getRole());
            //request.setAttribute("movieList", movies);

            if (null == uinfo.getRole()) { // Forward to the JSPs
            } else {
                switch (uinfo.getRole()) {
                    case "payed":{
                        RequestDispatcher rd = request.getRequestDispatcher("watchMovie.jsp");
                        rd.forward(request, response);
                        break;
                    }
                    case "admin":{
                        RequestDispatcher rd = request.getRequestDispatcher("adminPortal.jsp");
                        rd.forward(request, response);
                        break;
                    }
                    case "registered":{
                        RequestDispatcher rd = request.getRequestDispatcher("subscription.jsp");
                        rd.forward(request, response);
                        break;
                    }
                    default:
                        break;
                }
            }
        }
    }

    private UserInfo getUserInfo(String email, String password) {
        // Check if entered credentials  are same as the ones above
        if (email.equals(USER_PAYED.getEmail()) && password.equals(USER_PAYED.getPassword())) {
            return USER_PAYED;
        } else if (email.equals(USER_ADMIN.getEmail()) && password.equals(USER_ADMIN.getPassword())) {
            return USER_ADMIN;
        } else if (email.equals(USER_REGISTERED.getEmail()) && password.equals(USER_REGISTERED.getPassword())) {
            return USER_REGISTERED;
        }

        return null;
    }

    /*private ArrayList<Movie> getMovieListForRole(String role) {
        ArrayList<Movie> movies = new ArrayList<>();

      /*  if ("payed".equals(role) || "registered".equals(role) ) {
           //the normal subscription package and for registered accounts to see the movies
           movies.add(new Movie("tangle 2", "images/111.jpg", "",""));
            movies.add(new Movie("Shrek 2", "images/222.jpg", "",""));
            movies.add(new Movie("Toy Story 6", "images/333.jpg", "",""));
            movies.add(new Movie("The Beggers Journey", "images/999.jpg", "",""));
             movies.add(new Movie("The Coder", "images/555.jpg", "",""));
              movies.add(new Movie("The Samiiost Movie", "images/666.jpg", "",""));
               movies.add(new Movie("Wasif, The Bengalis Journey", "images/777.jpg", "",""));
              movies.add(new Movie("Sarah The slippery Snake", "images/1.11.jpg", "",""));
              movies.add(new Movie("Anum, The Homeless Prodigy", "images/1.12.jpg", "",""));
             movies.add(new Movie("Omran, The Dark Night", "images/1.13.jpg", "",""));
             movies.add(new Movie("Taha, The Great Depression", "images/1.14.jpg", "",""));
             
        }
        
        else if ("admin".equals(role)) {    
           //for the admin to see, he might have more movies that are not uploaded yet, not sure if thats what i want to go with, but as of now yes 
          movies.add(new Movie("tangle 2", "images/111.jpg", "",""));
            movies.add(new Movie("Shrek 2", "images/222.jpg", "",""));
            movies.add(new Movie("Toy Story 6", "images/333.jpg", "",""));
            movies.add(new Movie("The Beggers Journey", "images/999.jpg", "",""));
             movies.add(new Movie("The Coder", "images/555.jpg", "",""));
              movies.add(new Movie("The Samiiost Movie", "images/666.jpg", "",""));
               movies.add(new Movie("Wasif, The Bengalis Journey", "images/777.jpg", "",""));
              movies.add(new Movie("Sarah The slippery Snake", "images/1.11.jpg", "",""));
              movies.add(new Movie("Sarah The slippery Snake", "images/1.12.jpg", "",""));
             movies.add(new Movie("Omran, The Dark Night", "images/1.13.jpg", "",""));
            boolean add = movies.add(new Movie("Taha, The Great Depression", "images/1.14.jpg", "",""));
        } 
        return movies;
   */

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }}

