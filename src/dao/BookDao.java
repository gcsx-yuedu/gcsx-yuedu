package dao;

import po.Book;
import org.springframework.stereotype.Repository;

@Repository
public interface BookDao{
    public Book queryBook(Book book);
}