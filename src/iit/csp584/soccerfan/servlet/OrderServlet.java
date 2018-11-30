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

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = null;
        if (!Utilities.isLoginIn(req)) {
            requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_not_login.jsp");
        } else {
            String type = req.getParameter("type");
            System.out.println(type);
            if (type.equals("Add")) {
                String id = req.getParameter("id");
                if (id != null) {
                    Utilities.addCart(id);
                    requestDispatcher = req.getRequestDispatcher("OrderServlet?type=Cart");
                } else {
                    requestDispatcher = req.getRequestDispatcher("welcome_page.jsp");
                }
            } else if (type.equals("Cart")) {
                List<String> cart = Utilities.getCart();
                if (cart.size()==0) {
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/order/order_cart_empty.jsp");
                } else {
                    req.setAttribute("list", cart);
                    requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/order/order_cart.jsp");
                }
            } else if (type.equals("Remove")) {
                String id = req.getParameter("id");
                if (id != null) {
                    Utilities.removeCart(id);
                    requestDispatcher = req.getRequestDispatcher("OrderServlet?type=Cart");
                } else {
                    requestDispatcher = req.getRequestDispatcher("welcome_page.jsp");
                }
            } else if (type.equals("Place")) {
                String creditNumber = req.getParameter("creditNumber");
                String address = req.getParameter("address");
                if (creditNumber != null && creditNumber != null) {
                    Utilities.placeCart(creditNumber, address);
                    requestDispatcher = req.getRequestDispatcher("OrderServlet?type=ViewOrder");
                } else {
                    requestDispatcher = req.getRequestDispatcher("welcome_page.jsp");
                }
            } else if (type.equals("ViewOrder")) {
                List<String> orders = Utilities.getOrders();
                req.setAttribute("list", orders);
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/order/order_view.jsp");
            }
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
