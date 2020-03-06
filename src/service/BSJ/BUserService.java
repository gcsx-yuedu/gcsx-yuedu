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
//    public Integer getCountConcern(Integer user_id) {
//        return BUserDao.getCountConcern(user_id);
//    }
    public Integer getCountFans(Integer guanzhu_userid) {
        return BUserDao.getCountFans(guanzhu_userid);
    }
    public void cancelConcern(Integer guanzhu_userid){ BUserDao.cancelConcern(guanzhu_userid); }
    public void guanzhu(BGuanzhu gz){ BUserDao.guanzhu(gz); }
    public List<BShortComm> getCommById(Integer u_id){ return BUserDao.getCommById(u_id); }
    public List<BBook> getBookById(Integer b_id){ return BUserDao.getBookById(b_id); }
    public List<BArticle> getArticle(Integer author_id){ return BUserDao.getArticle(author_id);}
    public void deleteShort(String fatie_time){ BUserDao.deleteShort(fatie_time);}
    public void deleteArticle(String lc_time){ BUserDao.deleteArticle(lc_time);}
    public List<BHuitie> getHuitieNews(Integer tiezi_id){ return BUserDao.getHuitieNews(tiezi_id);}
}
