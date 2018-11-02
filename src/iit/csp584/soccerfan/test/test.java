package iit.csp584.soccerfan.test;

import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.dao.UserDaoImpl;

public class test {
    public static void main(String[] args) {
        UserDaoImpl u= new UserDaoImpl();
        User user= u.getById("123");
        System.out.println(user);
    }
}
