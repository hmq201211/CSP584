<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/Header.jsp"></jsp:include>



</div><div id='page'>
<jsp:include page="/LeftNavigationBar.jsp"></jsp:include>
<div id='content'>
    <div class='post'><h2 class='title meta'>
        <a style='font-size: 24px;'>My Orders</a>
    </h2>
        <div class='entry'>
            <table id='bestseller'>

                <c:forEach items="${list}" var="string" varStatus="userStatus">
                    <c:if test="${userStatus.count%3==1}">
                        <tr></c:if>
                    <td>
                        <c:set value="${ fn:split(string, '-') }" var="result"></c:set>
                        <c:set var="Total" value="${Total+result[2]}"></c:set>
                        <div id='shop_item'><h3> <font color="red">No.${userStatus.count} </font> </h3>
                            <strong><font color="red">Customer Name:${result[0]}</font></strong>
                            <ul>
                                <li id='item'><img src='images/accessory/${result[1]}.JPG' alt=''/></li>
                                <li id='item'><strong>Price: ${result[2]}</strong></li>
                                <li id='item'><strong>Credit Card Number: ${result[3]}</strong></li>
                                <li id='item'><strong>Order Address: ${result[4]}</strong></li>
                                <li id='item'><strong>Order Time: ${result[5]}-${result[6]}-${result[7]}</strong></li>
                            </ul>
                        </div>
                    </td>

                    <c:if test="${userStatus.count % 3 == 0||userStatus.count==userStatus.end} "></tr></c:if>


                </c:forEach>
            </table>
        </div>
    </div>
</div>

<jsp:include page="/Footer.jsp"></jsp:include>
