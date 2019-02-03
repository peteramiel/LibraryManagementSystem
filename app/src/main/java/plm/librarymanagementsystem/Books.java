package plm.librarymanagementsystem;

public class Books {
    private String available;
    private String bookAuthor;
    private String bookTitle;
    private String callNumber;
    private String location;
    private String publishDate;
    private String series;
    private String uniqueId;
    private String shelfPosition;
    private String shelfLayer;

    public Books(String available, String bookAuthor, String bookTitle, String callNumber, String location, String publishDate, String series, String uniqueId, String shelfPosition, String shelfLayer) {
        this.available = available;
        this.bookAuthor = bookAuthor;
        this.bookTitle = bookTitle;
        this.callNumber = callNumber;
        this.location = location;
        this.publishDate = publishDate;
        this.series = series;
        this.uniqueId = uniqueId;
        this.shelfPosition = shelfPosition;
        this.shelfLayer = shelfLayer;
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getCallNumber() {
        return callNumber;
    }

    public void setCallNumber(String callNumber) {
        this.callNumber = callNumber;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public String getSeries() {
        return series;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public String getUniqueId() {
        return uniqueId;
    }

    public void setUniqueId(String uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getShelfPosition() {
        return shelfPosition;
    }

    public void setShelfPosition(String shelfPosition) {
        this.shelfPosition = shelfPosition;
    }

    public String getShelfLayer() {
        return shelfLayer;
    }

    public void setShelfLayer(String shelfLayer) {
        this.shelfLayer = shelfLayer;
    }

    public Books() {

    }
}
