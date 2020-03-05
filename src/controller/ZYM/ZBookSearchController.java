package controller.ZYM;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import po.ZYM.ZBook;
import service.ZYM.ZBookService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ZBookSearchController {
    @Autowired
    private ZBookService ZBookService;
    @RequestMapping("/book_search")
    public String QueryBook(String wenzi, HttpServletRequest request){
        List<ZBook> books=ZBookService.queryBook(wenzi);
        for (ZBook book:books){
            List<String> bookType = getBookType(book.getB_id());
            String res=new String((byte[])book.getB_cover());
            book.setB_cover(res);
            book.setTypeList(bookType);

//            System.out.println(book.toString());
        }
        System.out.println("长度："+books.size());
        request.getSession().setAttribute("count",books.size());
        request.getSession().setAttribute("books",books);
        return "book_search";
    }
    public List<String> getBookType(Integer b_id){
        List<Integer> typeid=ZBookService.getTypeID(b_id);
        List<String> type=new ArrayList<>();
        for (Integer i : typeid) {
            String t_type = ZBookService.getTypeByID(i);
            type.add(t_type);
        }
        return type;
    }
}
