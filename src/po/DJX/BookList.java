package po.DJX;

import po.DJX.Book;

import java.util.List;

public class BookList {
    private Book book;
    private List<String> typeList;

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
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
