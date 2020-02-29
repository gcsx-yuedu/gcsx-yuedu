package po;

public class ShortComm {
    private int sc_id;
    private int shuji_id;
    private int fatie_id;
    private String fatie_time;
    private String fatie_content;
    private int click;

    public int getSc_id() {
        return sc_id;
    }

    public void setSc_id(int sc_id) {
        this.sc_id = sc_id;
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
        return "ShortComm{" +
                "sc_id=" + sc_id +
                ", shuji_id=" + shuji_id +
                ", fatie_id=" + fatie_id +
                ", fatie_time='" + fatie_time + '\'' +
                ", fatie_content='" + fatie_content + '\'' +
                ", click=" + click +
                '}';
    }
}
