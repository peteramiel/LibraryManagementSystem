package plm.librarymanagementsystem;

import java.util.ArrayList;
import java.util.List;

public class Section {
    public String sectionTitle;
    public List<Books> books = new ArrayList<Books>();

    public Section(String sectionTitle, List<Books> books) {
        this.sectionTitle = sectionTitle;
        this.books = books;
    }
}
