package service.DJX;

import com.sun.org.apache.bcel.internal.generic.DMUL;
import dao.DJX.DManagerDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.DJX.*;

import java.util.List;
import java.util.function.LongConsumer;

@Service
@Transactional
public class DManagerService {
    @Autowired
    private DManagerDao DManagerDao;

    public boolean managerCheck(DManager manager) {
//        System.out.println(manager.toString());
//        System.out.println(managerDao.SelectAdmin(manager));
        return DManagerDao.SelectAdmin(manager) == 1;
    }


    public Integer getUserNum() {
//        System.out.println("成功调用getUserNum()方法......");
        return DManagerDao.userNum();
    }

    public Integer getBookNum() {
        return DManagerDao.bookNum();
    }

    public Integer getCommentNum() {
        return DManagerDao.commentNum();
    }

    public Integer getHuitieNum() {
        return DManagerDao.huitieNum();
    }

    public Integer getUserNvNum() {
        return DManagerDao.userNvNum();
    }

    public Integer getUserNanNum() {
        return DManagerDao.userNanNum();
    }

    public List<DBookType> selectBookType() {
        return DManagerDao.selectBookType();
    }

    public void addBookType(String t_type) {
        DManagerDao.addBookType(t_type);
    }

    public Integer sameType(DBookType bookType) {
        return DManagerDao.sameType(bookType);
    }

    public void saveBookType(DBook_Type book_type) {
        DManagerDao.saveBookType(book_type);
    }

    public Integer selectBookIdByBookName(String b_name) {
        return DManagerDao.selectBookIdByBookName(b_name);
    }

    public void addBook(DBook book) {
        DManagerDao.addBook(book);
    }

    public boolean sameBookName(String b_name) {
        return DManagerDao.sameBookName(b_name)==0;
    }

    public List<DBook> selectAllBook(Integer pg) {
        return DManagerDao.selectAllBook(pg);
    }

    public List<Integer> getTypeId(Integer book_id) {
        return DManagerDao.getTypeId(book_id);
    }

    public String getTypeByTypeId(Integer t_id){
        return DManagerDao.getTypeByTypeId(t_id);

    }

    public List<DBookType> selectAllBookType(Integer pageNumber) {
        return DManagerDao.selectAllBookType(pageNumber);
    }

    public Integer selectTypeSum() {
        return DManagerDao.selectTypeSum();
    }

    public void deleteType(Integer t_id) {
        DManagerDao.deleteType(t_id);
    }

    public void deleteBookType(Integer book_id){
        DManagerDao.deleteBookType(book_id);
    }

    public void updateBookInfo(DBook book) {
        DManagerDao.updateBookInfo(book);
    }

    public Integer getTypeNum(Integer type_id){
        return DManagerDao.getTypeNum(type_id);
    }

    public List<DUserinfo> getAllUserInfo() {
        return DManagerDao.getAllUserInfo();
    }

    public void forbidUser(Integer u_id){
        DManagerDao.forbidUser(u_id);
    }

    public void unForbidUser(Integer u_id) {
        DManagerDao.unForbidUser(u_id);
    }

    public void deleteBook(Integer b_id) {
        DManagerDao.deleteBook(b_id);
    }

    public Integer checkUserInfo(DUserinfo userinfo) {
        return DManagerDao.checkUserInfo(userinfo);
    }

    public Integer getUidByUname(String u_name) {
        return DManagerDao.getUidByUname(u_name);
    }

    public Integer sameUserName(String u_name){
        return DManagerDao.sameUserName(u_name);
    }

    public void addUser(DUserinfo userinfo) {
        DManagerDao.addUser(userinfo);
    }

    public List<DLongComm> getAllLongComm(Integer book_id,Integer pageNum) {
        return DManagerDao.getAllLongComm(book_id,pageNum);
    }

    public Integer getLongCommNum() {
        return DManagerDao.getLongCommNum();
    }

    public void addLongComm(DLongComm comm) {
        DManagerDao.addLongComm(comm);
    }

    public Integer longCommNum() {
        return DManagerDao.longCommNum();
    }

    public Integer getShortNumByTime(String time){
        return DManagerDao.getShortNumByTime(time);
    }

    public Integer getLongNumByTime(String lc_time){
        return DManagerDao.getLongNumByTime(lc_time);
    }

    public Integer getHuiTieNumByTime(String huitie_time){
        return DManagerDao.getHuiTieNumByTime(huitie_time);
    }

    public DLongComm getLongCommById(Integer lc_id) {
        return DManagerDao.getLongCommById(lc_id);
    }

    public List<DHuitie> getHuitieById(Integer tiezi_id) {
        return DManagerDao.getHuitieById(tiezi_id);
    }

    public String getAuthorNameById(Integer u_id) {
        return DManagerDao.getAuthorNameById(u_id);
    }

    public List<DLongComm> getLongCommByUserId(Integer author_id) {
        return DManagerDao.getLongCommByUserId(author_id);
    }

    public void addHuitie(DHuitie huitie) {
        DManagerDao.addHuitie(huitie);
    }

    public Integer userIsForbid(Integer u_id) {
        return DManagerDao.userIsForbid(u_id);
    }

    public void addLongCommComent(Integer comment,Integer lc_id){
        DManagerDao.addLongCommComent(comment, lc_id);
    }

    public List<DPingFen> getAllScoreByUserId(Integer u_id){
        return DManagerDao.getAllScoreByUserId(u_id);
    }

    public Integer DisPingFen( Integer u_id, Integer book_id){
        return DManagerDao.DisPingFen(u_id, book_id);
    }

    public Integer DgetScore( Integer u_id,  Integer book_id){
        return DManagerDao.DgetScore(u_id, book_id);
    }

    public List<DBookType> getAllBookType() {
        return DManagerDao.getAllBookType();
    }

    public List<Integer> getBookIdByTypeId(Integer type_id){
        return DManagerDao.getBookIdByTypeId(type_id);
    }

    public List<DBook> DgetAllBook() {
        return DManagerDao.DgetAllBook();
    }

    public Integer isBookScore( Integer u_id,  Integer book_id) {
        return DManagerDao.isBookScore(u_id, book_id);
    }

    public Integer isBookType(Integer book_id, Integer type_id){
        return DManagerDao.isBookType(book_id, type_id);
    }

    public DBook getBookInfoByBookName(String b_name){
        return DManagerDao.getBookInfoByBookName(b_name);
    }
}
