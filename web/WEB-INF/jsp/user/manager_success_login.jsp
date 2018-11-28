
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
