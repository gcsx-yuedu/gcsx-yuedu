package po.JZX;

public class JPingFen {
    private int pingfen_id;
    private int u_id;
    private int book_id;
    private int score;

    public int getPingfen_id() {
        return pingfen_id;
    }

    public void setPingfen_id(int pingfen_id) {
        this.pingfen_id = pingfen_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "JPingFen{" +
                "pingfen_id=" + pingfen_id +
                ", u_id=" + u_id +
                ", book_id=" + book_id +
                ", score=" + score +
                '}';
    }
}
