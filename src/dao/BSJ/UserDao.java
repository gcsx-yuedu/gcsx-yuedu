package dao.BSJ;

import org.springframework.stereotype.Repository;
import po.BSJ.*;

import java.util.List;

@Repository
public interface UserDao {
    public int updateUser(User user);
    public List<Book> queryBookById(int id);
}
