package service.ZYM;

import dao.ZYM.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.BSJ.Book;

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
