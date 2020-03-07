package dao.BSJ;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import po.BSJ.*;

import java.util.List;

@Repository
public interface BUserMapper {
    public void updateUser(BUser user);
    public List<BUser> queryUserById(Integer u_id);
    public List<BBookShelf> queryShelfById(Integer u_id);
    public List<BBook> selectBookById(Integer b_id);
    public List<Integer> getTypeId(Integer book_id);
    public String getTypeByTypeId(Integer t_id);
    public List<BGuanzhu> getGuanzhuId(Integer user_id);
    public List<BGuanzhu> getFansId(Integer guanzhu_userid);
//    public Integer getCountConcern( Integer user_id);
    public Integer getCountFans(Integer guanzhu_userid);
    public void cancelConcern(Integer guanzhu_userid);
    public void guanzhu(BGuanzhu gz);
    public List<BShortComm> getCommById(Integer fatie_id);
    public List<BBook> getBookById(Integer b_id);
    public List<BArticle> getArticle(Integer author_id);
    public void deleteShort(String fatie_time);
    public void deleteArticle(String lc_time);
    public List<BHuitie> getHuitieNews(Integer tiezi_id);
}
