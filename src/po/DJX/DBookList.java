package po.DJX;

import java.util.List;

public class DBookList {
    private DBook book;
    private List<String> typeList;

    public DBook getBook() {
        return book;
    }

    public void setBook(DBook book) {
        this.book = book;
    }

    public List<String> getTypeList() {
        return typeList;
    }

    public void setTypeList(List<String> typeList) {
        this.typeList = typeList;
    }

    @Override
    public String toString() {
        return "BookList{" +
                "book=" + book +
                ", typeList=" + typeList +
                '}';
    }
}
