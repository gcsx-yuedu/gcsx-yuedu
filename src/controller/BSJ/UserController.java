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

    @RequestMapping("/getConcern")

    public String getConcern(Model model){
        List<BGuanzhu> guanzhuList = service.getGuanzhuId(1);
        List<BConcernList> concernList = new ArrayList<>();
        for(BGuanzhu gz: guanzhuList){
            List<BUser> concern_List = service.queryUserById(gz.getGuanzhu_userid());
            int countConcern = service.getCountConcern(gz.getGuanzhu_userid());
            BConcernList ConcernList = new BConcernList();
            ConcernList.setConcernList(concern_List);
            ConcernList.setCountConcern(countConcern);
            concernList.add(ConcernList);
        }
        model.addAttribute("concernList",concernList);

        return "user_focus";
    }


}
