package iit.csp584.soccerfan.utility;

import iit.csp584.soccerfan.bean.Game;
import iit.csp584.soccerfan.bean.User;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;

public class Utilities {
    public static void login(HttpServletRequest httpServletRequest, User user) {
        if (!isLoginIn(httpServletRequest)) {
            httpServletRequest.getSession().setAttribute("User", user);
        }
    }

    public static boolean isLoginIn(HttpServletRequest httpServletRequest) {
        return httpServletRequest.getSession().getAttribute("User") != null;
    }

    public static long dateToLong(String date) {
        long time = 0;
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-sss");
            time = simpleDateFormat.parse(date).getTime();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return time;
        }

    }
}
