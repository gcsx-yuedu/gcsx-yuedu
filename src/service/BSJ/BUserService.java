package service.BSJ;

import dao.BSJ.BUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.BSJ.*;

import java.util.List;

@Service
@Transactional
public class BUserService {
    @Autowired
    private BUserMapper BUserDao;
    public int updateUser(BUser user) {
        return BUserDao.updateUser(user);
    }
    public List<BUser> queryUserById(Integer u_id){ return BUserDao.queryUserById(u_id);}
    public List<BBookShelf> queryShelfById(Integer u_id){ return BUserDao.queryShelfById(u_id);}
    public List<BBook> selectBookById(Integer b_id) {
        return BUserDao.selectBookById(b_id);
    }
    public List<Integer> getTypeId(Integer book_id) {
        return BUserDao.getTypeId(book_id);
    }
    public String getTypeByTypeId(Integer t_id){
        return BUserDao.getTypeByTypeId(t_id);
    }
    public List<BGuanzhu> getGuanzhuId(Integer user_id) {
        return BUserDao.getGuanzhuId(user_id);
    }
    public List<BGuanzhu> getFansId(Integer guanzhu_userid) {
        return BUserDao.getFansId(guanzhu_userid);
    }
    public Integer getCountConcern(Integer user_id) {
        return BUserDao.getCountConcern(user_id);
    }
    public Integer getCountFans(Integer guanzhu_userid) {
        return BUserDao.getCountFans(guanzhu_userid);
    }
}
