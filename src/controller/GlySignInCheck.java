package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.Manager;
import service.ManagerService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;


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
        String nowTime = getNowTime();
        System.out.println(nowTime);
        System.out.println(nowTime+"---成功调用管理员验证程序......");
//        System.out.println(manager.toString());
        return service.managerCheck(manager)?"1":"2";
    }

    @RequestMapping("/houtai-index")
    public String toHoutai(String username, HttpServletRequest request) {
        request.getSession().setAttribute("username",username);
        String nowTime = getNowTime();
        System.out.println(nowTime+"---成功调用后台跳转程序......");
        return "houtai-xinxitongji";
    }


    public String getNowTime() {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        System.out.println(format.format(date));
        return format.format(date);
    }
}
