package iit.csp584.soccerfan.dao;

import iit.csp584.soccerfan.bean.User;

public interface UserDao extends Dao<User, String> {
    User checkLogin(String username, String password);
}
