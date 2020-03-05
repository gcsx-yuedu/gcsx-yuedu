package po.ZYM;

import java.util.List;

public class ZBookShelfList {
    //    private List<BUser> list;
    private ZBook bookList;
    private List<String> typeList;

//    public List<BUser> getList() {
//        return list;
//    }
//
//    public void setList(List<BUser> list) {
//        this.list = list;
//    }

    public ZBook getBookList() {
        return bookList;
    }

    public void setBookList(ZBook bookList) {
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