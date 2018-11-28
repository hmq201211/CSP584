
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/Header.jsp"></jsp:include>
<script type="text/javascript">
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
</div><div id='page'>
<div class='post' style='float: none; width: 100%'>
    <div class='entry'>
        <div style='width:400px; margin:25px; margin-left: auto;margin-right: auto;'>
            <form action="PlayerServlet?type=PlayerModify&oldId=${requestScope.Player.id}" method="post"
                  onsubmit="return validate()">
                <div><h3>id:</h3> <input type="text" name="id" id="id"
                                         class='input' value="${requestScope.Player.id}"><span id="idcheck"></span>
                </div>
                <br>
                <div><h3>name:</h3> <input type="text" name="name" id="name"
                                           class='input' value="${requestScope.Player.name}"><span id="namecheck"></span>
                </div>
                <br>
                <div><h3>age:</h3> <input type="text" name="age" id="age"
                                          class='input' value="${requestScope.Player.age}"><span id="agecheck"></span>
                </div>
                <br>
                <div><h3>teamid:</h3> <input type="text" name="teamid" id="teamid"
                                             class='input' value="${requestScope.Player.teamid}"><span id="teamidcheck"></span>
                </div>
                <br>
                <div><h3>number:</h3> <input type="text" name="number" id="number"
                                             class='input' value="${requestScope.Player.number}"><span id="numbercheck"></span>
                </div>
                <br>
                <div><h3>position:</h3> <input type="text" name="position" id="position"
                                               class='input' value="${requestScope.Player.position}"><span id="positioncheck"></span>
                </div>
                <br>
                <div>
                    <input type="submit" value="submit" class="btnbuy">
                    <input type="reset" value="reset"  class="btnbuy">
                </div>
            </form>
            <script type="text/javascript">

                window.onload = function () {
                    var user = "${requestScope.Player}";
                    if (user == "") {
                        window.location.assign("PlayerServlet?type=PlayerList");
                        return;
                    }
                }
            </script>
        </div>
    </div>
</div>
<jsp:include page="/Footer.jsp"></jsp:include>