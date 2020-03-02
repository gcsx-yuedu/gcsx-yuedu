package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.User;
import po.Book;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
public class UserController {


    @Autowired
    private UserService service;

    @RequestMapping("/user_info")
    public String list(int id,Model model){
        List<Book> list = service.queryBookById(id);
        model.addAttribute("list",list);
        return "user_info";
    }

    @RequestMapping("/user_change")

    public String UpdateUser(User user) {
        service.updateUser(user);
        return "redirect:user_info";
    }

}
