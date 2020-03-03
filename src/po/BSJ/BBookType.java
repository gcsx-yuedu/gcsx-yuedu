package po.BSJ;

public class BBookType {
    private int t_id;
    private BBook_Type t_type;

    public int getT_id() {
        return t_id;
    }

    public BBook_Type getT_type() {
        return t_type;
    }

    public void setT_type(BBook_Type t_type) {
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
