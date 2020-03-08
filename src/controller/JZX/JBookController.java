package controller.JZX;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.JZX.JBook;
import po.JZX.JBookList;
import po.JZX.JDianzan;
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
    public String QueryBook(Integer b_id, HttpServletRequest request){
//        bookService.queryBook(id);
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        JBook book=bookService.queryBook(b_id);
        List<String> bookType = getBookType(book.getB_id());
        String res=new String((byte[])book.getB_cover());
        book.setB_cover(res);
        book.setTypeList(bookType);
        int userid = (int) request.getSession().getAttribute("userId");
//        bookList.setBook(book);
        List<JShortComm> shortComm=bookService.queryShortComm(b_id);
        for(JShortComm sc : shortComm){
//            System.out.println(sc.getFatie_id());
            String u_name=bookService.getNameByID(sc.getFatie_id());
            sc.setFatie_name(u_name);
            int userClick = bookService.selectDianZanShortComm(userid, sc.getId());
            sc.setUser_click(userClick);
        }
        System.out.println(">>>");
//        System.out.println(book.toString());
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

    /*
    * 点赞
    * 获取被点赞的短评id
    * 获取目前的点赞总数click
    * 获取点赞人id
    * 存储到点赞表
    * 短评表click字段+1
    * */
    @ResponseBody
    @RequestMapping("/Dianzan")
    public String Dianzan(Integer id,Integer totalClick,HttpServletRequest request){
        /*短评表字段加一*/
        bookService.dianzan(totalClick+1,id);
        /*存储到点赞表*/
        JDianzan dianzan = new JDianzan();
        dianzan.setShortcomm_id(id);
        dianzan.setDianzanren_id((Integer) request.getSession().getAttribute("userId"));
        System.out.println(dianzan.toString());
        bookService.addDianZan(dianzan);
        System.out.println(">>>");
        System.out.println(id + "点赞成功");
        return "ok";
    }

    /*
    * 取消点赞
    * 获取取消点赞的短评的id
    * 获取当前点赞总数click
    * 获取点赞人id
    * 短评表click-1
    * 删除点赞表的某一行记录
    * */
    @ResponseBody
    @RequestMapping("/Quxiao")
    public String Quxiao(Integer id,Integer totalClick,HttpServletRequest request){
        bookService.quxiao(totalClick-1,id);
        bookService.deleteDianzan((Integer) request.getSession().getAttribute("userId"),id);
        System.out.println(">>>");
        System.out.println(id + "取消点赞");
        return "OK";
    }

}
