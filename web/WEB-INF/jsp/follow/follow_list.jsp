<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/Header.jsp"></jsp:include>



</div><div id='page'>
<jsp:include page="/LeftNavigationBar.jsp"></jsp:include>
<div id='content'>
    <div class='post'><h2 class='title meta'>
        <a style='font-size: 24px;'>MyFollows</a>
    </h2>
        <div class='entry'>
            <table id='bestseller'>

                <c:forEach items="${list}" var="string" varStatus="userStatus">
                    <c:if test="${userStatus.count%3==1}">
                        <tr></c:if>
                    <td>
                        <c:set value="${ fn:split(string, '-') }" var="result"></c:set>
                        <div id='shop_item'><h3> <font color="red">No.${userStatus.count} </font> </h3>
                            <strong>${result[1]}</strong>
                            <ul>
                                <li id='item'><img src='images/${result[1]}/${result[0]}.JPG' alt=''/></li>
                                <li>
                                    <form action='FollowServlet?type=Delete' method='post'>
                                        <input type='hidden' name='id' value='${result[0]}'>
                                        <input type="hidden" name="itemtype" value="${result[1]}">
                                        <input type='submit' class='btnbuy' value='Cancel Follow'></form>
                                </li>
                                <li>
                                    <form method='post' action='ReviewServlet?type=Write'>
                                        <input type='hidden' name='id' value='${result[0]}'>
                                        <input type="hidden" name="itemtype" value="${result[1]}">
                                        <input type='submit' value='WriteReview' class='btnreview'></form>
                                </li>
                                <li>
                                    <form method='post' action='ReviewServlet?type=View'>
                                        <input type='hidden' name='id' value='${result[0]}'>
                                        <input type="hidden" name="itemtype" value="${result[1]}">
                                        <input type='submit' value='ViewReview' class='btnreview'></form>
                                </li>
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
