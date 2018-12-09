package plm.librarymanagementsystem;

public class Books {
    private String callNumber;
    private String bookTitle;
    private String bookAuthor;
    private String location;
    private String publishDate;
    private String series;
    private String available;

    public Books(String callNumber, String bookTitle, String bookAuthor, String location, String publishDate, String series, String available) {
        this.callNumber = callNumber;
        this.bookTitle = bookTitle;
        this.bookAuthor = bookAuthor;
        this.location = location;
        this.publishDate = publishDate;
        this.series = series;
        this.available = available;
    }

    public String getCallNumber() {
        return callNumber;
    }

    public void setCallNumber(String callNumber) {
        this.callNumber = callNumber;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
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

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }

    public Books() {

    }
}
