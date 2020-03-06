package controller.BSJ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.BSJ.*;
import service.BSJ.BUserService;

import java.util.ArrayList;
import java.util.List;


@Controller
public class UserController {


    @Autowired
    private BUserService service;

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
    public String list(Model model){
//        String u_id=request.getSession().getAttribute("u_id");
        List<BUser> list = service.queryUserById(1);
        List<BBookShelfList> shelfLists = new ArrayList<>();
        List<BBookShelf> shelfList = service.queryShelfById(1);
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

    @RequestMapping("/user_change")

    public String UpdateUser(BUser user) {
        service.updateUser(user);
        return "redirect:user_info";
    }

    @RequestMapping("/user_focus")

    public String getConcern(Model model){
        List<BGuanzhu> guanzhuList = service.getGuanzhuId(1);
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
        List<BGuanzhu> fList = service.getFansId(1);
        List<BFansList> fansList = new ArrayList<>();
        for(BGuanzhu fc : fList){
            List<BUser> fans_List = service.queryUserById(fc.getUser_id());
            int countFans = service.getCountFans(fc.getUser_id());
            for(BUser fans : fans_List){
                BFansList FansList = new BFansList();
                FansList.setFansList(fans);
                FansList.setCountFans(countFans);
                fansList.add(FansList);
            }
        }
        model.addAttribute("fansList",fansList);

        return "user_focus";
    }

    @RequestMapping("/cancelguanzhu")
    public String Cancel(int guanzhu_userid){
        service.cancelConcern(guanzhu_userid);
        return "redirect:user_focus";
    }

    @RequestMapping("/guanzhu")
    public String Guanzhu(int user_id){
        BGuanzhu gz = new BGuanzhu();
        gz.setUser_id(1);
        gz.setGuanzhu_userid(user_id);
        service.guanzhu(gz);
        return "redirect:user_focus";
    }

    @RequestMapping("user_comment")
    public String Comment(Model model){
        List<BShortComm> commList = service.getCommById(1);
        List<BCommentList> commentLists = new ArrayList<>();
        for(BShortComm comm : commList){
            List<BBook> bookList = service.getBookById(comm.getShuji_id());
            for(BBook book : bookList){
                BCommentList bcl = new BCommentList();
                bcl.setBook(book);
                bcl.setCommList(comm);
                commentLists.add(bcl);
            }
        }
        model.addAttribute("commentLists",commentLists);
        List<BArticle> article = service.getArticle(1);
        List<BArticleList> articleList = new ArrayList<>();
        for(BArticle ar : article){
            List<BBook> book = service.getBookById(ar.getBook_id());
            for(BBook b : book){
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
    public String deleteShort(String fatie_time){
        service.deleteShort(fatie_time);
        return "redirect:user_comment";
    }
    @RequestMapping("/deleteArticle")
    public String deleteArticle(String lc_time){
        service.deleteArticle(lc_time);
        return "redirect:user_comment";
    }

}
