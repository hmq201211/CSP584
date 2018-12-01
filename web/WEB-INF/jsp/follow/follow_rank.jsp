<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/Header.jsp"></jsp:include>


</div><div id='page'>
<jsp:include page="/LeftNavigationBar.jsp"></jsp:include>
<div id='content'>
    <div class='post'><h2 class='title meta'>
        <a style='font-size: 24px;'>Trend</a>
    </h2>
        <div class='entry'>
            <strong>Player:</strong>
            <table id='bestseller'>
                <c:set value="${ fn:split(players, ';') }" var="result"></c:set>
                <c:forEach items="${result}" var="string">
                    <c:set value="${ fn:split(string, '-') }" var="item"></c:set>
                    <tr>
                        <td>
                            <img src="images/player/${item[0]}.JPG" alt=''>
                        </td>
                        <td>
                            <strong>Follow Count: ${item[1]}</strong>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <strong>Team:</strong>
            <table id='bestseller'>
                <c:set value="${ fn:split(teams, ';') }" var="result"></c:set>
                <c:forEach items="${result}" var="string">
                    <c:set value="${ fn:split(string, '-') }" var="item"></c:set>
                    <tr>
                        <td>
                            <img src="images/team/${item[0]}.JPG" alt=''>
                        </td>
                        <td>
                            <strong>Follow Count: ${item[1]}</strong>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <strong>Game:</strong>
            <table id='bestseller'>
                <c:set value="${ fn:split(games, ';') }" var="result"></c:set>
                <c:forEach items="${result}" var="string">
                    <c:set value="${ fn:split(string, '-') }" var="item"></c:set>
                    <tr>
                        <td>
                            <img src="images/game/${item[0]}.JPG" alt=''>
                        </td>
                        <td>
                            <strong>Follow Count: ${item[1]}</strong>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <strong>Accessory:</strong>
            <table id='bestseller'>
                <c:set value="${ fn:split(accessories, ';') }" var="result"></c:set>
                <c:forEach items="${result}" var="string">
                    <c:set value="${ fn:split(string, '-') }" var="item"></c:set>
                    <tr>
                        <td>
                            <img src="images/accessory/${item[0]}.JPG" alt=''>
                        </td>
                        <td>
                            <strong>Follow Count: ${item[1]}</strong>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </div>
    </div>
</div>

<jsp:include page="/Footer.jsp"></jsp:include>
