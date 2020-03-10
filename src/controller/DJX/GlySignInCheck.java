package controller.DJX;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.DJX.*;
import service.DJX.DManagerService;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
public class GlySignInCheck {


    @Autowired
    private DManagerService service;

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
        DManager manager = new DManager();
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
        int longCommNum = service.getLongCommNum();
        /*获取书籍类型总数*/
        List<DBookType> typeList = service.selectBookType();
        /*根据不同的书籍类型的id获取对应的数量*/
        for (DBookType bookType : typeList) {
            bookType.setTypeNum(service.getTypeNum(bookType.getT_id()));
        }
        /*获取前几天时间*/
        List<DComm> comm = new ArrayList<>();
        for (int k=-6;k<=0;k++) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.add(Calendar.DATE, k);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String time = simpleDateFormat.format(calendar.getTime());
            int sn = service.getShortNumByTime(time);
            int ln = service.getLongNumByTime(time);
            int hn = service.getHuiTieNumByTime(time);
            DComm commList = new DComm();
            commList.setDate(time);
            commList.setCommNum(sn + ln + hn);
            comm.add(commList);
        }
        /*将整个po类传递到jsp*/
        request.getSession().setAttribute("typeList", typeList);
        request.getSession().setAttribute("userNum", userNum);
        request.getSession().setAttribute("bookNum", bookNum);
        request.getSession().setAttribute("commentNum", commentNum + huitieNum+longCommNum);
        request.getSession().setAttribute("comms",comm);
        String nowTime = getNowTime();
        /*获取用户性别的男女数量并传递到前端页面*/
        int manNum = service.getUserNanNum();
        int womanNum = service.getUserNvNum();
        request.getSession().setAttribute("manNum", manNum);
        request.getSession().setAttribute("womanNum", womanNum);
        System.out.println(nowTime + "---成功调用后台跳转程序......");
        return "houtai-xinxitongji";
    }

    /*跳转到添加书籍页面*/
    /*获取书籍类型的列表*/
    @RequestMapping("/houtai-tianjiashuji")
    public String toHouTianJiaShuJi(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        request.getSession().setAttribute("username", username);
        List<DBookType> bookTypeList = service.selectBookType();
//        System.out.println("BookType="+bookTypeList);
        request.getSession().setAttribute("bookTypeList", bookTypeList);
        return "houtai-tianjiashuji";
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
        DBookType bookType = new DBookType();
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
    public String addBook(DBook book, HttpServletRequest request) throws IOException {
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
            DBook_Type book_type = new DBook_Type();
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
        return f ? "0" : "1";
    }

    /*获取书籍列表*/
    /*同时跳转到书籍列表界面*/
    @RequestMapping("/houtai-shujiguanli")
    public String selectAllBook(HttpServletRequest request, Integer pageNumber) {
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        Integer pg = pageNumber;
        if ("".equals(String.valueOf(pg)) || pg == null) {
            pg = 1;
        }
        List<DBook> bookList = service.selectAllBook((pg - 1) * 10);
        int totalSize = service.getBookNum() / 10;
        if (service.getBookNum() % 10 != 0) {
            totalSize++;
        }
        List<DBookList> bookLists = new ArrayList<>();
        for (DBook book : bookList) {
            List<String> bookType = getTypeByBookId(book.getB_id());
//            String typeList = StringUtils.strip(bookType.toString(),"[]");
//            String base64 = convertBlobToBase64String((Blob) book.getB_cover());
            String res = new String((byte[]) book.getB_cover());
//            System.out.println(res);
            book.setB_cover(res);
            DBookList book_list = new DBookList();
            book_list.setTypeList(bookType);
            book_list.setBook(book);
            bookLists.add(book_list);
        }
        request.getSession().setAttribute("totalSize", totalSize);
        request.getSession().setAttribute("bookList", bookLists);
        request.getSession().setAttribute("pageNumber", pg);
        System.out.println(">>>");
        System.out.println("跳转到书籍管理界面成功......");
        return "houtai-shujiguanli";
    }

    /*根据书籍的id获取类型的id*/
    /*类型的id是一个数组*/
    /*根据类型的ids获取一个类型的String列表*/
    public List<String> getTypeByBookId(Integer b_id) {
        List<Integer> type_id = service.getTypeId(b_id);
        List<String> typeList = new ArrayList<>();
        for (Integer i : type_id) {
            String t_type = service.getTypeByTypeId(i);
            typeList.add(t_type);
        }
        return typeList;
    }

    /*获取所有的bookType类型并跳转到书籍类型管理页面*/
    @RequestMapping("/houtai-shujileixingguanli")
    public String toHouTaiShuJiLeiXingGuanLi(HttpServletRequest request, Integer pageNumber) {
        Integer pg = pageNumber;
        if ("".equals(String.valueOf(pg)) || pg == null) {
            pg = 1;
        }
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        List<DBookType> bookTypes = service.selectAllBookType((pg - 1) * 15);
        /*获取list的大小以便前端分页*/
        /*前端页面的大小为每页15条数据，先将总的页数计算好，再传给前端*/
        int typeSum = service.selectTypeSum();
        int totalSize = typeSum / 15;
        if (typeSum % 15 != 0) {
            totalSize++;
        }
//        System.out.println(totalSize);
        System.out.println(">>>");
//        System.out.println(totalSize);
        request.getSession().setAttribute("typeList", bookTypes);
        request.getSession().setAttribute("totalSize", totalSize);
        request.getSession().setAttribute("pageNumber", pg);
        System.out.println("跳转到书籍类型页面方法执行成功......");
        return "houtai-shujileixingguanli";
    }

    /*获取书籍的id，将书籍信息获取到编辑页面*/
    @RequestMapping("/EditBook")
    public String editBook(Integer b_id, HttpServletRequest request) {
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        List<DBook> booklist = service.selectAllBook(b_id);
        DBookList bookList = new DBookList();
        DBook book = booklist.get(0);
        String res = new String((byte[]) book.getB_cover());
        book.setB_cover(res);
        bookList.setBook(book);
        List<String> bookType = getTypeByBookId(b_id);
        bookList.setTypeList(bookType);
        List<DBookType> bookTypes = service.selectBookType();
        request.getSession().setAttribute("bookTypeList", bookTypes);
        request.getSession().setAttribute("bookInfo", bookList);
        return "houtai-bianjishuji";
    }


    /*根据类型id删除类型*/
    @RequestMapping("/deleteType")
    public String deleteType(Integer t_id) {
        service.deleteType(t_id);
        System.out.println(">>>");
        System.out.println("删除类型成功......");
        return "redirect:/houtai-shujileixingguanli";
    }

    /*处理书籍的编辑信息*/
    /*根据书籍id删除相关的书籍--类型对应信息*/
    /*更新书籍的基本信息（书籍的类型在原有的地方添加）*/
    /*该方法在存储书籍类型之前实现*/
    @ResponseBody
    @RequestMapping("/EditBookPro")
    public String editBookPro(Integer b_id, DBook book) {
        service.deleteBookType(b_id);
        service.updateBookInfo(book);
        System.out.println(">>>");
        System.out.println("书籍更新成功......");
        return "ok";
    }

    /*获取用户的所有的信息*/
    /*跳转到用户管理界面*/
    @RequestMapping("/houtai-yonghuguanli")
    public String toYongHuGuanLi(HttpServletRequest request) {
        request.getSession().setAttribute("username", request.getSession().getAttribute("username"));
        List<DUserinfo> userinfos = service.getAllUserInfo();
        request.getSession().setAttribute("userInfo", userinfos);
        return "houtai-yonghuguanli";
    }

    /*用户禁言*/
    @ResponseBody
    @RequestMapping("/Forbid")
    public String userForbid(Integer u_id) {
        service.forbidUser(u_id);
        System.out.println(">>>");
        System.out.println(u_id + "禁言");
        return "ok";
    }

    /*解除用户禁言*/
    @ResponseBody
    @RequestMapping("/UnForbid")
    public String unForbid(Integer u_id) {
        service.unForbidUser(u_id);
        System.out.println(">>>");
        System.out.println(u_id + "解除禁言");
        return "OK";
    }

    /*根据书籍的id删除书籍*/
    @ResponseBody
    @RequestMapping("/deleteBook")
    public String deleteBook(Integer b_id) {
        service.deleteBook(b_id);
        System.out.println(">>>");
        System.out.println("书籍删除成功......");
        return "OK";
    }

    /*跳转到用户登录界面*/
    @RequestMapping("/USignUp")
    public String userSignUp() {
        return "sign-up-yh";
    }

    /*判断数据库中是否有该用户的相关信息*/
    /*通过用户名和用户密码判断是否有记录存在*/
    @ResponseBody
    @RequestMapping("/CheckUserName")
    public String checkUserName(DUserinfo userinfo){
        Integer userNum = service.checkUserInfo(userinfo);
        System.out.println(">>>");
        System.out.println("判断用户名成功......");
//        System.out.println(userNum);
        return String.valueOf(userNum);
    }


    /*用于登录界面和用户登陆后的主界面之间的跳转*/
    /*隐藏用户名等信息*/
    /*根据用户名获取用户id*/
    /*将用户名和用户id一起传递到jsp*/
    @RequestMapping("/toHomeUser")
    public String toHomeUserPre(String userName, HttpServletRequest request) {
        Integer u_id = service.getUidByUname(userName);
        request.getSession().setAttribute("userId",u_id);
        request.getSession().setAttribute("userName",userName);
        List<String> recommendBookList = CB(u_id);
        request.getSession().setAttribute("recommendBookList",recommendBookList);
        System.out.println(userName);
        System.out.println(">>>");
        System.out.println("跳转到首页成功......");
        return "redirect:/home_page";
    }


    /*判断用户名是否重复*/
    /*如果已存在返回的是1，否则返回的是0*/
    @ResponseBody
    @RequestMapping("/sameUserName")
    public String sameUserName(String u_name) {
        System.out.println(">>>");
        System.out.println("查询是否有相同的用户名......");
        return String.valueOf(service.sameUserName(u_name));
    }

    /*添加用户信息*/
    /*添加成功之后，跳转到用户登录界面*/
    @ResponseBody
    @RequestMapping("/addUserInfo")
    public String addUserInfo(DUserinfo userinfo) {
        userinfo.setU_address(null);
        userinfo.setU_forbid("0");
        userinfo.setU_sex(null);
        service.addUser(userinfo);
        System.out.println(">>>");
        System.out.println("添加用户信息成功......");
        return "OK";
    }

    /*跳转到comment读后感列表页面*/
    /*获取所有的读后感*/
    /*获取bookType类型，同时将bookType类型存入session*/
    /*获取session里面的userId和userName*/
    @RequestMapping("/comment")
    public String toComment(Integer book_id,Integer pageNum,HttpServletRequest request) {
//        request.getSession().setAttribute("userId",request.getSession().getAttribute("userId") );
//        request.getSession().getAttribute("userId")
//        request.getSession().setAttribute("userName", request.getSession().getAttribute("userName"));
//        request.getSession().getAttribute("userName")
        /*获取所有长评*/
        if ("".equals(String.valueOf(pageNum))||pageNum==null) {
            pageNum=1;
        }
        List<DLongComm> longCommList = service.getAllLongComm( book_id, (pageNum-1)*6);
        request.getSession().setAttribute("longCommList", longCommList);
        /*获取所有书籍类型并存储到session*/
//        List<DBookType> bookTypeList = service.selectBookType();
//        request.getSession().setAttribute("bookTypeList", bookTypeList);
        /*获取长评总数*/
        /*每页6条数据*/
        int longCommNum = service.getLongCommNum();
        int totalPage = longCommNum/6;
        if (longCommNum % 6 != 0) {
            totalPage++;
        }
        request.getSession().setAttribute("totalPage",totalPage);
        request.getSession().setAttribute("pageNum",pageNum);
        System.out.println("book_id");
        System.out.println(book_id);
        request.getSession().setAttribute("book_id",book_id);
        return "comment";
    }

    /*添加长评*/
    @ResponseBody
    @RequestMapping("/addLongComm")
    public String addLongComm(DLongComm comm) {
//        System.out.println(request.getSession().getAttribute("book_id"));
//        request.getSession().setAttribute("book_id",request.getSession().getAttribute("book_id"));
        String lc_time = getNowTime();
        comm.setLc_coment(0);
        comm.setLc_time(lc_time);
        System.out.println(">>>");
        System.out.println("LongComm"+comm.toString());
        service.addLongComm(comm);
        System.out.println("长评添加成功......");
        return "OK";
    }

    /*跳转到article界面*/
    /*根据长评id获取长评的内容*/
    /*根据长评id获取回帖的list*/
    /*根据长评id获取bookid*/
    @RequestMapping("/article")
    public String article(Integer lc_id,HttpServletRequest request) {
//        lc_id=1;
        DLongComm longComm = service.getLongCommById(lc_id);
        List<DHuitie> huitieList = service.getHuitieById(lc_id);
        longComm.setAuthor_name(service.getAuthorNameById(longComm.getAuthor_id()));
        for (DHuitie huitie : huitieList) {
            huitie.setAuthor_name(service.getAuthorNameById(huitie.getHuitieren_id()));
        }
        /*获取typeid*/
        List<Integer> typeIdList = service.getTypeId(longComm.getBook_id());
        List<DBookType> typeList = new ArrayList<>();
        for (Integer integer : typeIdList) {
            DBookType bookType = new DBookType();
            bookType.setT_id(integer);
            bookType.setT_type(service.getTypeByTypeId(integer));
            typeList.add(bookType);
        }
//        System.out.println(typeIdList);
//        System.out.println(typeList);
        /*根据长评id获取发帖人id*/
        /*根据发帖人id获取发过的前3篇长评*/
        List<DLongComm> longCommList = service.getLongCommByUserId(longComm.getAuthor_id());
        System.out.println(longCommList);
        request.getSession().setAttribute("longCommList",longCommList);
        request.getSession().setAttribute("typeList", typeList);
        request.getSession().setAttribute("longComm",longComm);
        request.getSession().setAttribute("huitieList",huitieList);
        return "article";
    }


    /*
     * 添加回帖
     * 获取Dhuitie对象
     * 获取时间
     * 存储
     * 同时长评表的coment字段+1
     * */
    @ResponseBody
    @RequestMapping("/addHuitie")
    public String addHuitie(DHuitie huitie,int nowComment) {
        String time = getNowTime();
        huitie.setHuitie_time(time);
        huitie.setLike_click(0);
        service.addHuitie(huitie);
        service.addLongCommComent(nowComment+1,huitie.getTiezi_id());
        System.out.println(">>>");
        System.out.println("回帖添加成功...");
        return "OK";
    }

    /*查询是否被禁言*/
    @ResponseBody
    @RequestMapping("/userIsForbid")
    public String userisForbid(Integer u_id) {
        return String.valueOf(service.userIsForbid(u_id));
    }

    /*计算CB*/
//    @ResponseBody
//    @RequestMapping("/CB")
    public List<String> CB(Integer u_id) {
//        u_id=1;
        List<DPingFen> pingFenList = service.getAllScoreByUserId(u_id);
        /*获取添加书籍的总数*/
        int bookSum = service.getBookNum();
        /*获取用户所有的评分*/
        double scoreSum=0;
        double sum=0;
        for (DPingFen pingFen : pingFenList) {
            sum++;
            scoreSum += pingFen.getScore();
        }
        System.out.println("scoreSum="+scoreSum);
        /*计算用户的平均评分*/
        double avg = scoreSum / bookSum;
        System.out.println("avg="+avg);

        /*获取所有的type并赋初值*/
        List<DBookType> bookTypes = service.getAllBookType();
        /*typeId-typeScore*/
        HashMap<Integer, Double> typeScore = new HashMap<>();
        for (DBookType bookType : bookTypes) {
            typeScore.put(bookType.getT_id(), (double) 0);
        }
        System.out.println("book_length="+bookSum);
        System.out.println("bookType_length="+bookTypes.size());

        /*为每一本书构建一个数组*/
        /*数组大小book总数xbookType大小*/
        int[][] bookProfiles = new int[bookSum][bookTypes.size()];
        /*获取bookList*/
        List<DBook> bookList = service.DgetAllBook();
        int m=0,n=0;
        for (m=0;m<bookSum;m++){
            int book_id = bookList.get(m).getB_id();
            for (n=0;n<bookTypes.size();n++){
                bookProfiles[m][n] = service.isBookType(book_id, bookTypes.get(n).getT_id());
//                System.out.println(bookProfiles[m][n]);
            }
        }
        /*打印bookProfiles矩阵*/
        for (m=0;m<bookSum;m++){
            for (n=0;n<bookTypes.size();n++){
                System.out.print(bookProfiles[m][n]);
            }
            System.out.println();
        }

        /*建立用户模型矩阵*/
        /*矩阵模型大小为1xbookType的大小*/
        double[] userProfiles = new double[bookTypes.size()];
        /*根据type获取对应的book_id*/
        /*根据bookid和userid获取该用户的所有的相关的打分记录*/
        /*获取用户打过分的某个类型的book的总分*/

        int k=0;
        int type_pingfen_num=0;
        for (k=0;k<bookTypes.size();k++){
            double user_book_type_score=0;
            int type_id = bookTypes.get(k).getT_id();
            List<Integer> book_ids = service.getBookIdByTypeId(type_id);
            for (Integer book_id : book_ids) {
                if (service.isBookScore(u_id,book_id)!=0){
//                    System.out.println(service.isBookScore(u_id,book_id));
                    type_pingfen_num++;
                    int score = service.DgetScore(u_id, book_id);
                    user_book_type_score += score-avg;
                }
            }
            userProfiles[k] = user_book_type_score/type_pingfen_num;
        }
        System.out.println("userProfiles="+Arrays.toString(userProfiles));

        /*计算每本书的推荐相似度*/
        /*建立相似度矩阵*/
        /*矩阵大小为1xbookList的大小*/
        HashMap<String, Double> similarBook = new HashMap<>();
        double[] similar = new double[bookList.size()];
        for (int k1 = 0; k1 < bookList.size(); k1++) {
            double UxIsum =0;
            double U2sum = 0;
            double I2sum = 0;
            for (int i=0;i<bookTypes.size();i++){
                UxIsum = UxIsum + userProfiles[i] * bookProfiles[k1][i];
                U2sum = U2sum + userProfiles[i] * userProfiles[i];
                I2sum = I2sum + bookProfiles[k1][i] * bookProfiles[k1][i];
            }
//            System.out.println(bookList.toString());
            similar[k1]=UxIsum/(Math.sqrt(U2sum)*Math.sqrt(I2sum));
            /*乘以10扩大相似度差距*/
            similarBook.put(bookList.get(k1).getB_name(), UxIsum*10);
        }
        System.out.println("similar="+Arrays.toString(similar));
        System.out.println("similarBook="+similarBook);
        List<Map.Entry<String, Double>> list = new ArrayList<Map.Entry<String, Double>>(similarBook.entrySet());
        list.sort(new Comparator<Map.Entry<String, Double>>() {
            @Override
            public int compare(Map.Entry<String, Double> o1, Map.Entry<String, Double> o2) {
                System.out.println(o2.getValue() + "-" + o1.getValue());
                return (int) (o2.getValue() - o1.getValue());
            }
        });
        List<String> books = new ArrayList<>();
        for (Map.Entry<String, Double> item : list) {
            books.add(item.getKey());
        }
        System.out.println(list);
        System.out.println("推荐书籍"+books);

        return books;
    }


}
