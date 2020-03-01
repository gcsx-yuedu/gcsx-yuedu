package controller;

import net.sf.json.JSONObject;
import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.Book;
import po.BookType;
import po.Manager;
import service.ManagerService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
public class GlySignInCheck {


    @Autowired
    private ManagerService service;

    /*跳转到后台登陆页面*/
    @RequestMapping("/Msignup")
    public String toSignUpGly() {
        return "sign-up-gly";
    }

    /*接收ajax信息并放入session
     * 再跳转到后台首页
     * */
    @RequestMapping("/houtai-index")
    public String houtaiIndex(String username,HttpServletRequest request) {
        request.getSession().setAttribute("username", username);
        return "redirect:houtai-xinxitongji";
    }


    /*验证管理员信息*/
    @ResponseBody
    @RequestMapping("/ManagerCheck")
    public String managerCheck(String name, String password) {
//        System.out.println("name="+name+"  password="+password);
        Manager manager = new Manager();
        manager.setA_name(name);
        manager.setA_password(password);
        String nowTime = getNowTime();
        System.out.println(nowTime);
        System.out.println(nowTime+"---成功调用管理员验证程序......");
//        System.out.println(manager.toString());
        return service.managerCheck(manager)?"1":"2";
    }

//    跳转到信息统计页面
    @RequestMapping("/houtai-xinxitongji")
    public String toHoutai(HttpServletRequest request) {
        //验证登陆session
        String username = (String) request.getSession().getAttribute("username");
        request.getSession().setAttribute("username",username);
        //实现数据查询逻辑
        //用户总数、评论总数、书籍总数
        //近一段时间评论数量
//        书籍按类型分类
//        用户性别统计

//        获取用户总数
        int userNum = service.getUserNum();
        int bookNum = service.getBookNum();
        int commentNum = service.getCommentNum();
        int huitieNum = service.getHuitieNum();
        request.getSession().setAttribute("userNum",userNum);
        request.getSession().setAttribute("bookNum",bookNum);
        request.getSession().setAttribute("commentNum",commentNum+huitieNum);
        String nowTime = getNowTime();
        /*获取用户性别的男女数量并传递到前端页面*/
        int manNum = service.getUserNanNum();
        int womanNum = service.getUserNvNum();
        request.getSession().setAttribute("manNum",manNum);
        request.getSession().setAttribute("womanNum",womanNum);
        System.out.println(nowTime+"---成功调用后台跳转程序......");
        return "houtai-xinxitongji";
    }


    /*跳转到用户管理页面*/
    @RequestMapping("/houtai-yonghuguanli")
    public String toHouTaiYongHuGuanLi(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        request.getSession().setAttribute("username",username);

        return "houtai-yonghuguanli";
    }

    /*跳转到添加书籍页面*/
    /*获取书籍类型的列表*/
    @RequestMapping("houtai-tianjiashuji")
    public String toHouTianJiaShuJi(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        request.getSession().setAttribute("username", username);
        List<BookType> bookTypeList = service.selectBookType();
        System.out.println("BookType="+bookTypeList);
        request.getSession().setAttribute("bookTypeList",bookTypeList);
        return "houtai-tianjiashuji";
    }

    /*跳转到书籍管理页面*/
    @RequestMapping("/houtai-shujiguanli")
    public String toHouTaiShuJiFuanLi(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        request.getSession().setAttribute("username", username);
        return "houtai-shujiguanli";
    }

    /*跳转到举报信息管理页面*/
    @RequestMapping("/houtai-jubaoxinxiguanli")
    public String toHouTaiJuBaoXinXiGuanLi(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        request.getSession().setAttribute("username", username);
        return "houtai-jubaoxinxiguanli";
    }



    /*跳转到添加书籍类型的界面*/
    @RequestMapping("/houtai-tianjiashujileixing")
    public String toHoutaiTianjiaShujiLeixing(HttpServletRequest request) {
        request.getSession().setAttribute("username",request.getSession().getAttribute("username"));
        return "houtai-tianjiashujileixing";
    }

   /* * 添加书籍类型
    * 添加成功之后跳转到添加书籍类型页面
    *
    * */
    @RequestMapping("/addBookType")
    public String addBookType(String t_type,HttpServletRequest request) {
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        service.addBookType(t_type);
        System.out.println(">>>添加成功");
        return "redirect:/houtai-tianjiashujileixing";
    }

    /*判断类型是否重复*/
    @ResponseBody
    @RequestMapping("/sameType")
    public String sameType(String t_type, HttpServletRequest request) {
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        BookType bookType = new BookType();
        bookType.setT_type(t_type);
        System.out.println("t_type="+t_type);
        int f = service.sameType(bookType);
        System.out.println(">>>sameType方法已运行......");
        return String.valueOf(f);
    }

    /*获取当前系统时间*/
    public String getNowTime() {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        System.out.println(format.format(date));
        return format.format(date);
    }

    /*
     * 添加书籍
     * */
    @RequestMapping("/addBook")
    public String addBook(Book book,HttpServletRequest request) {
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        System.out.println(book.toString());
        return "/houtai-tianjiashuji";
    }
}
