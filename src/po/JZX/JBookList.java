package po.JZX;

import po.JZX.JBook;

import java.util.List;

public class JBookList {
    private JBook book;
    private List<String> typeList;

    public JBook getBook() {
        return book;
    }

    public void setBook(JBook book) {
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
