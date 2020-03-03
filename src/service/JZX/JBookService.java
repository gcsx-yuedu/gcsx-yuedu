package service.JZX;


import dao.JZX.JBookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.JZX.JBook;

import java.util.List;

@Service
public class JBookService {
    @Autowired
    private JBookDao bookDao;

    public JBook queryBook(Integer id){
        return bookDao.queryBook(id);
    }
}
