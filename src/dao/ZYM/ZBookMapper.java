package dao.ZYM;

import po.ZYM.ZBook;

import java.util.List;

public interface ZBookMapper {
    public List<ZBook> selectBookAll(String wenzi);

    public List<ZBook> selectBookByLeixing(int id);

    public List<ZBook> selectAll(String wenzi);
}
