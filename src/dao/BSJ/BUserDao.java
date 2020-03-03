package dao.BSJ;

import org.springframework.stereotype.Repository;
import po.BSJ.*;

import java.util.List;

@Repository
public interface BUserDao {
    public int updateUser(BUser user);
    public List<BBook> queryBookById(int id);
}
