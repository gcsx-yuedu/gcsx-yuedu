package po.DJX;

public class BookType {
    private int t_id;
    private int t_type;

    public int getT_id() {
        return t_id;
    }

    public int getT_type() {
        return t_type;
    }

    public void setT_type(int t_type) {
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
