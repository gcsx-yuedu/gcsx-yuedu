package controller.ZYM;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.ZYM.*;
import service.ZYM.*;

import java.util.List;

@Controller
public class BookSearchController {
    @Autowired
    private ZBookService ZBookService;
    @RequestMapping("/book_search")
    public String booksearchlist(ZBook book, Model model){
        List<ZBook> list = ZBookService.selectBookAll(book);
        return "redirect:book_search";

    }

}
