package dao.ZYM;

import po.ZYM.ZBook;

import java.util.List;

public interface ZBookMapper {
    public List<ZBook> queryBook(String wenzi);
    public List<Integer> getTypeID(Integer book_id);
    public String getTypeByTypeID(Integer t_id);
}
