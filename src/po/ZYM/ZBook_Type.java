package po.ZYM;
import java.util.List;


public class ZBook_Type {
    private int id;
    private ZBook book_id;
    private int type_id;
    private List<ZBook_Type> bookTypeList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ZBook getBook_id() {
        return book_id;
    }

    public void setBook_id(ZBook book_id) {
        this.book_id = book_id;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public List<ZBook_Type> getBookTypeList() {
        return bookTypeList;
    }

    public void setBookTypeList(List<ZBook_Type> bookTypeList) {
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
