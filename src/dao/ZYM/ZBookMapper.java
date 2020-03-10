package dao.ZYM;

import po.ZYM.*;

import java.util.List;

public interface ZBookMapper {
    public List<ZBook> queryBook(String wenzi);
    public List<Integer> getTypeID(Integer book_id);
    public String getTypeByTypeID(Integer t_id);
    public void addToShelf(ZBookShelf shelf);
    public List<ZBookType> selectAllType();
    public List<Integer> selectBookIdByTypeId(int t_id);
    public ZBook selectBookByBookId(int b_id);
    public Integer getCountOfShelfBook(ZBookShelf shel);
    public List<ZLongComm> selectLongcomm();
    public List<ZUser> getUser();
    public Integer getCountFans(Integer guanzhu_userid);
    public Integer getLines(ZGuanzhu gz);
    public void guanzhu(ZGuanzhu gz);
    public List<ZBook> getBook();
    public Integer getCount(Integer book_id);
}
