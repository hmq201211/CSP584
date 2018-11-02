<%--
  Created by IntelliJ IDEA.
  User: HMQhm
  Date: 2018/11/1
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Success</title>
</head>
<body>
Delete ${username} Success.....Leading You To List Page
<%
    response.setHeader("refresh","3;URL=UserServlet?type=UserList");
%>

</body>
</html>
