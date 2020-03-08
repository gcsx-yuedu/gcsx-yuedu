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

    @RequestMapping("/book_search")
    public String QueryBook2(HttpServletRequest request){
        String userId = request.getParameter("userId");
        System.out.println("userId="+userId);
        String wenzi = request.getParameter("wenzi");
        System.out.println("u_id="+userId);
        if(wenzi == null){wenzi="";}
        List<ZBook> books = zBookService.queryBook(wenzi);
        List<ZBookType> types = zBookService.selectAllType();
        for (ZBook book:books){
            List<String> bookType = getBookType(book.getB_id());
            String res=new String((byte[])book.getB_cover());
            book.setB_cover(res);
            book.setTypeList(bookType);
            if(userId!="") {
                //查询书架相应书是否存在
                ZBookShelf shel = new ZBookShelf();
                shel.setBook_id(book.getB_id());
                shel.setUser_id(Integer.parseInt(userId));
                int bookCount = zBookService.getCountOfShelfBook(shel);
                book.setCounts(bookCount);
                request.getSession().setAttribute("shel", shel);
            }
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

    //添加至书架
    @RequestMapping("/addToShelf")
    public String addToShelf(int u_id,int b_id,HttpServletRequest request){
        System.out.println("u_id="+u_id);
        System.out.println("b_id="+b_id);
        ZBookShelf shelf = new ZBookShelf();
        shelf.setUser_id(u_id);
        shelf.setBook_id(b_id);
        zBookService.addToShelf(shelf);
        System.out.println("添加完毕");
//        request.getSession().setAttribute("u_id", u_id);
        request.getSession().setAttribute("b_id", b_id);
        return "redirect:/book_search2?userId="+u_id;
    }

//    //判断书架是否已存在该书
//    @ResponseBody
//    @RequestMapping("/judgeshujia")
//    public String panduanShujia(Integer b_id){
//        boolean aa = zBookService.getCountOfShelfBook(b_id);
//        return aa ? "0" : "1";
//    }

    //点击类型跳转至该类型下书籍(已登录)
    @RequestMapping("/showBookByType")
    public String bookByType(int userId,int t_id,String t_type,HttpServletRequest request) {
        System.out.println("con t_id=" + t_id);
        request.getSession().setAttribute("t_id", t_id);
        request.getSession().setAttribute("t_type", t_type);
        List<Integer> book_ids = zBookService.selectBookIdByTypeId(t_id);
        List<ZBook> books = new ArrayList<ZBook>();
        for (int book_id : book_ids) {
            ZBook book = zBookService.selectBookByBookId(book_id);
            books.add(book);
        }
        for (ZBook bo:books){
            List<String> bookType = getBookType(bo.getB_id());
            String res=new String((byte[])bo.getB_cover());
            bo.setB_cover(res);
            bo.setTypeList(bookType);
            ZBookShelf shel = new ZBookShelf();
            shel.setBook_id(bo.getB_id());
            shel.setUser_id(userId);
            int bookCount = zBookService.getCountOfShelfBook(shel);
            bo.setCounts(bookCount);
            request.getSession().setAttribute("shel",shel);
        }
        List<ZBookType> types = zBookService.selectAllType();
//        System.out.println("bookid长度"+book_ids.size());
//        System.out.println("books长度"+books.size());
        request.getSession().setAttribute("count",book_ids.size());
        request.getSession().setAttribute("books", books);
        request.getSession().setAttribute("types", types);
        return "book_type";
    }

    //点击类型跳转至该类型下书籍(未登录)
    @RequestMapping("/showBookByType0")
    public String bookByType0(int t_id,String t_type,HttpServletRequest request) {
        System.out.println("con t_id=" + t_id);
        request.getSession().setAttribute("t_id", t_id);
        request.getSession().setAttribute("t_type", t_type);
        List<Integer> book_ids = zBookService.selectBookIdByTypeId(t_id);
        List<ZBook> books = new ArrayList<ZBook>();
        for (int book_id : book_ids) {
            ZBook book = zBookService.selectBookByBookId(book_id);
            books.add(book);
        }
        for (ZBook bo:books){
            List<String> bookType = getBookType(bo.getB_id());
            String res=new String((byte[])bo.getB_cover());
            bo.setB_cover(res);
            bo.setTypeList(bookType);
        }
        List<ZBookType> types = zBookService.selectAllType();
//        System.out.println("bookid长度"+book_ids.size());
//        System.out.println("books长度"+books.size());
        request.getSession().setAttribute("count",book_ids.size());
        request.getSession().setAttribute("books", books);
        request.getSession().setAttribute("types", types);
        return "book_type";
    }

    //首页
    @RequestMapping("/home_page")
    public String shouye(HttpServletRequest request){
        List<ZBookType> types = zBookService.selectAllType();
        request.getSession().setAttribute("types",types);
        return "home_page";
    }
}
