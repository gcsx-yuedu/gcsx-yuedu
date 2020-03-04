package po.BSJ;


import java.util.List;

public class BBookShelfList {
//    private List<BUser> list;
    private BBook bookList;
    private List<String> typeList;

//    public List<BUser> getList() {
//        return list;
//    }
//
//    public void setList(List<BUser> list) {
//        this.list = list;
//    }

    public BBook getBookList() {
        return bookList;
    }

    public void setBookList(BBook bookList) {
        this.bookList = bookList;
    }

    public List<String> getTypeList() {
        return typeList;
    }

    public void setTypeList(List<String> typeList) {
        this.typeList = typeList;
    }

    @Override
    public String toString() {
        return "BookList{"+
                "book=" + bookList +
                ", typeList=" + typeList +
                '}';
    }
}
