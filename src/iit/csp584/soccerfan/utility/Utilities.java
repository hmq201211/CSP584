package iit.csp584.soccerfan.utility;

import iit.csp584.soccerfan.bean.Accessory;
import iit.csp584.soccerfan.bean.Game;
import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.bean.UserInfo;
import iit.csp584.soccerfan.service.AccessoryServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class Utilities {
    private static User user;
    private static UserInfo userInfo;
    private static List<String> usercart;

    public static void login(HttpServletRequest httpServletRequest, User user, UserInfo userInfo) {
        if (!isLoginIn(httpServletRequest)) {
            httpServletRequest.getSession().setAttribute("User", user);
            Utilities.user = user;
            httpServletRequest.getSession().setAttribute("UserInfo", userInfo);
            Utilities.userInfo = userInfo;
            usercart = new ArrayList<>();
        }
    }

    public static User getCurrentUser() {
        return user;
    }

    public static boolean isLoginIn(HttpServletRequest httpServletRequest) {
        return httpServletRequest.getSession().getAttribute("User") != null;
    }

    public static String getCurrentTime() {
        String time = null;
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            time = simpleDateFormat.format(new Date());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return time;
        }

    }

    public static void addFollow(String id, String itemtype) {
        Boolean flag = true;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        connection = GetMySQLConnenction.getConnection();
        try {
            preparedStatement = connection.prepareStatement("insert into follow values (?,?,?,?)");
            preparedStatement.setString(1, getUUID32());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, id);
            preparedStatement.setString(4, itemtype);
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            flag = false;
        }
        if (flag) {
            userInfo.setFollow(userInfo.getFollow() + 1);
        }

    }

    public static List<String> getFollows() {
        ArrayList<String> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        connection = GetMySQLConnenction.getConnection();
        try {
            preparedStatement = connection.prepareStatement("select * from follow where username = ?");
            preparedStatement.setString(1, user.getUsername());
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                StringBuffer sb = new StringBuffer();
                sb.append(resultSet.getString("itemid"));
                sb.append("-");
                sb.append(resultSet.getString("itemtype"));
                list.add(sb.toString());
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void deleteFollow(String id, String itemtype) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        connection = GetMySQLConnenction.getConnection();
        try {
            preparedStatement = connection.prepareStatement("delete from follow where username = ? and itemid =?  and itemtype =?");
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, id);
            preparedStatement.setString(3, itemtype);
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getUUID32() {
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        return uuid;
    }


    public static List<String> getCart() {
        return usercart;
    }

    public static void addCart(String id) {
        StringBuffer sb = new StringBuffer();
        Accessory accessory = new AccessoryServiceImpl().getById(id);
        sb.append(accessory.getId());
        sb.append("-");
        sb.append(accessory.getName());
        sb.append("-");
        sb.append(accessory.getPrice());
        usercart.add(sb.toString());
        userInfo.setCart(userInfo.getCart() + 1);
        System.out.println("addcart"+usercart);
    }

    public static void removeCart(String id) {
        StringBuffer sb = new StringBuffer();
        Accessory accessory = new AccessoryServiceImpl().getById(id);
        sb.append(accessory.getId());
        sb.append("-");
        sb.append(accessory.getName());
        sb.append("-");
        sb.append(accessory.getPrice());
        usercart.remove(sb.toString());
        userInfo.setCart(userInfo.getCart() - 1);
        System.out.println("removecart"+usercart);
    }

    public static void placeCart(String creditNumber, String address) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        connection = GetMySQLConnenction.getConnection();
        try {
            for (String s : usercart) {
                String[] results = s.split("-");
                preparedStatement = connection.prepareStatement("insert  into userorder values (?,?,?,?,?,?,?)");
                preparedStatement.setString(1, getUUID32());
                preparedStatement.setString(2, user.getUsername());
                preparedStatement.setString(3, results[0]);
                preparedStatement.setString(4, results[2]);
                preparedStatement.setString(5, creditNumber);
                preparedStatement.setString(6, address);
                preparedStatement.setString(7, getCurrentTime());
                preparedStatement.execute();
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
            usercart = new ArrayList<>();
            userInfo.setCart(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<String> getOrders() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<String> orders = null;
        connection = GetMySQLConnenction.getConnection();
        try {
            preparedStatement = connection.prepareStatement("select * from userorder where username = ?");
            preparedStatement.setString(1, user.getUsername());
            resultSet = preparedStatement.executeQuery();
            orders = new ArrayList<>();
            while (resultSet.next()) {
                StringBuffer sb = new StringBuffer();
                sb.append(resultSet.getString("username"));
                sb.append("-");
                sb.append(resultSet.getString("itemid"));
                sb.append("-");
                sb.append(resultSet.getString("price"));
                sb.append("-");
                sb.append(resultSet.getString("creditnumber"));
                sb.append("-");
                sb.append(resultSet.getString("address"));
                sb.append("-");
                sb.append(resultSet.getString("time"));
                orders.add(sb.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
}
