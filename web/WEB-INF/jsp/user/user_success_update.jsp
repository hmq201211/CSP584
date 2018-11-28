
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Update Success</title>
</head>
<body>
User Update Success.....Leading You To List Page.....
<%
    response.setHeader("refresh","3;URL=UserServlet?type=UserList");
%>

</body>
</html>
