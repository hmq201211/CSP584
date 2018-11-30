package iit.csp584.soccerfan.servlet;

import iit.csp584.soccerfan.bean.Review;
import iit.csp584.soccerfan.utility.MongoDatabaseUtility;
import iit.csp584.soccerfan.utility.Utilities;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        System.out.println(type);
        RequestDispatcher requestDispatcher = null;
        if (type.equals("Write")) {
            if (!Utilities.isLoginIn(req)) {
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/user/user_not_login.jsp");
            } else {
                String id = req.getParameter("id");
                String itemtype = req.getParameter("itemtype");
                req.setAttribute("id", id);
                req.setAttribute("itemtype", itemtype);
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/review/review_write.jsp");
            }
        } else if (type.equals("View")) {
            String id = req.getParameter("id");
            String itemtype = req.getParameter("itemtype");
            if (id != null && itemtype != null) {
                List<Review> reviews = MongoDatabaseUtility.selectReviewByIdAndType(id, itemtype);
                req.setAttribute("list", reviews);
                requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/review/review_view.jsp");
            } else{
                requestDispatcher = req.getRequestDispatcher("welcome_page.jsp");
            }
        } else if (type.equals("Submit")) {
            String id = req.getParameter("id");
            String itemtype = req.getParameter("itemtype");
            String star = req.getParameter("star");
            String content = req.getParameter("content");
            String msg = MongoDatabaseUtility.insertReview(id, itemtype, star, content);
            requestDispatcher = req.getRequestDispatcher("WEB-INF/jsp/review/review_" + msg.toLowerCase() + "_submit.jsp");
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
