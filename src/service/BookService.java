package service;

import dao.BookMapper;
import dao.DJX.ManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.BSJ.Book;
import po.BSJ.BookType;
import po.BSJ.Book_Type;

import java.util.List;

@Service
public class BookService {
    @Autowired
    private BookMapper bookMapper;

    public List<Book> selectBookAll(Book book){
        return bookMapper.selectBookAll(book);
    }
    public List<Book> selectBookByLeixing(int id){
        return bookMapper.selectBookByLeixing(id);
    }
}
