package service;

import dao.ManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.Manager;

@Service
public class ManagerService {
    @Autowired
    private ManagerDao managerDao;

    public boolean managerCheck(Manager manager) {
//        System.out.println(manager.toString());
//        System.out.println(managerDao.SelectAdmin(manager));
        return managerDao.SelectAdmin(manager) == 1;
    }
}
