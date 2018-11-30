
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/Header.jsp"></jsp:include>
<script type="text/javascript">
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
<div class='post' style='float: none; width: 100%'>
    <div class='entry'>
        <div style='width:400px; margin:25px; margin-left: auto;margin-right: auto;'>
            <form action="GameServlet?type=GameModify&oldId=${requestScope.Game.id}" method="post"
                  onsubmit="return validate()">
                <div><h3>id:</h3> <input type="text" name="id" id="id"
                                         class='input' value="${requestScope.Game.id}"><span id="idcheck"></span>
                </div>
                <br>
                <div><h3>league:</h3> <input type="text" name="league" id="league"
                                             class='input' value="${requestScope.Game.league}"><span id="leaguecheck"></span>
                </div>
                <br>
                <div><h3>time:</h3> <input type="text" name="time" id="time"
                                           class='input' value="${requestScope.Game.time}"><span id="timecheck"></span>
                </div>
                <br>
                <div><h3>home_team:</h3> <input type="text" name="home_team" id="home_team"
                                                class='input' value="${requestScope.Game.home_team}"><span id="home_teamcheck"></span>
                </div>
                <br>
                <div><h3>score:</h3> <input type="text" name="score" id="score"
                                            class='input' value="${requestScope.Game.score}"><span id="scorecheck"></span>
                </div>
                <br>
                <div><h3>guest_team:</h3> <input type="text" name="guest_team" id="guest_team"
                                                 class='input' value="${requestScope.Game.guest_team}"><span id="guest_teamcheck"></span>
                </div>
                <br>
                <div><h3>address:</h3> <input type="text" name="address" id="address"
                                              class='input' value="${requestScope.Game.address}"><span id="addresscheck"></span>
                </div>
                <br>
                <div>
                    <input type="submit" value="submit" class="btnbuy">
                    <input type="reset" value="reset"  class="btnbuy">
                </div>
            </form>
            <script type="text/javascript">

                window.onload = function () {
                    var game = "${requestScope.Game}";
                    if (game == "") {
                        window.location.assign("GameServlet?type=GameList");
                        return;
                    }
                }
            </script>
        </div>
    </div>
</div>
<jsp:include page="/Footer.jsp"></jsp:include>

