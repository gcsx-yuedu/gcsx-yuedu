package po.ZYM;
import java.util.Comparator;
public class ComparatorImpl implements Comparator<ZUserList> {
       public int compare(ZUserList z1, ZUserList z2){
           int count1 = z1.getCountFans();
           int count2 = z2.getCountFans();
           if(count1<count2){
               return 1;
           }else if(count1>count2){
               return -1;
           }else {
               return 0;
           }
        }
}
