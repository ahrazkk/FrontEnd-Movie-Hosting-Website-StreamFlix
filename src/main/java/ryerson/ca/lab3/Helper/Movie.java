package ryerson.ca.lab3.Helper;

public class Movie {
    private final String movieID;
    private final String title;
    private final String rating;
    private final int published;
    private final String imageUrl;
    private final String description;
    private final String genre;

    public Movie(String movieID, String title, String rating, int published, String imageUrl, String description, String genre) {
        this.movieID = movieID;
        this.title = title;
        this.rating = rating;
        this.published = published;
        this.imageUrl = imageUrl;
        this.description = description;
        this.genre = genre;
    }

    // Getters for all fields
    public String getMovieID() {
        return movieID;
    }

    public String getTitle() {
        return title;
    }

    public String getRating() {
        return rating;
    }

    public int getPublished() {
        return published;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public String getGenre() {
        return genre;
    }
}
