package iit.csp584.soccerfan.service;

import iit.csp584.soccerfan.bean.User;

public interface UserService extends Service<User, String> {
    User checkLogin(String username, String password);

}
