package po.BSJ;
import java.util.List;

public class BFansList {
    private List<BUser> fansList;
    private int countFans;

    public List<BUser> getFansList() {
        return fansList;
    }

    public void setFansList(List<BUser> fansList) {
        this.fansList = fansList;
    }

    public int getCountFans() {
        return countFans;
    }

    public void setCountFans(int countFans) {
        this.countFans = countFans;
    }
}
