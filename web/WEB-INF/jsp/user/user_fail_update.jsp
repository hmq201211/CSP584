<%--
  Created by IntelliJ IDEA.
  User: HMQhm
  Date: 2018/11/1
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Update Fail</title>
</head>
<body>
User Update Fail.....Leading You To List Page.....
<%
    response.setHeader("refresh","3;URL=UserServlet?type=UserList");
%>

</body>
</html>
