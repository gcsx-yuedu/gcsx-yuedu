package service.serviceImpl;

import dao.ManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.Manager;
import service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerDao managerDao;

    @Override
    public Manager selectAdmin() {
        return managerDao.SelectAdmin();
    }
}
