package dao.DJX;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import po.DJX.DBook;
import po.DJX.DBookType;
import po.DJX.DBook_Type;
import po.DJX.DManager;

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

    public List<DBook> selectAllBook(@Param(value="b_id")Integer b_id);

    public List<Integer> getTypeId(Integer book_id);

    public String getTypeByTypeId(Integer t_id);

    public List<DBookType> selectAllBookType(Integer pageNumber);

    public Integer selectTypeSum();

    public void deleteType(Integer t_id);

    public void deleteBookType(Integer book_id);

    public void updateBookInfo(DBook book);
}
