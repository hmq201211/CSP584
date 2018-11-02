package iit.csp584.soccerfan.servlet;

import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.service.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private UserServiceImpl userServiceImpl = new UserServiceImpl();

    /**
     * type = UserLogin -->userLogin
     * type = UserRegister -->userRegister
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        System.out.println(type);
        RequestDispatcher requestDispatcher = null;

        if (type.equals("UserLogin"))
            requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_login.jsp");
        else if (type.equals("UserRegister"))
            requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_register.jsp");
        else if (type.equals("UserCheckLogin")) {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            User found = userServiceImpl.checkLogin(username, password);
            if (found != null) {
                req.getSession().setAttribute("User", found);
                if (found.getUsertype().equals("User"))
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_success_login.jsp");
                else if (found.getUsertype().equals("Manager"))
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/manager_success_login.jsp");
            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_fail_login.jsp");
            }

        } else if (type.equals("UserAdd")) {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String usertype = req.getParameter("usertype");
            User found = userServiceImpl.getById(username);
            System.out.println(found);
            if (found == null) {
                User user = new User(username, password, usertype);
                userServiceImpl.add(user);
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_success_register.jsp");
            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_fail_register.jsp");
            }
        } else if (type.equals("UserList")) {
            if (((User) req.getSession().getAttribute("User")).getUsertype().equals("Manager")) {
                List<User> list = userServiceImpl.getAll();
                req.setAttribute("list", list);
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_list.jsp");
            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_no_right.jsp");
            }
        } else if (type.equals("UserDelete")) {
            if (((User) req.getSession().getAttribute("User")).getUsertype().equals("Manager")) {
                String username = req.getParameter("username");
                userServiceImpl.delete(username);
                req.setAttribute("username", username);
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_delete_success.jsp");
            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_no_right.jsp");
            }
        } else if (type.equals("UserModify")) {
            if (((User) req.getSession().getAttribute("User")).getUsertype().equals("Manager")) {
                String oldName = req.getParameter("oldName");
                User oldUser = userServiceImpl.getById(oldName);
                userServiceImpl.delete(oldName);
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                String usertype = req.getParameter("usertype");
                User found = userServiceImpl.getById(username);
                System.out.println(found);
                if (found == null) {
                    User user = new User(username, password, usertype);
                    userServiceImpl.add(user);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_success_update.jsp");
                } else {
                    userServiceImpl.add(oldUser);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_fail_update.jsp");
                }
            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_no_right.jsp");
            }
        } else if (type.equals("UserUpdate")) {
            if (((User) req.getSession().getAttribute("User")).getUsertype().equals("Manager")) {
                String username = req.getParameter("username");
                User user = userServiceImpl.getById(username);
                req.setAttribute("User", user);
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_modify_page.jsp");
            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_no_right.jsp");
            }
        }else if (type.equals("UserAddOne")) {
            if (((User) req.getSession().getAttribute("User")).getUsertype().equals("Manager")) {
                String username = req.getParameter("username");
                User user = userServiceImpl.getById(username);
                if(user==null){
                    String password = req.getParameter("password");
                    String usertype = req.getParameter("usertype");
                    User newUser = new User(username,password,usertype);
                    userServiceImpl.add(newUser);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_success_update.jsp");
                }else{
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_fail_update.jsp");
                }

            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_no_right.jsp");
            }
        }
        requestDispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws
            ServletException, IOException {
        doGet(req, resp);
    }

}