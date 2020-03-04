package po.BSJ;

public class BBook_Type {
    private int id;
    private int book_id;
    private int type_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
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
