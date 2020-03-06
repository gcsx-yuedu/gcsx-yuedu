package service.JZX;


import dao.JZX.JBookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.JZX.JBook;
import po.JZX.JShortComm;

import java.util.List;

@Service
public class JBookService {
    @Autowired
    private JBookDao bookDao;

    public JBook queryBook(Integer id){
        return bookDao.queryBook(id);
    }
    public List<Integer> getTypeID(Integer book_id){return  bookDao.getTypeID(book_id);}
    public String getTypeByID(Integer t_id){return bookDao.getTypeByTypeID(t_id);}

    public void addShortComm(JShortComm sc){bookDao.addShortComm(sc);}
}
