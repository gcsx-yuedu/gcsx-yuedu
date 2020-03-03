package dao.JZX;

import po.JZX.Book;
import org.springframework.stereotype.Repository;

@Repository
public interface BookDao {
    public Book queryBook(Book book);
}