<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart Empty</title>
</head>
<body>
Your Cart is empty.....Leading You To Welcome Page.....
<%
    response.setHeader("refresh","1.2;URL=welcome_page.jsp");
%>
</body>
</html>
