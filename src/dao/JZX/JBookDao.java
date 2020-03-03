package dao.JZX;

import po.JZX.JBook;
import org.springframework.stereotype.Repository;

@Repository
public interface JBookDao {
    public JBook queryBook(JBook book);
}