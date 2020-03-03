package service.BSJ;

import dao.BSJ.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.BSJ.*;

import java.util.List;

@Service
@Transactional
public class UserService {
    @Autowired
    private UserDao userDao;
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }
    public List<Book> queryBookById(int id){ return userDao.queryBookById(id);}
}
