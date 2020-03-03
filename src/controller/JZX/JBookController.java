package controller.JZX;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import po.JZX.JBook;
import service.JZX.JBookService;

import javax.servlet.http.HttpServletRequest;
import java.awt.print.Book;
import java.util.List;

@Controller
public class JBookController {
    @Autowired
    private JBookService bookService;

    @RequestMapping("/book_infor")
    public String QueryBook(Integer id, HttpServletRequest request){
//        bookService.queryBook(id);
        JBook book=bookService.queryBook(27);
        System.out.println(">>>");
        System.out.println(book.toString());
        request.getSession().setAttribute("book",book);
        return "book_infor";
    }
}
