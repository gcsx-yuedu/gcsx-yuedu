package controller.BSJ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.BSJ.*;
import service.BSJ.BUserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


@Controller
public class UserController {


    @Autowired
    private BUserService service;

    @RequestMapping("/exit")
    public String Exit(HttpServletRequest request){
        request.getSession().removeAttribute("userId");
        request.getSession().removeAttribute("userName");
        return "redirect:/home_page";
    }

    public List<String> getTypeId(Integer b_id) {
        List<Integer> type_id = service.getTypeId(b_id);
        List<String> typeList = new ArrayList<>();
        for (Integer i : type_id) {
            String t_type = service.getTypeByTypeId(i);
            typeList.add(t_type);
        }
        return typeList;
    }

    @RequestMapping("/user_info")
    public String list(Model model,int u_id,HttpServletRequest request){
        List<BUser> list = service.queryUserById(u_id);
        int countFans = service.getCountFans(u_id);
        request.getSession().setAttribute("countFans",countFans);
        List<BBookShelfList> shelfLists = new ArrayList<>();
        List<BBookShelf> shelfList = service.queryShelfById(u_id);
        for(BBookShelf bookShelf : shelfList){
            List<BBook> bookList = service.selectBookById(bookShelf.getBook_id());
            for(BBook book: bookList){
                List<String> bookType = getTypeId(book.getB_id());
//            String base64 = convertBlobToBase64String((Blob) book.getB_cover());
                String res = new String((byte[])book.getB_cover());
                System.out.println(res);
                book.setB_cover(res);
                BBookShelfList shelf_List = new BBookShelfList();
                shelf_List.setBookList(book);
                shelf_List.setTypeList(bookType);
                shelfLists.add(shelf_List);
            }
        }
        model.addAttribute("list",list);
        model.addAttribute("shelfLists",shelfLists);
        return "user_info";
    }
    @RequestMapping("/remove")
    public String Remove(int b_id,int u_id){
        System.out.println(b_id);
        System.out.println(u_id);
        BBookShelf shelf = new BBookShelf();
        shelf.setUser_id(u_id);
        shelf.setBook_id(b_id);
        service.removeShelf(shelf);
        return "redirect:/user_info?u_id="+u_id;
    }

    @RequestMapping("/user_change")
    public String Change(int u_id,HttpServletRequest request){
        List<BUser> user = service.queryUserById(u_id);
        request.getSession().setAttribute("user",user);
        return "user_change";
    }
    @RequestMapping("/update")
    public String UpdateUser(HttpServletRequest request, HttpServletResponse response)throws Exception {
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        int u_id=Integer.parseInt(request.getParameter("u_id"));
        String u_name=request.getParameter("u_name");
        String u_password= request.getParameter("u_password");
        String u_sex=request.getParameter("u_sex");
        String u_address=request.getParameter("u_address");
        BUser user = new BUser();
        user.setU_id(u_id);
        user.setU_name(u_name);
        user.setU_password(u_password);
        user.setU_sex(u_sex);
        user.setU_address(u_address);
        service.updateUser(user);
        response.setContentType("text/html;charset=utf-8");
        if(name.equals(u_name)&&password.equals(u_password)){
            return "redirect:/user_change?u_id="+u_id;
        }else{
            response.getWriter().write("<script>confirm('用户名或密码已更改！请重新登录'); window.location='view/sign-up-yh.jsp';</script>");
            response.getWriter().flush();
            return "sign-up-yh";
        }
    }

    @RequestMapping("/user_focus")

