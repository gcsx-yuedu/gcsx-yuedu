package po.DJX;

public class BookType {
    private int t_id;
    private Book_Type t_type;

    public int getT_id() {
        return t_id;
    }

    public Book_Type getT_type() {
        return t_type;
    }

    public void setT_type(Book_Type t_type) {
        this.t_type = t_type;
    }

    @Override
    public String toString() {
        return "BookType{" +
                "t_id=" + t_id +
                ", t_type='" + t_type + '\'' +
                '}';
    }
}
