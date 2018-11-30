<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Warning</title>
</head>
<body>
You Have No Right To View This Page.....Leading You To Welcome Page.....
<%
    response.setHeader("refresh","1.2;URL=welcome_page.jsp");
%>
</body>
</html>
