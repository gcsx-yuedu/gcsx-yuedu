package service;

import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.User;

import java.util.List;

@Service
@Transactional
public class UserService {
    @Autowired
    private UserDao userDao;
    public int updateUser(User user) {
        return userDao.updateTeacher(user);
    }
}