    public String getConcern(Model model,int u_id){
        List<BGuanzhu> guanzhuList = service.getGuanzhuId(u_id);
        List<BConcernList> concernList = new ArrayList<>();
        for(BGuanzhu gz: guanzhuList){
            List<BUser> concern_List = service.queryUserById(gz.getGuanzhu_userid());
            int countFans = service.getCountFans(gz.getGuanzhu_userid());
            for(BUser concern : concern_List){
                BConcernList ConcernList = new BConcernList();
                ConcernList.setConcernList(concern);
                ConcernList.setCountFans(countFans);
                concernList.add(ConcernList);
            }
        }
        model.addAttribute("concernList",concernList);
        List<BGuanzhu> fList = service.getFansId(u_id);
        List<BFansList> fansList = new ArrayList<>();
        for(BGuanzhu fc : fList){
            List<BUser> fans_List = service.queryUserById(fc.getUser_id());
            int countFans = service.getCountFans(fc.getUser_id());
            BGuanzhu guanzhu = new BGuanzhu();
            guanzhu.setGuanzhu_userid(fc.getUser_id());
            guanzhu.setUser_id(u_id);
            int count = service.getLine(guanzhu);
            for(BUser fans : fans_List){
                BFansList FansList = new BFansList();
                FansList.setFansList(fans);
                FansList.setCountFans(countFans);
                FansList.setCount(count);
                fansList.add(FansList);
            }
        }
        model.addAttribute("fansList",fansList);

        return "user_focus";
    }

    @RequestMapping("/cancelguanzhu")
    public String Cancel(int guanzhu_userid,int u_id){
        service.cancelConcern(guanzhu_userid);
        return "redirect:/user_focus?u_id="+u_id;
    }

    @RequestMapping("/guanzhu")
    public String Guanzhu(int u_id,int user_id){
        BGuanzhu gz = new BGuanzhu();
        gz.setUser_id(u_id);
        gz.setGuanzhu_userid(user_id);
        service.guanzhu(gz);
        return "redirect:/user_focus?u_id="+u_id;
    }

    @RequestMapping("user_comment")
    public String Comment(Model model,int u_id){
        List<BShortComm> commList = service.getCommById(u_id);
        List<BCommentList> commentLists = new ArrayList<>();
        for(BShortComm comm : commList){
            List<BBook> bookList = service.getBookById(comm.getShuji_id());
            for(BBook book : bookList){
                String res = new String((byte[])book.getB_cover());
                System.out.println(res);
                book.setB_cover(res);
                BCommentList bcl = new BCommentList();
                bcl.setBook(book);
                bcl.setCommList(comm);
                commentLists.add(bcl);
            }
        }
        model.addAttribute("commentLists",commentLists);
        List<BArticle> article = service.getArticle(u_id);
        List<BArticleList> articleList = new ArrayList<>();
        for(BArticle ar : article){
            List<BBook> book = service.getBookById(ar.getBook_id());
            for(BBook b : book){
                String res = new String((byte[])b.getB_cover());
                System.out.println(res);
                b.setB_cover(res);
                BArticleList ba = new BArticleList();
                ba.setBooks(b);
                ba.setArticleList(ar);
                articleList.add(ba);
            }
        }
        model.addAttribute("articleList",articleList);
        return "user_comment";

    }

    @RequestMapping("/deleteShort")
    public String deleteShort(String fatie_time,HttpServletRequest request){
        service.deleteShort(fatie_time);
        return "redirect:/user_comment?u_id="+request.getSession().getAttribute("userId");
    }
    @RequestMapping("/deleteArticle")
    public String deleteArticle(String lc_time,HttpServletRequest request){
        service.deleteArticle(lc_time);
        return "redirect:/user_comment?u_id="+request.getSession().getAttribute("userId");
    }

    @RequestMapping("/user_news")
    public String News(Model model,int u_id){
        List<BArticle> article = service.getArticle(u_id);
        List<BHuitieNews> huitieList = new ArrayList<>();
        for(BArticle a : article){
            List<BHuitie> huitie = service.getHuitieNews(a.getLc_id());
            for(BHuitie h :huitie){
                List<BUser> user = service.queryUserById(h.getHuitieren_id());
                for(BUser u : user){
                    BHuitieNews hui = new BHuitieNews();
                    hui.setUser(u);
                    hui.setHuitieList(h);
                    hui.setArticle(a);
                    huitieList.add(hui);
                }
            }
        }
        model.addAttribute("huitieList",huitieList);

        List<BGuanzhu> fList = service.getFansId(u_id);
        List<BFansList> fanss= new ArrayList<>();
        for(BGuanzhu fc : fList){
            List<BUser> fans_List = service.queryUserById(fc.getUser_id());
            for(BUser fans : fans_List){
                BFansList FansList = new BFansList();
                FansList.setFansList(fans);
                fanss.add(FansList);
            }
        }
        model.addAttribute("fanss",fanss);

        return "user_news";
    }

}
