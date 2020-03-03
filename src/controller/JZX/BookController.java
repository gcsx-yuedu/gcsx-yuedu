package controller.JZX;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import po.JZX.Book;
import service.JZX.BookService;

public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping("/book_infor")
    public String QueryBook(Book book){
        bookService.queryBook(book);
        return "redirect:book_infor";
    }
}
