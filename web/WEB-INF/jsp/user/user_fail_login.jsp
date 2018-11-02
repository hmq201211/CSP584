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
    <title>Login Fail</title>
</head>
<body>
Login Fail.....Please Try Again.....
<%
    response.setHeader("refresh","3;URL=UserServlet?type=UserLogin");
%>
</body>
</html>
