package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.User;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
public class UserController {


    @Autowired
    private UserService service;

    @RequestMapping("/user_change")

    public String UpdateUser(User user) {
        service.updateUser(user);
        return "redirect:user_info";
    }

}
