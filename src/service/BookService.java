package service;

import dao.BookMapper;
import dao.ManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.Book;
import po.BookType;
import po.Book_Type;
import po.Manager;

import java.util.List;

@Service
public class BookService {
    @Autowired
    private BookMapper BookDao;

    public List<Book> selectBookAll(Book book){
        return BookDao.selectBookAll(book);
    }
}
