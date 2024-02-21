
package lab2Package;

public class Movie {
    private final String title;
    private final String imageUrl;
    private final String description;
    private final String Id;
    /**
     *
     * @param title
     * @param imageUrl
     * @param description
     * @param Id
     */
    
    public Movie(String title, String imageUrl, String description,String Id) {
        this.title = title;
        this.imageUrl = imageUrl;
        this.description = description;
        this.Id = Id;
    }

    public String getTitle() {
        return title;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getDescription() {
        return description;
    }
    
      public String getId() {
        return Id;
    }
}
