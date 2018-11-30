<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Warning</title>
</head>
<body>
Delete ${username} Fail.....You can not delete yourself.....Leading You To List Page
<%
    response.setHeader("refresh","1.2;URL=UserServlet?type=UserList");
%>
</body>
</html>
