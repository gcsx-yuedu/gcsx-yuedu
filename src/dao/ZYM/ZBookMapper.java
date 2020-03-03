package dao.ZYM;

import po.ZYM.ZBook;

import java.util.List;

public interface ZBookMapper {
    public List<ZBook> selectBookAll(ZBook book);

    public List<ZBook> selectBookByLeixing(int id);
}
