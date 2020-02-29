package po;

public class BookType {
    private int id;
    private String t_type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getT_type() {
        return t_type;
    }

    public void setT_type(String t_type) {
        this.t_type = t_type;
    }

    @Override
    public String toString() {
        return "BookType{" +
                "id=" + id +
                ", t_type='" + t_type + '\'' +
                '}';
    }
}
