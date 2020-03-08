package dao.JZX;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import po.JZX.JBook;
import po.JZX.JBookShelf;
import po.JZX.JDianzan;
import po.JZX.JShortComm;


import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

@Repository
public interface JBookDao {
    public JBook queryBook(Integer id);
    public List<Integer> getTypeID(Integer book_id);
    public String getTypeByTypeID(Integer t_id);

    public void addShortComm(JShortComm sc);
    public List<JShortComm> queryShortComm(Integer shuji_id);
    public String getNameByID(Integer u_id);

    public void dianzan(@Param("totalClick") Integer totalClick,@Param("id") Integer id);
    public void quxiao(@Param("totalClick") Integer totalClick,@Param("id") Integer id);

    public Integer selectDianZanShortComm(@Param("dianzanren_id") Integer dianzanren_id, @Param("shortcomm_id") Integer shortcomm_id);

    public void addDianZan(JDianzan dianzan);
    public void deleteDianzan(@Param("dianzanren_id") Integer dianzanren_id, @Param("shortcomm_id") Integer shortcomm_id);

    public void shouCang(@Param("user_id") Integer user_id, @Param("book_id") Integer book_id);

    public void quXiaoShouCang(@Param("user_id") Integer user_id, @Param("book_id") Integer book_i);

    public Integer JuserIsForbid(Integer u_id);

    public Integer isBookInShelf(@Param("user_id") Integer user_id, @Param("book_id") Integer book_id);
}
