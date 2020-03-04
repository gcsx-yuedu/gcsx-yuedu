package po.ZYM;

public class ZBookType {
    private int t_id;
    private String t_type;
    private ZBook_Type t_type1;

    public String getT_type(){
        return t_type;
    }

    public void setT_type(String t_type) {
        this.t_type = t_type;
    }

    public int getT_id() {
        return t_id;
    }

    public ZBook_Type getT_type1() {
        return t_type1;
    }

    public void setT_type1(ZBook_Type t_type1) {
        this.t_type1 = t_type1;
    }

    @Override
    public String toString() {
        return "BookType{" +
                "t_id=" + t_id +
                ", t_type='" + t_type + '\'' +
                '}';
    }
}
