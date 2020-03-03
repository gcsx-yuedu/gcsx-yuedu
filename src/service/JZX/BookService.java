package service.JZX;


import dao.JZX.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.JZX.Book;

@Service
public class BookService {
    @Autowired
    private BookDao bookDao;

    public Book queryBook(Book book){
        return bookDao.queryBook(book);
    }
}
