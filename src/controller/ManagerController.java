package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import po.Manager;
import service.ManagerService;

@Controller
public class ManagerController {
    @Autowired
    private ManagerService managerService;

    @RequestMapping("/selectAdmin")
    public String selectAdmin() {
        Manager manager = managerService.selectAdmin();
        System.out.println("Manager information");
        System.out.println(manager.toString());
        return "sign-up-yh";
    }
}
