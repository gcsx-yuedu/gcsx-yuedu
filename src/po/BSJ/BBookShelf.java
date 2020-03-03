package po.BSJ;
import java.util.List;

public class BBookShelf {
    private int id;
    private int user_id;
    private int book_id;
    private List<BBook> bookList;

    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id=id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public List<BBook> getBookList() {
        return bookList;
    }

    public void setBookList(List<BBook> bookList) {
        this.bookList = bookList;
    }
}
