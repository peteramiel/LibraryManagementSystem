package plm.librarymanagementsystem;

public class News {
    private String content;
    private String attachment;
    private String datePosted;

    public News() {
    }

    public News(String content, String attachment, String datePosted) {

        this.content = content;
        this.attachment = attachment;
        this.datePosted = datePosted;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getDatePosted() {
        return datePosted;
    }

    public void setDatePosted(String datePosted) {
        this.datePosted = datePosted;
    }
}
