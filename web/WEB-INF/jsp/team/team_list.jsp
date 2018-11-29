<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/Header.jsp"></jsp:include>

<script type="text/javascript">
    function addOne() {
        var tag = document.getElementById("addone");
        tag.style.display = "";
    }

    function validate() {
        var id = document.getElementById("id").value;
        if (id == "") {
            document.getElementById("idcheck").innerHTML = "<font color='red' size='-1'>id should not be empty<font>";
            return false;
        }
        var name = document.getElementById("name").value;
        if (name == "") {
            document.getElementById("namecheck").innerHTML = "<font color='red' size='-1'>name should not be empty<font>";
            return false;
        }
        var league = document.getElementById("league").value;
        if (league == "") {
            document.getElementById("leaguecheck").innerHTML = "<font color='red' size='-1'>league should not be empty<font>";
            return false;
        }
        var country = document.getElementById("country").value;
        if (country == "") {
            document.getElementById("countrycheck").innerHTML = "<font color='red' size='-1'>country should not be empty<font>";
            return false;
        }
        var address = document.getElementById("address").value;
        if (address == "") {
            document.getElementById("addresscheck").innerHTML = "<font color='red' size='-1'>address should not be empty<font>";
            return false;
        }
        return true;
    }
</script>
<div id='menu' style='float: right;'>
    <ul>
        <li><a href='ViewOrder'><span class='glyphicon'>View Order</span></a></li>
        <li><a href='#'><span class='glyphicon'>Welcome: ${sessionScope.get("User").username}</span></a></li>
        <li><a href='Cart'><span class='glyphicon'>Cart(0)</span></a></li>
    </ul>
</div>

</div><div id='page'>
<jsp:include page="/LeftNavigationBar.jsp"></jsp:include>
<div id='content'>
    <div class='post'><h2 class='title meta'>
        <a style='font-size: 24px;'>Teams</a>
    </h2>
        <div class='entry'>
            <table id='bestseller'>

                <c:forEach items="${list}" var="team" varStatus="userStatus">
                    <c:if test="${userStatus.count%3==1}">
                        <tr></c:if>
                    <td>
                        <div id='shop_item'><h3> ${team.name} </h3>
                            <strong>${team.league}</strong>
                            <ul>
                                <li id='item'><img src='images/team/${team.id}.JPG' alt=''/></li>
                                <li>
                                    <form method='post' action='Follow'>
                                        <input type='hidden' name='id' value='${team.id}'>
                                        <input type='submit' class='btnbuy' value='Follow Now'></form>
                                </li>
                                <li>
                                    <form method='post' action='ReviewServlet?type=Write'>
                                        <input type='hidden' name='id' value='${team.id}'>
                                        <input type='submit' value='WriteReview' class='btnreview'></form>
                                </li>
                                <li>
                                    <form method='post' action='ReviewServlet?type=View'>
                                        <input type='hidden' name='id' value='${team.id}'>
                                        <input type='submit' value='ViewReview' class='btnreview'></form>
                                </li>
                                <li align="middle">
                                    <form method='post' action='TeamServlet?type=TeamUpdate'>
                                        <input type='hidden' name='id' value='${team.id}'>
                                        <input type='submit' value='Modify' class='Member'></form>
                                </li>
                                <li align="middle">
                                    <form method='post' action='TeamServlet?type=TeamDelete'>
                                        <input type='hidden' name='id' value='${team.id}'>
                                        <input type='submit' value='Delete' class='Member'></form>
                                </li>
                            </ul>
                        </div>
                    </td>

                    <c:if test="${userStatus.count % 3 == 0||userStatus.count==userStatus.end} "></tr></c:if>


                </c:forEach>
            </table>
            <br>
            <div id="addone" style="display: none">
                <form action="TeamServlet?type=TeamAddOne" method="post" onsubmit="return validate()">
                    <div><h3>id:</h3> <input type="text" name="id" id="id"
                                             class='input'><span id="idcheck"></span>
                    </div>
                    <br>
                    <div><h3>name:</h3> <input type="text" name="name" id="name"
                                               class='input'><span id="namecheck"></span>
                    </div>
                    <br>
                    <div><h3>league:</h3> <input type="text" name="league" id="league"
                                                 class='input'><span id="leaguecheck"></span>
                    </div>
                    <br>
                    <div><h3>country:</h3> <input type="text" name="country" id="country"
                                                 class='input'><span id="countrycheck"></span>
                    </div>
                    <br>
                    <div><h3>address:</h3> <input type="text" name="address" id="address"
                                                   class='input'><span id="addresscheck"></span>
                    </div>
                    <br>
                    <div>
                        <input type="submit" value="submit" class='btnbuy'>
                        <input type="reset" value="reset" class='btnbuy'>
                    </div>
                </form>
            </div>

            <br>
            <button onclick="addOne()" class='btnbuy' id="Member">Add One Team</button>
            <script type="text/javascript">

                window.onload = function () {
                    var usertype = "${sessionScope.User.usertype}";
                    if (usertype != "Member") {
                        var tags = document.getElementsByClassName("Member");
                        for (var i = 0; i < tags.length; i++) {
                            tags[i].type = "hidden";
                        }
                        $("#Member").hide();
                    }

                }
            </script>
        </div>
    </div>
</div>

<jsp:include page="/Footer.jsp"></jsp:include>
