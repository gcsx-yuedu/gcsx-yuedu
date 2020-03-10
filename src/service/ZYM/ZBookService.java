package service.ZYM;

import dao.ZYM.ZBookMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.ZYM.*;

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
    public List<ZLongComm> selectLongcomm(){return bookDao.selectLongcomm();}
    public List<ZUser> getUser(){ return bookDao.getUser();}
    public Integer getCountFans(Integer guanzhu_userid) {
        return bookDao.getCountFans(guanzhu_userid);
    }
    public Integer getLines(ZGuanzhu gz){return bookDao.getLines(gz);}
    public void guanzhu(ZGuanzhu gz){ bookDao.guanzhu(gz); }
    public List<ZBook> getBook(){ return bookDao.getBook();}
    public Integer getCount(Integer book_id){ return bookDao.getCount(book_id);}
}
