package iit.csp584.soccerfan.servlet;

import iit.csp584.soccerfan.bean.Accessory;
import iit.csp584.soccerfan.bean.Game;
import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.service.GameServiceImpl;
import iit.csp584.soccerfan.utility.Utilities;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@WebServlet("/GameServlet")
public class GameServlet extends HttpServlet {
    private GameServiceImpl gsi = new GameServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        System.out.println(type);
        RequestDispatcher requestDispatcher = null;
        if (type.equals("GameList")) {
            String league = req.getParameter("league");
            List<Game> list = null;
            if (league == null) {
                list = gsi.getAll();
            } else {
                list = gsi.getByLeague(league);
            }
            req.setAttribute("list", list);
            requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/game/game_list.jsp");

        } else {
            if (((User) req.getSession().getAttribute("User")).getUsertype().equals("Member")) {
                if (type.equals("GameDelete")) {
                    String id = req.getParameter("id");
                    gsi.delete(id);
                    req.setAttribute("id", id);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/game/game_delete_success.jsp");
                } else if (type.equals("GameModify")) {
                    String oldId = req.getParameter("oldId");
                    Game oldGame = gsi.getById(oldId);
                    gsi.delete(oldId);
                    String id = req.getParameter("id");
                    String league = req.getParameter("league");
                    String time = req.getParameter("time");
                    String home_team = req.getParameter("home_team");
                    String score = req.getParameter("score");
                    String guest_team = req.getParameter("guest_team");
                    String address = req.getParameter("address");
                    Game found = gsi.getById(id);
                    System.out.println(found);
                    if (found == null) {
                        Game game = new Game(id, league, time, home_team, score, guest_team, address);
                        gsi.add(game);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/game/game_success_update.jsp");
                    } else {
                        gsi.add(oldGame);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/game/game_fail_update.jsp");
                    }
                } else if (type.equals("GameUpdate")) {
                    String id = req.getParameter("id");
                    Game game = gsi.getById(id);
                    req.setAttribute("Game", game);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/game/game_modify_page.jsp");

                } else if (type.equals("GameAddOne")) {
                    String id = req.getParameter("id");
                    Game game = gsi.getById(id);
                    if (game == null) {
                        String league = req.getParameter("league");
                        String time = req.getParameter("time");
                        String home_team = req.getParameter("home_team");
                        String score = req.getParameter("score");
                        String guest_team = req.getParameter("guest_team");
                        String address = req.getParameter("address");
                        game = new Game(id, league, time, home_team, score, guest_team, address);
                        gsi.add(game);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/game/game_success_update.jsp");
                    } else {
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/game/game_fail_update.jsp");
                    }
                }
            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/game/game_no_right.jsp");
            }
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
