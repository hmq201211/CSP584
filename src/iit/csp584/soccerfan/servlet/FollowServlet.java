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

@WebServlet("/FollowServlet")
public class FollowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = null;
        if (!Utilities.isLoginIn(req)) {
            requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_not_login.jsp");
        } else {
            String type = req.getParameter("type");
            System.out.println(type);
            if (type.equals("Follow")) {
                String id = req.getParameter("id");
                String itemtype = req.getParameter("itemtype");
                if (id != null && itemtype != null) {
                    Utilities.addFollow(id, itemtype);
                    requestDispatcher = req.getRequestDispatcher("FollowServlet?type=List");
                } else {
                    requestDispatcher = req.getRequestDispatcher("welcome_page.jsp");
                }
            } else if (type.equals("List")) {
                List<String> follows = Utilities.getFollows();
                req.setAttribute("list", follows);
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/follow/follow_list.jsp");
            } else if (type.equals("Rank")) {
                String players = Utilities.getFollowRank("player");
                String teams = Utilities.getFollowRank("team");
                String games = Utilities.getFollowRank("game");
                String accessories = Utilities.getFollowRank("accessory");
                req.setAttribute("players", players);
                req.setAttribute("teams", teams);
                req.setAttribute("games", games);
                req.setAttribute("accessories", accessories);
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/follow/follow_rank.jsp");
            } else if (type.equals("Delete")) {
                String id = req.getParameter("id");
                String itemtype = req.getParameter("itemtype");
                if (id != null && itemtype != null) {
                    Utilities.deleteFollow(id, itemtype);
                    requestDispatcher = req.getRequestDispatcher("FollowServlet?type=List");
                } else {
                    requestDispatcher = req.getRequestDispatcher("welcome_page.jsp");
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
