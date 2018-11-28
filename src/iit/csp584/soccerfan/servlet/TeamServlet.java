package iit.csp584.soccerfan.servlet;

import iit.csp584.soccerfan.bean.Player;
import iit.csp584.soccerfan.bean.Team;
import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.service.TeamServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/TeamServlet")
public class TeamServlet extends HttpServlet {
    private TeamServiceImpl tsi = new TeamServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        System.out.println(type);
        RequestDispatcher requestDispatcher = null;
        if (type.equals("TeamList")) {
            List<Team> list = tsi.getAll();
            req.setAttribute("list", list);
            requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/team/team_list.jsp");
        } else {
            if (((User) req.getSession().getAttribute("User")).getUsertype().equals("Member")) {
                if (type.equals("TeamDelete")) {
                    String id = req.getParameter("id");
                    tsi.delete(id);
                    req.setAttribute("id", id);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/team/team_delete_success.jsp");
                } else if (type.equals("TeamModify")) {
                    String oldId = req.getParameter("oldId");
                    Team oldTeam = tsi.getById(oldId);
                    tsi.delete(oldId);
                    String id = req.getParameter("id");
                    String name = req.getParameter("name");
                    String league = req.getParameter("league");
                    String country = req.getParameter("country");
                    String address = req.getParameter("address");
                    Team found = tsi.getById(id);
                    System.out.println(found);
                    if (found == null) {
                        Team team = new Team(id, name, league, country, address);
                        tsi.add(team);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/team/team_success_update.jsp");
                    } else {
                        tsi.add(oldTeam);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/team/team_fail_update.jsp");
                    }
                } else if (type.equals("TeamUpdate")) {
                    String id = req.getParameter("id");
                    Team team = tsi.getById(id);
                    req.setAttribute("Team", team);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/team/team_modify_page.jsp");

                } else if (type.equals("TeamAddOne")) {
                    String id = req.getParameter("id");
                    Team team = tsi.getById(id);
                    if (team == null) {
                        String name = req.getParameter("name");
                        String league = req.getParameter("league");
                        String country = req.getParameter("country");
                        String address = req.getParameter("address");
                        Team newTeam = new Team(id, name, league, country, address);
                        tsi.add(newTeam);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/team/team_success_update.jsp");
                    }
                    else {
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/team/team_fail_update.jsp");
                    }
                }
            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/team/team_no_right.jsp");
            }
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
