package po;
import java.util.List;


public class Book_Type {
    private int id;
    private Book book_id;
    private int type_id;
    private List<Book_Type> bookTypeList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Book getBook_id() {
        return book_id;
    }

    public void setBook_id(Book book_id) {
        this.book_id = book_id;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public List<Book_Type> getBookTypeList() {
        return bookTypeList;
    }

    public void setBookTypeList(List<Book_Type> bookTypeList) {
        this.bookTypeList = bookTypeList;
    }

    @Override
    public String toString() {
        return "Book_Type{" +
                "id=" + id +
                ", book_id=" + book_id +
                ", type_id=" + type_id +
                '}';
    }
}
