<%--
  Created by IntelliJ IDEA.
  User: HMQhm
  Date: 2018/11/1
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="iit.csp584.soccerfan.bean.User" %>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<%--Welcome: <%--%>
    <%--User user = ((User)session.getAttribute("User"));--%>
    <%--out.print(user.getUsername());--%>
<%--%>--%>
Welcome: ${sessionScope.get("User").username}
</body>
</html>
