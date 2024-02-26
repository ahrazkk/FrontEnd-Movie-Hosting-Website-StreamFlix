package ryerson.ca.lab3.gui;

import ryerson.ca.lab3.business.MovieBusiness;
import ryerson.ca.lab3.Helper.Movie;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "BrowseMovie", urlPatterns = {"/BrowseMovie"})
public class BrowseMovieServlet extends HttpServlet {
    private final MovieBusiness movieBusiness = new MovieBusiness();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Movie> movies = movieBusiness.getMovies();

        request.setAttribute("movieList", movies);

        RequestDispatcher rd = request.getRequestDispatcher("BrowseMovie.jsp");
        rd.forward(request, response);
    }
}
