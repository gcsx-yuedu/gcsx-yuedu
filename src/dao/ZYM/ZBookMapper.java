package dao.ZYM;

import po.ZYM.ZBook;
import po.ZYM.ZBookShelf;
import po.ZYM.ZBookType;

import java.util.List;

public interface ZBookMapper {
    public List<ZBook> queryBook(String wenzi);
    public List<Integer> getTypeID(Integer book_id);
    public String getTypeByTypeID(Integer t_id);
    public void addToShelf(ZBookShelf bookf);
    public List<ZBookType> selectAllType();
}
