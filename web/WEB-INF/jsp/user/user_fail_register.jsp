<%--
  Created by IntelliJ IDEA.
  User: HMQhm
  Date: 2018/11/1
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Fail</title>
</head>
<body>
Register Fail.....Please Try Again.....
<%
    response.setHeader("refresh","3;URL=UserServlet?type=UserRegister");
%>

</body>
</html>
