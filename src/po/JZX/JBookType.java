package po.JZX;

public class JBookType {
    private int t_id;
    private String t_type;

    public int getT_id() {
        return t_id;
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
                "t_id=" + t_id +
                ", t_type='" + t_type + '\'' +
                '}';
    }
}
