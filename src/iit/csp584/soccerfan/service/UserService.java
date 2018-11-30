package iit.csp584.soccerfan.service;

import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.bean.UserInfo;

public interface UserService extends Service<User, String> {
    User checkLogin(String username, String password);
    UserInfo getUserInfo(User user);

}
