package po.JZX;

public class JDianzan {
    private int id;
    private int dianzanren_id;
    private int shortcomm_id;
    private int longcomm_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDianzanren_id() {
        return dianzanren_id;
    }

    public void setDianzanren_id(int dianzanren_id) {
        this.dianzanren_id = dianzanren_id;
    }

    public int getShortcomm_id() {
        return shortcomm_id;
    }

    public void setShortcomm_id(int shortcomm_id) {
        this.shortcomm_id = shortcomm_id;
    }

    public int getLongcomm_id() {
        return longcomm_id;
    }

    public void setLongcomm_id(int longcomm_id) {
        this.longcomm_id = longcomm_id;
    }

    @Override
    public String toString() {
        return "JDianzan{" +
                "id=" + id +
                ", dianzanren_id=" + dianzanren_id +
                ", shortcomm_id=" + shortcomm_id +
                ", longcomm_id=" + longcomm_id +
                '}';
    }
}
