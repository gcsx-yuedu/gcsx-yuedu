package dao;

import po.Book;
import org.springframework.stereotype.Repository;

@Repository
public interface JBookDao {
    public Book queryBook(Book book);
}