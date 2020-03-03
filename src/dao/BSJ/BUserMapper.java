package dao.BSJ;

import org.springframework.stereotype.Repository;
import po.BSJ.*;

import java.util.List;

@Repository
public interface BUserMapper {
    public int updateUser(BUser user);
    public List<BUser> queryUserById(int id);
}
