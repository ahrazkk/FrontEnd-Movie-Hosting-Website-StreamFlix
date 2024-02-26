package ryerson.ca.lab3.business;

import ryerson.ca.lab3.Helper.Movie;
import ryerson.ca.lab3.persistence.MovieCred;

import java.util.ArrayList;

public class MovieBusiness {
    private final MovieCred movieData = new MovieCred();

    public ArrayList<Movie> getMovies() {
        return movieData.getMovies();
    }
}
