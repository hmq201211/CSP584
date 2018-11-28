<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Success</title>
</head>
<body>
Update Success.....Leading You To Member Page.....
<%
    response.setHeader("refresh","3;URL=PlayerServlet?type=PlayerList");
%>
</body>
</html>
