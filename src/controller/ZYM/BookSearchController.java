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
    public String booksearchlist(String wenzi, Model model){
        List<ZBook> listsearch = ZBookService.selectAll(wenzi);
        System.out.println("查询结束");
        for (ZBook rs:listsearch){
            System.out.println("长度："+listsearch.size());
            System.out.println("书名："+rs.getB_name());
            System.out.println("类型："+rs.getBook_TypeList());
        }
        model.addAttribute("listsearch",listsearch);
        System.out.println("准备跳转");
        return "book_search";
    }

    @RequestMapping("/book_type")
    public String booktypelist(Integer id, Model model){
        List<ZBook> listtype = ZBookService.selectBookByLeixing(id);
        model.addAttribute("listtype",listtype);
        return "book_type";
    }
}
