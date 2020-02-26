package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.Manager;
import service.ManagerService;


@Controller
public class GlySignInCheck {


    @Autowired
    private ManagerService service;

    @ResponseBody
    @RequestMapping("/ManagerCheck")
    public String managerCheck(String name, String password) {
//        System.out.println("name="+name+"  password="+password);
        Manager manager = new Manager();
        manager.setA_name(name);
        manager.setA_password(password);
        System.out.println("成功调用管理员验证程序......");
//        System.out.println(manager.toString());
        return service.managerCheck(manager)?"1":"2";
    }
}
