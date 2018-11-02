<%--
  Created by IntelliJ IDEA.
  User: HMQhm
  Date: 2018/11/1
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Success</title>
</head>
<body>
Login Success.....Leading You To Manager Page.....
<%
    response.setHeader("refresh","3;URL=UserServlet?type=UserList");
%>
</body>
</html>
