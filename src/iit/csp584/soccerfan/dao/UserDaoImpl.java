package iit.csp584.soccerfan.dao;

import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.bean.UserInfo;
import iit.csp584.soccerfan.utility.GetMySQLConnenction;
import org.apache.jasper.tagplugins.jstl.core.If;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;


    @Override
    public void add(User user) {
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("INSERT INTO user values(?,?,?) ");
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getUsertype());
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void delete(String s) {
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("delete from user where username = ? ");
            preparedStatement.setString(1, s);
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    @Override
    public List<User> getAll() {
        List<User> l = new ArrayList<>();
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from user ");

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String usertype = resultSet.getString("usertype");
                User user = new User(username, password, usertype);
                l.add(user);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    @Override
    public User getById(String s) {
        User user = null;
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from user where username = ? ");
            preparedStatement.setString(1, s);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String usertype = resultSet.getString("usertype");
                user = new User(username, password, usertype);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public User checkLogin(String username, String password) {
        User user = null;
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from user where username = ? and password = ?");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String usertype = resultSet.getString("usertype");
                user = new User(username, password, usertype);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public UserInfo getUserInfo(User user) {
        UserInfo userInfo = null;
        int followCount = 0;
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from follow where username = ?");
            preparedStatement.setString(1, user.getUsername());
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                followCount++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        userInfo = new UserInfo(user.getUsername(), 0, followCount);
        return userInfo;
    }
}
