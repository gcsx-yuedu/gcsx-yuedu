package dao;

import org.springframework.stereotype.Repository;
import po.Book;
import po.BookType;
import po.Book_Type;
import po.Manager;

import java.util.List;

@Repository
public interface ManagerDao {
//    是否存在该管理员账号
    public Integer SelectAdmin(Manager manager);

//用户总数
    public Integer userNum();

    //    书籍总数
    public Integer bookNum();

    public Integer commentNum();

    public Integer huitieNum();

    public Integer userNvNum();

    public Integer userNanNum();

    public List<BookType> selectBookType();

    public void addBookType(String t_type);

    public Integer sameType(BookType bookType);

    public void saveBookType(Book_Type book_type);

    public Integer selectBookIdByBookName(String b_name);

    public void addBook(Book book);

    public Integer sameBookName(String b_name);

    public List<Book> selectAllBook(Integer c_id);

    public List<Integer> getTypeId(Integer book_id);

    public String getTypeByTypeId(Integer t_id);
}
