package controller.DJX;

import com.mysql.jdbc.Blob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.DJX.*;
import service.DJX.ManagerService;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
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
    public String houtaiIndex(String username, HttpServletRequest request) {
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
        System.out.println(nowTime + "---成功调用管理员验证程序......");
//        System.out.println(manager.toString());
        return service.managerCheck(manager) ? "1" : "2";
    }

    //    跳转到信息统计页面
    @RequestMapping("/houtai-xinxitongji")
    public String toHoutai(HttpServletRequest request) {
        //验证登陆session
        String username = (String) request.getSession().getAttribute("username");
        request.getSession().setAttribute("username", username);
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
        request.getSession().setAttribute("userNum", userNum);
        request.getSession().setAttribute("bookNum", bookNum);
        request.getSession().setAttribute("commentNum", commentNum + huitieNum);
        String nowTime = getNowTime();
        /*获取用户性别的男女数量并传递到前端页面*/
        int manNum = service.getUserNanNum();
        int womanNum = service.getUserNvNum();
        request.getSession().setAttribute("manNum", manNum);
        request.getSession().setAttribute("womanNum", womanNum);
        System.out.println(nowTime + "---成功调用后台跳转程序......");
        return "houtai-xinxitongji";
    }


    /*跳转到用户管理页面*/
    @RequestMapping("/houtai-yonghuguanli")
    public String toHouTaiYongHuGuanLi(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        request.getSession().setAttribute("username", username);

        return "houtai-yonghuguanli";
    }

    /*跳转到添加书籍页面*/
    /*获取书籍类型的列表*/
    @RequestMapping("houtai-tianjiashuji")
    public String toHouTianJiaShuJi(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        request.getSession().setAttribute("username", username);
        List<BookType> bookTypeList = service.selectBookType();
//        System.out.println("BookType="+bookTypeList);
        request.getSession().setAttribute("bookTypeList", bookTypeList);
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
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        return "houtai-tianjiashujileixing";
    }

    /* * 添加书籍类型
     * 添加成功之后跳转到添加书籍类型页面
     *
     * */
    @RequestMapping("/addBookType")
    public String addBookType(String t_type, HttpServletRequest request) {
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
//        System.out.println("t_type="+t_type);
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
    /*
     *
     * 添加书籍两步：
     * 1、书籍表的内容直接存储进数据库，通过action方式
     * 2、书籍的类型通过ajax返回到后台存储到book_type表
     *
     */
    @ResponseBody
    @RequestMapping("/addBook")
    public String addBook(Book book, HttpServletRequest request) throws IOException {
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        System.out.println(">>>");
//        System.out.println(book.toString());
//        System.out.println(">>>b_cover="+book.getB_cover());
        service.addBook(book);
        System.out.println("书籍信息添加成功......");
//        return "redirect:/houtai-tianjiashuji";
        return "ok";
    }

    /*添加书籍的对应类型*/
    /*先根据书籍的名称或者是其他的信息，获取到书籍的id，然后将书籍的id和类型依次存储到book_type表*/
    @RequestMapping("/saveBookType")
    public String saveBookType(HttpServletRequest request, String book_name, String b_type) {
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
//        System.out.println(">>>");
//        System.out.println(b_type);
        int b_id = service.selectBookIdByBookName(book_name);

//        System.out.println("book_name="+book_name+",b_id="+b_id);

        String[] type = b_type.split(",");
        for (String s : type) {
            Book_Type book_type = new Book_Type();
            book_type.setBook_id(b_id);
            book_type.setType_id(Integer.parseInt(s));
            service.saveBookType(book_type);
        }
        System.out.println(">>>");
        System.out.println("书籍对应类型存储成功......");
        return "redirect:/houtai-tianjiashuji";
    }

    /*判断书名是否有重复*/
    @ResponseBody
    @RequestMapping("/sameBookName")
    public String sameBookName(String bookName) {
        boolean f = service.sameBookName(bookName);
        return f?"0":"1";
    }

    /*获取书籍列表或者是单个书籍的信息*/
    @RequestMapping("/selectAllBook")
    public String selectAllBook(Integer  b_id,HttpServletRequest request){
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        List<Book> bookList = service.selectAllBook(b_id);
        List<BookList> bookLists = new ArrayList<>();
        for (Book book : bookList) {
            List<String> bookType = getTypeByBookId(book.getB_id());
//            String base64 = convertBlobToBase64String((Blob) book.getB_cover());
            String res = new String((byte[])book.getB_cover());
            System.out.println(res);
            book.setB_cover(res);
            BookList book_list = new BookList();
            book_list.setTypeList(bookType);
            book_list.setBook(book);
            bookLists.add(book_list);
        }
        request.getSession().setAttribute("bookList",bookLists);
        return "houtai-shujiguanli";
    }

    /*根据书籍的id获取类型的id*/
    /*类型的id是一个数组*/
    public List<String> getTypeByBookId(Integer b_id) {
        List<Integer> type_id = service.getTypeId(b_id);
        List<String> typeList = new ArrayList<>();
        for (Integer i : type_id) {
            String t_type = service.getTypeByTypeId(i);
            typeList.add(t_type);
        }
        return typeList;
    }

    public static String convertBlobToBase64String(Blob blob) {
        String result = "";
        if(null != blob) {
            try {
                InputStream msgContent = blob.getBinaryStream();
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                byte[] buffer = new byte[100];
                int n = 0;
                while (-1 != (n = msgContent.read(buffer))) {
                    output.write(buffer, 0, n);
                }
                result =new BASE64Encoder().encode(output.toByteArray()) ;
                output.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;
        }else {
            return null;
        }
    }
}
