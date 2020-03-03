package dao.JZX;

import po.JZX.JBook;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JBookDao {
    public List<JBook> queryBook(Integer id);
}