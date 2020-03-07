package po.JZX;

public class JShortComm {
    private int id;
    private int shuji_id;
    private int fatie_id;
    private String fatie_name;
    private String fatie_time;
    private String fatie_content;
    private int click;

    public int getId() {
        return id;
    }

    public void setId(int sc_id) {
        this.id = id;
    }

    public int getShuji_id() {
        return shuji_id;
    }

    public void setShuji_id(int shuji_id) {
        this.shuji_id = shuji_id;
    }

    public int getFatie_id() {
        return fatie_id;
    }

    public void setFatie_id(int fatie_id) {
        this.fatie_id = fatie_id;
    }

    public String getFatie_name() {
        return fatie_name;
    }

    public void setFatie_name(String fatie_name) {
        this.fatie_name = fatie_name;
    }

    public String getFatie_time() {
        return fatie_time;
    }

    public void setFatie_time(String fatie_time) {
        this.fatie_time = fatie_time;
    }

    public String getFatie_content() {
        return fatie_content;
    }

    public void setFatie_content(String fatie_content) {
        this.fatie_content = fatie_content;
    }

    public int getClick() {
        return click;
    }

    public void setClick(int click) {
        this.click = click;
    }

    @Override
    public String toString() {
        return "JShortComm{" +
                "id=" + id +
                ", shuji_id=" + shuji_id +
                ", fatie_id=" + fatie_id +
                ", fatie_name='" + fatie_name + '\'' +
                ", fatie_time='" + fatie_time + '\'' +
                ", fatie_content='" + fatie_content + '\'' +
                ", click=" + click +
                '}';
    }
}
