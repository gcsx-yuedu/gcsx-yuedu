package controller.BSJ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.BSJ.*;
import service.BSJ.UserService;

import java.util.List;


@Controller
public class UserController {


    @Autowired
    private UserService service;

    @RequestMapping("/user_info")
    public String list(int id,Model model){
        List<po.BSJ.Book> list = service.queryBookById(id);
        model.addAttribute("list",list);
        return "user_info";
    }

    @RequestMapping("/user_change")

    public String UpdateUser(User user) {
        service.updateUser(user);
        return "redirect:user_info";
    }

}
