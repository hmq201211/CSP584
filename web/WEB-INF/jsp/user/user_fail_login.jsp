
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
