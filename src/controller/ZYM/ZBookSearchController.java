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
        if(wenzi == null){wenzi="";}
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
    public String addToShelf(Integer u_id,Integer b_id,HttpServletRequest request){
        System.out.println("u_id="+u_id);
        System.out.println("b_id="+b_id);
        ZBookShelf shelf = new ZBookShelf();
        shelf.setUser_id(u_id);
        shelf.setBook_id(b_id);
        zBookService.addToShelf(shelf);
        System.out.println("添加完毕");
//        request.getSession().setAttribute("u_id", u_id);
        request.getSession().setAttribute("b_id", b_id);

        System.out.println("已添加，准备跳转，b_id="+b_id);
        return "book_search";
    }

    //点击类型跳转至该类型下书籍
    @RequestMapping("/showBookByType")
    public String bookByType(int t_id,String t_type,HttpServletRequest request) {
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

}
