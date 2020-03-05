package po.ZYM;

import java.util.List;

public class ZBookList {
    private ZBook book;
    private List<String> typeList;

    public ZBook getBook() {
        return book;
    }

    public void setBook(ZBook book) {
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
