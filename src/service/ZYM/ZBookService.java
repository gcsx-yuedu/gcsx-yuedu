package service.ZYM;

import dao.ZYM.ZBookMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.ZYM.ZBook;
import po.ZYM.ZBookShelf;
import po.ZYM.ZBookType;

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
    public void addToShelf(ZBookShelf shelf){ bookDao.addToShelf(shelf); }
    public List<ZBookType> selectAllType(){ return bookDao.selectAllType(); }
    public List<Integer> selectBookIdByTypeId(int t_id){return bookDao.selectBookIdByTypeId(t_id);}
    public ZBook selectBookByBookId(int b_id){return bookDao.selectBookByBookId(b_id);}
    public Integer getCountOfShelfBook(ZBookShelf shel){
        System.out.println("查询成功");
        return bookDao.getCountOfShelfBook(shel);}
}
