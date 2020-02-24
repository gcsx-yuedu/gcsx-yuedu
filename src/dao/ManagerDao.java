package dao;

import org.springframework.stereotype.Repository;
import po.Manager;

@Repository
public interface ManagerDao {
    public Manager SelectAdmin();
}
