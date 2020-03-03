package service.BSJ;

import dao.BSJ.BUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.BSJ.*;

import java.util.List;

@Service
@Transactional
public class BUserService {
    @Autowired
    private BUserDao BUserDao;
    public int updateUser(BUser user) {
        return BUserDao.updateUser(user);
    }
    public List<BBook> queryBookById(int id){ return BUserDao.queryBookById(id);}
}
