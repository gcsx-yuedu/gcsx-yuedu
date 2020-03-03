package dao.ZYM;

import po.BSJ.Book;

import java.util.List;

public interface ZBookMapper {
    public List<Book> selectBookAll(Book book);

    public List<Book> selectBookByLeixing(int id);
}
