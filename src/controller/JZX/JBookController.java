package controller.JZX;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import po.JZX.JBook;
import service.JZX.JBookService;

public class JBookController {
    @Autowired
    private JBookService bookService;

    @RequestMapping("/book_infor")
    public String QueryBook(JBook book){
        bookService.queryBook(book);
        return "redirect:book_infor";
    }
}
