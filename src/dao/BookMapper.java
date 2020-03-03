package dao;

import po.Book;

import java.util.List;

public interface BookMapper {
    public List<Book> selectBookAll(Book book);

    public List<Book> selectBookByLeixing(int id);
}
