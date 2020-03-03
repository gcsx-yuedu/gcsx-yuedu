package service.ZYM;

import dao.ZYM.ZBookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.BSJ.Book;

import java.util.List;

@Service
public class ZBookService {
    @Autowired
    private ZBookMapper ZBookMapper;

    public List<Book> selectBookAll(Book book){
        return ZBookMapper.selectBookAll(book);
    }
    public List<Book> selectBookByLeixing(int id){
        return ZBookMapper.selectBookByLeixing(id);
    }
}
