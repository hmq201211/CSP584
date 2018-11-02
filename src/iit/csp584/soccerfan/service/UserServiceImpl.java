package iit.csp584.soccerfan.service;

import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.dao.UserDaoImpl;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDaoImpl userDaoImpl = new UserDaoImpl();

    @Override
    public void add(User user) {
        userDaoImpl.add(user);
    }

    @Override
    public void delete(String s) {
        userDaoImpl.delete(s);
    }

    @Override
    public List<User> getAll() {
        return userDaoImpl.getAll();
    }

    @Override
    public User getById(String s) {
        return userDaoImpl.getById(s);
    }

    @Override
    public User checkLogin(String username, String password) {
        User user = userDaoImpl.checkLogin(username, password);
        return user;
    }
}
