package iit.csp584.soccerfan.utility;

import iit.csp584.soccerfan.bean.User;

import javax.servlet.http.HttpServletRequest;

public class Utilities {
    public void login(HttpServletRequest httpServletRequest, User user) {
        if (!isLoginIn(httpServletRequest)) {
            httpServletRequest.getSession().setAttribute("User", user);
        }
    }

    public boolean isLoginIn(HttpServletRequest httpServletRequest) {
        return httpServletRequest.getSession().getAttribute("User") != null;
    }
}
