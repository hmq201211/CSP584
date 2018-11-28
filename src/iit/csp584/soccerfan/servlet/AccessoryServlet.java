package iit.csp584.soccerfan.servlet;

import iit.csp584.soccerfan.bean.Accessory;
import iit.csp584.soccerfan.bean.Team;
import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.service.AccessoryServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AccessoryServlet")
public class AccessoryServlet extends HttpServlet {
    private AccessoryServiceImpl asi = new AccessoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        System.out.println(type);
        RequestDispatcher requestDispatcher = null;
        if (type.equals("AccessoryList")) {
            String maker = req.getParameter("maker");
            List<Accessory> list = null;
            if (maker == null) {
                list = asi.getAll();
            } else {
                list = asi.getByMaker(maker);
            }
            req.setAttribute("list", list);

            requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/accessory/accessory_list.jsp");

        } else {
            if (((User) req.getSession().getAttribute("User")).getUsertype().equals("Member")) {
                if (type.equals("AccessoryDelete")) {
                    String id = req.getParameter("id");
                    asi.delete(id);
                    req.setAttribute("id", id);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/accessory/accessory_delete_success.jsp");
                } else if (type.equals("AccessoryModify")) {
                    String oldId = req.getParameter("oldId");
                    Accessory oldAccessory = asi.getById(oldId);
                    asi.delete(oldId);
                    String id = req.getParameter("id");
                    String name = req.getParameter("name");
                    double price = Double.parseDouble(req.getParameter("price"));
                    String maker = req.getParameter("maker");
                    double discount = Double.parseDouble(req.getParameter("discount"));
                    Accessory found = asi.getById(id);
                    System.out.println(found);
                    if (found == null) {
                        Accessory accessory = new Accessory(id, name, price, maker, discount);
                        asi.add(accessory);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/accessory/accessory_success_update.jsp");
                    } else {
                        asi.add(oldAccessory);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/accessory/accessory_fail_update.jsp");
                    }
                } else if (type.equals("AccessoryUpdate")) {
                    String id = req.getParameter("id");
                    Accessory accessory = asi.getById(id);
                    req.setAttribute("Accessory", accessory);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/accessory/accessory_modify_page.jsp");

                } else if (type.equals("AccessoryAddOne")) {
                    String id = req.getParameter("id");
                    Accessory accessory = asi.getById(id);
                    if (accessory == null) {
                        String name = req.getParameter("name");
                        double price = Double.parseDouble(req.getParameter("price"));
                        String maker = req.getParameter("maker");
                        double discount = Double.parseDouble(req.getParameter("discount"));
                         accessory = new Accessory(id, name, price, maker, discount);
                        asi.add(accessory);
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/accessory/accessory_success_update.jsp");
                    } else {
                        requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/accessory/accessory_fail_update.jsp");
                    }
                }
            } else {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/accessory/accessory_no_right.jsp");
            }
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
