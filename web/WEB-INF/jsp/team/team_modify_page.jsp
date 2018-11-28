
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
</div><div id='page'>
<div class='post' style='float: none; width: 100%'>
    <div class='entry'>
        <div style='width:400px; margin:25px; margin-left: auto;margin-right: auto;'>
            <form action="TeamServlet?type=TeamModify&oldId=${requestScope.Team.id}" method="post"
                  onsubmit="return validate()">
                <div><h3>id:</h3> <input type="text" name="id" id="id"
                                         class='input' value="${requestScope.Team.id}"><span id="idcheck"></span>
                </div>
                <br>
                <div><h3>name:</h3> <input type="text" name="name" id="name"
                                           class='input' value="${requestScope.Team.name}"><span id="namecheck"></span>
                </div>
                <br>
                <div><h3>league:</h3> <input type="text" name="league" id="league"
                                             class='input' value="${requestScope.Team.league}"><span id="leaguecheck"></span>
                </div>
                <br>
                <div><h3>country:</h3> <input type="text" name="country" id="country"
                                              class='input' value="${requestScope.Team.country}"><span id="countrycheck"></span>
                </div>
                <br>
                <div><h3>address:</h3> <input type="text" name="address" id="address"
                                              class='input' value="${requestScope.Team.address}"><span id="addresscheck"></span>
                </div>
                <br>
                <div>
                    <input type="submit" value="submit" class="btnbuy">
                    <input type="reset" value="reset"  class="btnbuy">
                </div>
            </form>
            <script type="text/javascript">

                window.onload = function () {
                    var user = "${requestScope.Team}";
                    if (user == "") {
                        window.location.assign("TeamServlet?type=TeamList");
                        return;
                    }
                }
            </script>
        </div>
    </div>
</div>
<jsp:include page="/Footer.jsp"></jsp:include>