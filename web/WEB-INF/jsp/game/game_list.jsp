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
        var tags = document.getElementsByTagName("span");
        for(var i =0 ;i<tags.length;i++){
            tags[i].innerText = "";
        }
        var id = document.getElementById("id").value;
        if (id == "") {
            document.getElementById("idcheck").innerHTML = "<font color='red' size='-1'>id should not be empty<font>";
            return false;
        }
        var league = document.getElementById("league").value;
        if (league == "") {
            document.getElementById("leaguecheck").innerHTML = "<font color='red' size='-1'>league should not be empty<font>";
            return false;
        }
        var time = document.getElementById("time").value;
        if (time == "") {
            document.getElementById("timecheck").innerHTML = "<font color='red' size='-1'>time should not be empty<font>";
            return false;
        }
        var home_team = document.getElementById("home_team").value;
        if (home_team == "") {
            document.getElementById("home_teamcheck").innerHTML = "<font color='red' size='-1'>home_team should not be empty<font>";
            return false;
        }
        var score = document.getElementById("score").value;
        if (score == "") {
            document.getElementById("scorecheck").innerHTML = "<font color='red' size='-1'>score should not be empty<font>";
            return false;
        }
        var guest_team = document.getElementById("guest_team").value;
        if (guest_team == "") {
            document.getElementById("guest_teamcheck").innerHTML = "<font color='red' size='-1'>guest_team should not be empty<font>";
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

</div><div id='page'>
<jsp:include page="/LeftNavigationBar.jsp"></jsp:include>
<div id='content'>
    <div class='post'><h2 class='title meta'>
        <a style='font-size: 24px;'>Games</a>
    </h2>
        <div class='entry'>
            <table id='bestseller'>

                <c:forEach items="${list}" var="game" varStatus="userStatus">
                    <c:if test="${userStatus.count%3==1}">
                        <tr></c:if>
                    <td>
                        <div id='shop_item'><h3> ${game.home_team} VS ${game.guest_team} </h3>
                            <strong>${game.score}</strong>
                            <ul>
                                <li id='item'><img src='images/game/${game.id}.JPG' alt=''/></li>
                                <li>
                                    <form action='FollowServlet?type=Follow' method='post'>
                                        <input type='hidden' name='id' value='${game.id}'>
                                        <input type="hidden" name="itemtype" value="game">
                                        <input type='submit' class='btnbuy' value='Follow Now'></form>
                                </li>
                                <li>
                                    <form method='post' action='ReviewServlet?type=Write'>
                                        <input type='hidden' name='id' value='${game.id}'>
                                        <input type="hidden" name="itemtype" value="game">
                                        <input type='submit' value='WriteReview' class='btnreview'></form>
                                </li>
                                <li>
                                    <form method='post' action='ReviewServlet?type=View'>
                                        <input type='hidden' name='id' value='${game.id}'>
                                        <input type="hidden" name="itemtype" value="game">
                                        <input type='submit' value='ViewReview' class='btnreview'></form>
                                </li>
                                <li align="middle">
                                    <form method='post' action='GameServlet?type=GameUpdate'>
                                        <input type='hidden' name='id' value='${game.id}'>
                                        <input type='submit'  value='Modify' class='Member'></form>
                                </li>
                                <li align="middle">
                                    <form method='post' action='GameServlet?type=GameDelete'>
                                        <input type='hidden' name='id' value='${game.id}'>
                                        <input type='submit' value='Delete' class='Member' ></form>
                                </li>
                            </ul>
                        </div>
                    </td>

                    <c:if test="${userStatus.count % 3 == 0||userStatus.count==userStatus.end} "></tr></c:if>


                </c:forEach>
            </table>
            <br>
            <div id="addone" style="display: none">
                <form action="GameServlet?type=GameAddOne" method="post" onsubmit="return validate()">
                    <div><h3>id:</h3> <input type="text" name="id" id="id"
                                                   class='input'><span id="idcheck"></span>
                    </div>
                    <br>
                    <div><h3>league:</h3> <input type="text" name="league" id="league"
                                                   class='input'><span id="leaguecheck"></span>
                    </div>
                    <br>
                    <div><h3>time:</h3> <input type="text" name="time" id="time"
                                                   class='input'><span id="timecheck"></span>
                    </div>
                    <br>
                    <div><h3>home_team:</h3> <input type="text" name="home_team" id="home_team"
                                                   class='input'><span id="home_teamcheck"></span>
                    </div>
                    <br>
                    <div><h3>score:</h3> <input type="text" name="score" id="score"
                                                   class='input'><span id="scorecheck"></span>
                    </div>
                    <br>
                    <div><h3>guest_team:</h3> <input type="text" name="guest_team" id="guest_team"
                                                   class='input'><span id="guest_teamcheck"></span>
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
            <button onclick="addOne()" class='btnbuy' id ="Member">Add One Game</button>
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
