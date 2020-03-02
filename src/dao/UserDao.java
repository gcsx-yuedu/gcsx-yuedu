package dao;

import org.springframework.stereotype.Repository;
import po.User;
import po.Book;

import java.util.List;

@Repository
public interface UserDao {
    public int updateUser(User user);
    public List<Book> queryBookById(int id);
}
