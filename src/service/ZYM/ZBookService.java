package service.ZYM;

import dao.ZYM.ZBookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.ZYM.ZBook;

import java.util.List;

@Service
public class ZBookService {
    @Autowired
    private ZBookMapper bookDao;
    public List<ZBook> queryBook(String wenzi){
        return bookDao.queryBook(wenzi);
    }
    public List<Integer> getTypeID(Integer book_id){return  bookDao.getTypeID(book_id);}
    public String getTypeByID(Integer t_id){return bookDao.getTypeByTypeID(t_id);}

}
