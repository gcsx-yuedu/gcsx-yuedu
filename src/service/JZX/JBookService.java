package service.JZX;


import dao.JZX.JBookDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.JZX.*;

import java.util.List;

@Service
public class JBookService {
    @Autowired
    private JBookDao bookDao;

    public JBook queryBook(Integer id){
        return bookDao.queryBook(id);
    }
    public List<Integer> getTypeID(Integer book_id){return  bookDao.getTypeID(book_id);}
    public String getTypeByID(Integer t_id){return bookDao.getTypeByTypeID(t_id);}

    public void addShortComm(JShortComm sc){bookDao.addShortComm(sc);}
    public List<JShortComm> queryShortComm(Integer shuji_id){return bookDao .queryShortComm(shuji_id);}
    public String getNameByID(Integer u_id){return bookDao.getNameByID(u_id);}
    public void dianzan(Integer totalClick,Integer id){bookDao.dianzan(totalClick,id);}
    public void quxiao(Integer totalClick,Integer id){bookDao.quxiao(totalClick,id);}

    public Integer selectDianZanShortComm(Integer dianzanren_id, Integer shortcomm_id) {
        return bookDao.selectDianZanShortComm(dianzanren_id, shortcomm_id);
    }

    public void addDianZan(JDianzan dianzan) {
        bookDao.addDianZan(dianzan);
    }

    public void deleteDianzan(Integer dianzanren_id, Integer shortcomm_id) {
        bookDao.deleteDianzan(dianzanren_id,shortcomm_id);
    }

    public void shouCang( Integer user_id,  Integer book_id){
        bookDao.shouCang(user_id,book_id);
    }

    public void quXiaoShouCang(Integer user_id,  Integer book_id){
        bookDao.quXiaoShouCang(user_id,book_id);
    }

    public Integer JuserIsForbid(Integer u_id){
        return bookDao.JuserIsForbid(u_id);
    }

    public Integer isBookInShelf( Integer user_id,  Integer book_id){
        return bookDao.isBookInShelf(user_id, book_id);
    }

    public Integer isPingFen( Integer u_id, Integer book_id){
        return bookDao.isPingFen(u_id, book_id);
    }

    public Integer getScore(Integer u_id, Integer book_id){
        return bookDao.getScore(u_id, book_id);
    }

    public void updateScore( Integer score,Integer u_id,  Integer book_id){
        bookDao.updateScore(score, u_id, book_id);
    }

    public void addScore(JPingFen pingFen) {
        bookDao.addScore(pingFen);
    }
}
