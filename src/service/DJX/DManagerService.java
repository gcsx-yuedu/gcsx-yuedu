package service.DJX;

import dao.DJX.DManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.DJX.DBook;
import po.DJX.DBookType;
import po.DJX.DBook_Type;
import po.DJX.DManager;

import java.util.List;

@Service
@Transactional
public class DManagerService {
    @Autowired
    private DManagerDao DManagerDao;

    public boolean managerCheck(DManager manager) {
//        System.out.println(manager.toString());
//        System.out.println(managerDao.SelectAdmin(manager));
        return DManagerDao.SelectAdmin(manager) == 1;
    }


    public Integer getUserNum() {
//        System.out.println("成功调用getUserNum()方法......");
        return DManagerDao.userNum();
    }

    public Integer getBookNum() {
        return DManagerDao.bookNum();
    }

    public Integer getCommentNum() {
        return DManagerDao.commentNum();
    }

    public Integer getHuitieNum() {
        return DManagerDao.huitieNum();
    }

    public Integer getUserNvNum() {
        return DManagerDao.userNvNum();
    }

    public Integer getUserNanNum() {
        return DManagerDao.userNanNum();
    }

    public List<DBookType> selectBookType() {
        return DManagerDao.selectBookType();
    }

    public void addBookType(String t_type) {
        DManagerDao.addBookType(t_type);
    }

    public Integer sameType(DBookType bookType) {
        return DManagerDao.sameType(bookType);
    }

    public void saveBookType(DBook_Type book_type) {
        DManagerDao.saveBookType(book_type);
    }

    public Integer selectBookIdByBookName(String b_name) {
        return DManagerDao.selectBookIdByBookName(b_name);
    }

    public void addBook(DBook book) {
        DManagerDao.addBook(book);
    }

    public boolean sameBookName(String b_name) {
        return DManagerDao.sameBookName(b_name)==0;
    }

    public List<DBook> selectAllBook(Integer b_id) {
        return DManagerDao.selectAllBook(b_id);
    }

    public List<Integer> getTypeId(Integer book_id) {
        return DManagerDao.getTypeId(book_id);
    }

    public String getTypeByTypeId(Integer t_id){
        return DManagerDao.getTypeByTypeId(t_id);

    }

    public List<DBookType> selectAllBookType() {
        return DManagerDao.selectAllBookType();
    }
}
