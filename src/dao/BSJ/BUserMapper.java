package dao.BSJ;

import org.springframework.stereotype.Repository;
import po.BSJ.*;

import java.util.List;

@Repository
public interface BUserMapper {
    public int updateUser(BUser user);
    public List<BUser> queryUserById(int u_id);
    public List<BBookShelf> queryShelfById(int u_id);
    public List<BBook> selectBookById(Integer b_id);
    public List<Integer> getTypeId(Integer book_id);
    public String getTypeByTypeId(Integer t_id);
}
