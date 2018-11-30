
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Fail</title>
</head>
<body>
Please login First and Try Again.....
<%
    response.setHeader("refresh","1.2;URL=UserServlet?type=UserLogin");
%>
</body>
</html>