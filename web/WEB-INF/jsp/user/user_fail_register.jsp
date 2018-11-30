
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Fail</title>
</head>
<body>
Register Fail.....Please Try Again.....
<%
    response.setHeader("refresh","1.2;URL=UserServlet?type=UserRegister");
%>

</body>
</html>
