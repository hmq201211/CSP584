
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/Header.jsp"></jsp:include>
<script type="text/javascript">
    function validate() {
        var username = document.getElementById("username").value;
        if (username == "") {
            document.getElementById("usernamecheck").innerHTML = "<font color='red' size='-1'>username should not be empty<font>";
            return false;
        }
        var password = document.getElementById("password").value;
        if (password == "") {
            document.getElementById("passwordcheck").innerHTML = "<font color='red' size='-1'>password should not be empty<font>";
            return false;
        }
        return true;
    }
</script>
</div><div id='page'>
<div class='post' style='float: none; width: 100%'>
    <div class='entry'>
        <div style='width:400px; margin:25px; margin-left: auto;margin-right: auto;'>
            <form action="UserServlet?type=UserModify&oldName=${requestScope.User.username}" method="post"
                  onsubmit="return validate()">
                <div> <h3>username:</h3> <input type="text" name="username" id="username" class="input"
                                       value="${requestScope.User.username}"><span
                        id="usernamecheck"></span></div>
                <br>
                <div>  <h3>password:</h3> <input type="text" name="password" id="password" class="input"
                                       value="${requestScope.User.password}"><span
                        id="passwordcheck"></span></div>
                <br>
                <div><select name="usertype" class="input">
                    <option value="User">User</option>
                    <option value="Member">Member</option>
                    <option value="Manager">Manager</option>
                </select></div>
                <br>
                <div>
                    <input type="submit" value="submit" class="btnbuy">
                    <input type="reset" value="reset"  class="btnbuy">
                </div>
            </form>
            <script type="text/javascript">

                window.onload = function () {
                    var usertype = "${requestScope.User.usertype}";
                    if (usertype == "") {
                        window.location.assign("UserServlet?type=UserList");
                        return;
                    }
                    var tags = document.getElementsByTagName("option");
                    for (var i = 0; i < tags.length; i++) {
                        if (tags[i].value == usertype) {
                            tags[i].selected = "selected";
                        }
                    }
                }
            </script>
        </div>
    </div>
</div>
<jsp:include page="/Footer.jsp"></jsp:include>