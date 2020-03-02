package service;

import dao.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.Book;

@Service
@Transactional
public class BookService {
    @Autowired
    private BookDao bookDao;
    public Book queryBook(Book book){return bookDao.queryBook(book);}
}
