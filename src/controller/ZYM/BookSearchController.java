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
        List<ZBook> listsearch = ZBookService.selectBookAll(book);
        model.addAttribute("listsearch",listsearch);
        return "redirect:book_search";
    }

    @RequestMapping("/book_type")
    public String booktypelist(Integer id, Model model){
        List<ZBook> listtype = ZBookService.selectBookByLeixing(id);
        model.addAttribute("listtype",listtype);
        return "redirect:book_type";
    }
}
