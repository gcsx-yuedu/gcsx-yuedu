package controller.JZX;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import po.JZX.JBook;
import service.JZX.JBookService;

import java.awt.print.Book;
import java.util.List;

public class JBookController {
    @Autowired
    private JBookService bookService;

    @RequestMapping("/book_infor")
    public String QueryBook(Integer id){
//        bookService.queryBook(id);
        List<JBook> bookList=bookService.queryBook(id);
        System.out.println(bookList.toString());
        return "redirect:book_infor";
    }
}
