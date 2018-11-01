package iit.csp584.soccerfan.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
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
        RequestDispatcher rd = null;

        if (type.equals("UserLogin"))
            rd = req.getRequestDispatcher("WEB-INF/jsp/user/user_login.jsp");
        else if (type.equals("UserRegister"))
            rd = req.getRequestDispatcher("WEB-INF/jsp/user/user_register.jsp");
        else if (type.equals("UserCheckLogin")){

        }else if(type.equals("UserAdd")){

        }
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
