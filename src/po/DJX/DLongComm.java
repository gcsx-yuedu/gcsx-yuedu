package po.DJX;

public class DLongComm {
    private int lc_id;
    private String title;
    private int book_id;
    private int author_id;
    private String lc_time;
    private String lc_article;
    private int lc_coment;
    private int lc_click;

    public int getLc_id() {
        return lc_id;
    }

    public void setLc_id(int lc_id) {
        this.lc_id = lc_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public String getLc_time() {
        return lc_time;
    }

    public void setLc_time(String lc_time) {
        this.lc_time = lc_time;
    }

    public String getLc_article() {
        return lc_article;
    }

    public void setLc_article(String lc_article) {
        this.lc_article = lc_article;
    }

    public int getLc_coment() {
        return lc_coment;
    }

    public void setLc_coment(int lc_coment) {
        this.lc_coment = lc_coment;
    }

    public int getLc_click() {
        return lc_click;
    }

    public void setLc_click(int lc_click) {
        this.lc_click = lc_click;
    }

    @Override
    public String toString() {
        return "LongComm{" +
                "lc_id=" + lc_id +
                ", title='" + title + '\'' +
                ", book_id=" + book_id +
                ", author_id=" + author_id +
                ", lc_time='" + lc_time + '\'' +
                ", lc_article='" + lc_article + '\'' +
                ", lc_coment=" + lc_coment +
                ", lc_click=" + lc_click +
                '}';
    }
}
