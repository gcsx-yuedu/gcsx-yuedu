package controller.JZX;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.JZX.JBook;
import po.JZX.JBookList;
import po.JZX.JShortComm;
import service.JZX.JBookService;

import javax.servlet.http.HttpServletRequest;
import java.awt.print.Book;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class JBookController {
    @Autowired
    private JBookService bookService;

    @RequestMapping("/book_infor")
    public String QueryBook(Integer id, HttpServletRequest request){
//        bookService.queryBook(id);
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        JBook book=bookService.queryBook(27);
        List<String> bookType = getBookType(book.getB_id());
        String res=new String((byte[])book.getB_cover());
        book.setB_cover(res);
        book.setTypeList(bookType);
//        bookList.setBook(book);
        List<JShortComm> shortComm=bookService.queryShortComm(27);
        for(JShortComm sc : shortComm){
//            System.out.println(sc.getFatie_id());
            String u_name=bookService.getNameByID(sc.getFatie_id());
            sc.setFatie_name(u_name);
        }
        System.out.println(">>>");
        System.out.println(book.toString());
        System.out.println(">>>");
        System.out.println(shortComm.toString());
        request.getSession().setAttribute("ShortComm",shortComm);
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
    /*添加短评*/
    @ResponseBody
    @RequestMapping("/addShortComm")
    public String addShortComm(JShortComm sc){
        String time=getNowTime();
        sc.setFatie_time(time);
        bookService.addShortComm(sc);
        System.out.println(">>>");
        System.out.println("短评添加成功");
        return "/book_infor";
    }
    /*获取当前系统时间*/
    public String getNowTime() {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        System.out.println(format.format(date));
        return format.format(date);
    }
//    /*获取短评*/
//    @RequestMapping("/queryShortComm")
//    public String queryShortComm(Integer shuji_id,HttpServletRequest request){
//        List<JShortComm> shortComm=bookService.queryShortComm(27);
//        for(JShortComm sc : shortComm){
//            String u_name=bookService.getNameByID(sc.getFatie_id());
//            sc.setFatie_name(u_name);
//        }
//        System.out.println(">>>");
//        System.out.println(shortComm.toString());
//        request.getSession().setAttribute("ShortComm",shortComm);
//        return "book_infor";
//    }


}
