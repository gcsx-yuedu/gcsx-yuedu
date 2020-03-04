package po.DJX;

public class DBookType {
    private int t_id;
    private String t_type;
    private int typeNum;

    public int getTypeNum() {
        return typeNum;
    }

    public void setTypeNum(int typeNum) {
        this.typeNum = typeNum;
    }

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
        return "DBookType{" +
                "t_id=" + t_id +
                ", t_type='" + t_type + '\'' +
                ", typeNum=" + typeNum +
                '}';
    }
}
