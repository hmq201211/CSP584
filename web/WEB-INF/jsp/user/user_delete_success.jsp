
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Success</title>
</head>
<body>
Delete ${username} Success.....Leading You To List Page
<%
    response.setHeader("refresh","1.2;URL=UserServlet?type=UserList");
%>

</body>
</html>
