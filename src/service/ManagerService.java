package service;

import dao.ManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.BookType;
import po.Manager;

import java.util.List;

@Service
@Transactional
public class ManagerService {
    @Autowired
    private ManagerDao managerDao;

    public boolean managerCheck(Manager manager) {
//        System.out.println(manager.toString());
//        System.out.println(managerDao.SelectAdmin(manager));
        return managerDao.SelectAdmin(manager) == 1;
    }


    public Integer getUserNum() {
//        System.out.println("成功调用getUserNum()方法......");
        return managerDao.userNum();
    }

    public Integer getBookNum() {
        return managerDao.bookNum();
    }

    public Integer getCommentNum() {
        return managerDao.commentNum();
    }

    public Integer getHuitieNum() {
        return managerDao.huitieNum();
    }

    public Integer getUserNvNum() {
        return managerDao.userNvNum();
    }

    public Integer getUserNanNum() {
        return managerDao.userNanNum();
    }

    public List<BookType> selectBookType() {
        return managerDao.selectBookType();
    }

    public void addBookType(String t_type) {
        managerDao.addBookType(t_type);
    }

    public Integer sameType(BookType bookType) {
        return managerDao.sameType(bookType);
    }
}
