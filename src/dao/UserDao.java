package dao;

import org.springframework.stereotype.Repository;
import po.User;

import java.util.List;

@Repository
public interface UserDao {
    public int updateTeacher(User user);
}
