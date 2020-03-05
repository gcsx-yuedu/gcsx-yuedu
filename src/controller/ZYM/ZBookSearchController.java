package controller.ZYM;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import po.ZYM.ZBook;
import po.ZYM.ZBookShelf;
import po.ZYM.ZBookType;
import service.ZYM.ZBookService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ZBookSearchController {
    @Autowired
    private ZBookService zBookService;

    //
    @RequestMapping("/book_search")
    public String QueryBook(String wenzi, HttpServletRequest request){
        List<ZBook> books = zBookService.queryBook(wenzi);
        List<ZBookType> types = zBookService.selectAllType();
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
        request.getSession().setAttribute("types",types);
        return "book_search";
    }

    public List<String> getBookType(Integer b_id){
        List<Integer> typeid = zBookService.getTypeID(b_id);
        List<String> type = new ArrayList<>();
        for (Integer i : typeid) {
            String t_type = zBookService.getTypeByID(i);
            type.add(t_type);
        }
        return type;
    }

    //添加至书架，待完善
    @RequestMapping("/addToShelf")
    public String addToShelf(ZBookShelf bookf){
        zBookService.addToShelf(bookf);
        System.out.println("已添加，准备跳转");
        return "book_search";
    }

    //点击类型跳转至该类型下书籍，待完善
    @RequestMapping("/showBookByType")
    public String bookByType(int t_id,HttpServletRequest request){
        System.out.println("con t_id="+t_id);
        request.getSession().setAttribute("t_id",t_id);
        List<ZBookType> types = zBookService.selectAllType();
        request.getSession().setAttribute("types",types);
        return "book_type";
    }

}
