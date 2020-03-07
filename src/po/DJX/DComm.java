package po.DJX;

public class DComm {
    private String date;
    private int commNum;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCommNum() {
        return commNum;
    }

    public void setCommNum(int commNum) {
        this.commNum = commNum;
    }

    @Override
    public String toString() {
        return "DComm{" +
                "date='" + date + '\'' +
                ", commNum=" + commNum +
                '}';
    }
}
