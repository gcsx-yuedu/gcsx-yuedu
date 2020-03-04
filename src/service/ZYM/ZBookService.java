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

    public List<ZBook> selectBookAll(String wenzi){
        System.out.println("搜索中"+wenzi);
        return ZBookMapper.selectBookAll(wenzi);
    }
    public List<ZBook> selectBookByLeixing(int id){
        return ZBookMapper.selectBookByLeixing(id);
    }

    public List<ZBook> selectAll(String wenzi){
        System.out.println("搜索ing"+wenzi);
        return ZBookMapper.selectBookAll(wenzi);
    }
}
