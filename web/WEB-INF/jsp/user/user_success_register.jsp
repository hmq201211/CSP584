<%--
  Created by IntelliJ IDEA.
  User: HMQhm
  Date: 2018/11/1
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Success</title>
</head>
<body>
Register Success.....Leading You To The Login Page
<%
    response.setHeader("refresh","3;URL=UserServlet?type=UserLogin");
%>
</body>
</html>
