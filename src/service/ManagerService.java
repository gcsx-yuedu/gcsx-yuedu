package service;

import org.springframework.stereotype.Service;
import po.Manager;

@Service
public interface ManagerService {
    public Manager selectAdmin();
}
