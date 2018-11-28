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
        var age = document.getElementById("age").value;
        if (age == "") {
            document.getElementById("agecheck").innerHTML = "<font color='red' size='-1'>age should not be empty<font>";
            return false;
        }
        var teamid = document.getElementById("teamid").value;
        if (teamid == "") {
            document.getElementById("teamidcheck").innerHTML = "<font color='red' size='-1'>teamid should not be empty<font>";
            return false;
        }
        var number = document.getElementById("number").value;
        if (number == "") {
            document.getElementById("numbercheck").innerHTML = "<font color='red' size='-1'>number should not be empty<font>";
            return false;
        }
        var position = document.getElementById("position").value;
        if (position == "") {
            document.getElementById("positioncheck").innerHTML = "<font color='red' size='-1'>position should not be empty<font>";
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
        <a style='font-size: 24px;'>Players</a>
    </h2>
        <div class='entry'>
            <table id='bestseller'>

                <c:forEach items="${list}" var="player" varStatus="userStatus">
                    <c:if test="${userStatus.count%3==1}">
                        <tr></c:if>
                    <td>
                        <div id='shop_item'><h3> ${player.name} </h3>
                            <strong>${player.teamid}</strong>
                            <ul>
                                <li id='item'><img src='images/player/${player.id}.JPG' alt=''/></li>
                                <li>
                                    <form method='post' action='Follow'>
                                        <input type='hidden' name='id' value='${player.id}'>
                                        <input type='submit' class='btnbuy' value='Follow Now'></form>
                                </li>
                                <li>
                                    <form method='post' action='WriteReview'>
                                        <input type='hidden' name='id' value='${player.id}'>
                                        <input type='submit' value='WriteReview' class='btnreview'></form>
                                </li>
                                <li>
                                    <form method='post' action='ViewReview'>
                                        <input type='hidden' name='id' value='${player.id}'>
                                        <input type='submit' value='ViewReview' class='btnreview'></form>
                                </li>
                                <li align="middle">
                                    <form method='post' action='PlayerServlet?type=PlayerUpdate'>
                                        <input type='hidden' name='id' value='${player.id}'>
                                        <input type='submit'  value='Modify' class='Member'  ></form>
                                </li>
                                <li align="middle">
                                    <form method='post' action='PlayerServlet?type=PlayerDelete'>
                                        <input type='hidden' name='id' value='${player.id}'>
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
                <form action="PlayerServlet?type=PlayerAddOne" method="post" onsubmit="return validate()">
                    <div><h3>id:</h3> <input type="text" name="id" id="id"
                                                   class='input'><span id="idcheck"></span>
                    </div>
                    <br>
                    <div><h3>name:</h3> <input type="text" name="name" id="name"
                                                   class='input'><span id="namecheck"></span>
                    </div>
                    <br>
                    <div><h3>age:</h3> <input type="text" name="age" id="age"
                                                   class='input'><span id="agecheck"></span>
                    </div>
                    <br>
                    <div><h3>teamid:</h3> <input type="text" name="teamid" id="teamid"
                                                   class='input'><span id="teamidcheck"></span>
                    </div>
                    <br>
                    <div><h3>number:</h3> <input type="text" name="number" id="number"
                                                   class='input'><span id="numbercheck"></span>
                    </div>
                    <br>
                    <div><h3>position:</h3> <input type="text" name="position" id="position"
                                                   class='input'><span id="positioncheck"></span>
                    </div>
                    <br>
                    <div>
                        <input type="submit" value="submit" class='btnbuy'>
                        <input type="reset" value="reset" class='btnbuy'>
                    </div>
                </form>
            </div>

            <br>
            <button onclick="addOne()" class='btnbuy' id ="Member">Add One Player</button>
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
