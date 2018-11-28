<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Success</title>
</head>
<body>
Delete Success.....Leading You To Member Page.....
<%
    response.setHeader("refresh","3;URL=PlayerServlet?type=PlayerList");
%>
</body>
</html>
