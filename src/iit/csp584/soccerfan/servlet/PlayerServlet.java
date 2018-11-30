package iit.csp584.soccerfan.servlet;

import iit.csp584.soccerfan.bean.Player;
import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.service.PlayerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/PlayerServlet")
public class PlayerServlet extends HttpServlet {
    private PlayerServiceImpl psi = new PlayerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        System.out.println(type);
        RequestDispatcher requestDispatcher = null;
        if (type.equals("PlayerList")) {
            List<Player> list = psi.getAll();
            req.setAttribute("list", list);
            requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/player/player_list.jsp");
        } else {
            if (((User) req.getSession().getAttribute("User")).getUsertype().equals("Member")) {
                if (type.equals("PlayerDelete")) {
                    String id = req.getParameter("id");
                    psi.delete(id);
                    req.setAttribute("id", id);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/player/player_delete_success.jsp");
                } else if (type.equals("PlayerModify")) {
                    String oldId = req.getParameter("oldId");
                    Player oldPlayer = psi.getById(oldId);
                    psi.delete(oldId);
                    String id = req.getParameter("id");
                    String name = req.getParameter("name");
                    String age = req.getParameter("age");
                    String teamid = req.getParameter("teamid");
                    String number = req.getParameter("number");
                    String position = req.getParameter("position");
                    Player found = psi.getById(id);
                    System.out.println(found);
                    if (found == null) {
                        Player player = new Player(id, name, age, teamid, number, position);
                        psi.add(player);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/player/player_success_update.jsp");
                    } else {
                        psi.add(oldPlayer);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/player/player_fail_update.jsp");
                    }
                } else if (type.equals("PlayerUpdate")) {
                    String id = req.getParameter("id");
                    Player player = psi.getById(id);
                    req.setAttribute("Player", player);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/player/player_modify_page.jsp");

                } else if (type.equals("PlayerAddOne")) {
                    String id = req.getParameter("id");
                    Player player = psi.getById(id);
                    if (player == null) {
                        String name = req.getParameter("name");
                        String age = req.getParameter("age");
                        String teamid = req.getParameter("teamid");
                        String number = req.getParameter("number");
                        String position = req.getParameter("position");
                        Player newPlayer = new Player(id, name, age, teamid, number, position);
                        psi.add(newPlayer);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/player/player_success_update.jsp");
                    }
                    else {
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/player/player_fail_update.jsp");
                    }
                }
            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/player/player_no_right.jsp");
            }
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
