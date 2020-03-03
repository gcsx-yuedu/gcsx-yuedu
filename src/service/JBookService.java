package service;


import dao.JBookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.Book;

@Service
public class JBookService {
    @Autowired
    private JBookDao bookDao;

    public Book queryBook(Book book){
        return bookDao.queryBook(book);
    }
}
