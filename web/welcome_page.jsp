
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="Header.jsp"></jsp:include>
<div id='menu' style='float: right;'><ul><li><a href='ViewOrder'><span class='glyphicon'>View Order</span></a></li><li><a href='#'><span class='glyphicon'>Welcome: ${sessionScope.get("User").username}</span></a></li><li><a href='Cart'><span class='glyphicon'>Cart(0)</span></a></li></ul></div></div><div id='page'>
<jsp:include page="LeftNavigationBar.jsp"></jsp:include>
<jsp:include page="Content.jsp"></jsp:include>
<jsp:include page="Footer.jsp"></jsp:include>


