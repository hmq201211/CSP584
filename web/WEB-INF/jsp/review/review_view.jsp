<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/Header.jsp"></jsp:include>



</div><div id='page'>
<jsp:include page="/LeftNavigationBar.jsp"></jsp:include>
<div id='content'>
    <div class='post'><h2 class='title meta'>
        <a style='font-size: 24px;'>Reviews</a>
    </h2>
        <div class='entry'>
            <table id='bestseller'>

                <c:forEach items="${list}" var="review" varStatus="userStatus">
                    <c:if test="${userStatus.count%3==1}">
                        <tr></c:if>
                    <td>
                        <div id='shop_item'><h3> ${review.id} </h3>
                            <strong><font color= aqua>Reviewer Name:</font> ${review.username}</strong>
                            <ul>
                                <li id='item'><img src='images/${review.type}/${review.id}.JPG' alt=''/></li>
                                <li>
                                    <strong> <font color= #dc143c>Reviewer's Rating:</font>${review.star} star</strong>
                                </li>
                                <li>
                                    <strong><font color= #006400>Reviewer's Word:</font> ${review.content} </strong>
                                </li>
                                <li>
                                    <strong><font color= #4b0082>Review Time:</font> ${review.time} </strong>
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