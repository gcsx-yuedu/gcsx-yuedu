package po.BSJ;
import java.util.List;

public class BBook {
    private int b_id;
//    private int b_type;
    private Object b_cover;
    private String b_name;
    private String b_author;
    private  String b_content;
    private List<BBook_Type> book_TypeList;

    public int getB_id(){
        return b_id;
    }
    public void setB_id(int b_id){
        this.b_id=b_id;
    }

//    public int getB_type() {
//        return b_type;
//    }

//    public void setB_type(int b_type) {
//        this.b_type = b_type;
//    }

    public Object getB_cover() {
        return b_cover;
    }

    public void setB_cover(Object b_cover) {
        this.b_cover = b_cover;
    }

    public String getB_name() {
        return b_name;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }

    public String getB_author() {
        return b_author;
    }

    public void setB_author(String b_author) {
        this.b_author = b_author;
    }

    public String getB_content() {
        return b_content;
    }

    public void setB_content(String b_content) {
        this.b_content = b_content;
    }

    public List<BBook_Type> getBook_TypeList() {
        return book_TypeList;
    }

    public void setBook_TypeList(List<BBook_Type> book_TypeList) {
        this.book_TypeList = book_TypeList;
    }

    @Override
    public String toString() {
        return "Book{" +
                "b_id=" + b_id +
//                ", b_type=" + b_type +
                ", b_cover=" + b_cover +
                ", b_name='" + b_name + '\'' +
                ", b_author='" + b_author + '\'' +
                ", b_content='" + b_content + '\'' +
                '}';
    }
}
