package service.JZX;


import dao.JZX.JBookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.JZX.JBook;
import po.JZX.JBookShelf;
import po.JZX.JDianzan;
import po.JZX.JShortComm;

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

    public void addShoucang(JBookShelf bookShelf){bookDao.addShoucang(bookShelf);}
    public Integer selectShoucang(Integer user_id,Integer book_id){return bookDao.selectShoucang(user_id,book_id);}
    public void deleteShoucang(Integer user_id,Integer book_id){bookDao.deleteShoucang(user_id, book_id);}

}
