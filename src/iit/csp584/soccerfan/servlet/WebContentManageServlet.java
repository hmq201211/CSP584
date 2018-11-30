package iit.csp584.soccerfan.servlet;

import iit.csp584.soccerfan.utility.Utilities;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/WebContentManageServlet")

public class WebContentManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = null;
        if (!Utilities.isLoginIn(req)) {
            requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_not_login.jsp");
        } else {
            if (!Utilities.getCurrentUser().getUsertype().equals("Member")) {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_not_right.jsp");
            } else {
                String type = req.getParameter("type");
                System.out.println(type);
                if (type.equals("Player")) {
                        requestDispatcher = req.getRequestDispatcher("PlayerServlet?type=PlayerList");
                } else if (type.equals("Team")) {
                    requestDispatcher = req.getRequestDispatcher("TeamServlet?type=TeamList");
                } else if (type.equals("Game")) {
                    requestDispatcher = req.getRequestDispatcher("GameServlet?type=GameList");
                } else if (type.equals("Accessory")) {
                    requestDispatcher = req.getRequestDispatcher("AccessoryServlet?type=AccessoryList");
                } else if (type.equals("View")) {
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/member_manage.jsp");
                }
            }
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
