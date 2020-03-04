package controller.JZX;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import po.JZX.JBook;
import po.JZX.JBookList;
import service.JZX.JBookService;

import javax.servlet.http.HttpServletRequest;
import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

@Controller
public class JBookController {
    @Autowired
    private JBookService bookService;

    @RequestMapping("/book_infor")
    public String QueryBook(Integer id, HttpServletRequest request){
//        bookService.queryBook(id);
        JBook book=bookService.queryBook(27);
        List<String> bookType = getBookType(book.getB_id());
        String res=new String((byte[])book.getB_cover());
        book.setB_cover(res);
        book.setTypeList(bookType);
//        bookList.setBook(book);
        System.out.println(">>>");
        System.out.println(book.toString());
        request.getSession().setAttribute("book",book);
        return "book_infor";
    }
    public List<String> getBookType(Integer b_id){
        List<Integer> typeid=bookService.getTypeID(b_id);
        List<String> type=new ArrayList<>();
        for (Integer i : typeid) {
            String t_type = bookService.getTypeByID(i);
            type.add(t_type);
        }
        return type;
    }
}
