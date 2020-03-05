package po.BSJ;
import java.util.List;

public class BConcernList {
    private List<BUser> concernList;
    private int countConcern;

    public List<BUser> getConcernList() {
        return concernList;
    }

    public void setConcernList(List<BUser> concernList) {
        this.concernList = concernList;
    }

    public int getCountConcern() {
        return countConcern;
    }

    public void setCountConcern(int countConcern) {
        this.countConcern = countConcern;
    }
}
