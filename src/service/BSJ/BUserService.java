package service.BSJ;

import dao.BSJ.BUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.BSJ.*;

import java.util.List;

@Service
@Transactional
public class BUserService {
    @Autowired
    private BUserMapper BUserDao;
    public int updateUser(BUser user) {
        return BUserDao.updateUser(user);
    }
        public List<BUser> queryUserById(int id){ return BUserDao.queryUserById(id);}
}
