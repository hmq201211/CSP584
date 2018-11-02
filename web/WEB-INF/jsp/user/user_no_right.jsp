<%--
  Created by IntelliJ IDEA.
  User: HMQhm
  Date: 2018/11/1
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Warning</title>
</head>
<body>
You Have No Right To View This Page.....Leading You To Welcome Page.....
<%
    response.setHeader("refresh","3;URL=welcome_page.jsp");
%>
</body>
</html>
