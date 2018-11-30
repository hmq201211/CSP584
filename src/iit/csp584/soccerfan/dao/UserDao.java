package iit.csp584.soccerfan.dao;

import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.bean.UserInfo;

public interface UserDao extends Dao<User, String> {
    User checkLogin(String username, String password);
    UserInfo getUserInfo(User user);
}
