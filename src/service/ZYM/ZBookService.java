package service.ZYM;

import dao.ZYM.ZBookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.ZYM.ZBook;

import java.util.List;

@Service
public class ZBookService {
    @Autowired
    private ZBookMapper ZBookMapper;

    public List<ZBook> selectBookAll(ZBook book){
        System.out.println("搜索中");
        return ZBookMapper.selectBookAll(book);
    }
    public List<ZBook> selectBookByLeixing(int id){
        return ZBookMapper.selectBookByLeixing(id);
    }
}
