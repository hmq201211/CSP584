
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Success</title>
</head>
<body>
Register Success.....Leading You To The Login Page
<%
    response.setHeader("refresh","1.2;URL=UserServlet?type=UserLogin");
%>
</body>
</html>
