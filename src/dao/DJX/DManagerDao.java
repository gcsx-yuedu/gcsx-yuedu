package dao.DJX;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import po.DJX.*;

import java.util.List;

@Repository
public interface DManagerDao {
//    是否存在该管理员账号
    public Integer SelectAdmin(DManager manager);

//用户总数
    public Integer userNum();

    //    书籍总数
    public Integer bookNum();

    public Integer commentNum();

    public Integer huitieNum();

    public Integer userNvNum();

    public Integer userNanNum();

    public List<DBookType> selectBookType();

    public void addBookType(String t_type);

    public Integer sameType(DBookType bookType);

    public void saveBookType(DBook_Type book_type);

    public Integer selectBookIdByBookName(String b_name);

    public void addBook(DBook book);

    public Integer sameBookName(String b_name);

    public List<DBook> selectAllBook(Integer pg);

    public List<Integer> getTypeId(Integer book_id);

    public String getTypeByTypeId(Integer t_id);

    public List<DBookType> selectAllBookType(Integer pageNumber);

    public Integer selectTypeSum();

    public void deleteType(Integer t_id);

    public void deleteBookType(Integer book_id);

    public void updateBookInfo(DBook book);

    public Integer getTypeNum(Integer type_id);

    public List<DUserinfo> getAllUserInfo();

    public void forbidUser(Integer u_id);

    public void unForbidUser(Integer u_id);

    public void deleteBook(Integer b_id);

    public Integer checkUserInfo(DUserinfo userinfo);

    public Integer getUidByUname(String u_name);

    public Integer sameUserName(String u_nam);

    public void addUser(DUserinfo userinfo);

    public List<DLongComm> getAllLongComm(@Param("book_id") Integer book_id,@Param("pageNum") Integer pageNum);

    public Integer getLongCommNum();

    public void addLongComm(DLongComm comm);

    public Integer longCommNum();

    public Integer getShortNumByTime(String time);

    public Integer getLongNumByTime(String lc_time);

    public Integer getHuiTieNumByTime(String huitie_time);

    public DLongComm getLongCommById(Integer lc_id);

    public List<DHuitie> getHuitieById(Integer tiezi_id);

    public String getAuthorNameById(Integer u_id);


    public Integer selectDianZanLongComm(@Param("dianzanren_id") Integer dianzanren_id, @Param("longcomm_id") Integer longcomm_id);

    public List<DLongComm> getLongCommByUserId(Integer author_id);

    public void addHuitie(DHuitie huitie);

    public Integer userIsForbid(Integer u_id);

    public void addLongCommComent(@Param("comment") Integer comment, @Param("lc_id") Integer lc_id);

    public List<DPingFen> getAllScoreByUserId(Integer u_id);

    public Integer DisPingFen(@Param("u_id") Integer u_id, @Param("book_id") Integer book_id);

    public Integer DgetScore(@Param("u_id") Integer u_id, @Param("book_id") Integer book_id);

    public List<DBookType> getAllBookType();

    public List<Integer> getBookIdByTypeId(Integer type_id);

    public List<DBook> DgetAllBook();

    public Integer isBookScore(@Param("u_id") Integer u_id, @Param("book_id") Integer book_id);

    public Integer isBookType(@Param("book_id") Integer book_id, @Param("type_id") Integer type_id);

    public DBook getBookInfoByBookName(String b_name);
}
