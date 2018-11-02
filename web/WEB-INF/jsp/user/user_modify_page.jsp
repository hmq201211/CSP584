<%--
  Created by IntelliJ IDEA.
  User: HMQhm
  Date: 2018/11/1
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
</head>
<body>
<form action="UserServlet?type=UserModify&oldName=${requestScope.User.username}" method="post" onsubmit="return validate()">
    <div> username: <input type="text" name="username" id="username" value="${requestScope.User.username}"><span
            id="usernamecheck"></span></div>
    <br>
    <div> password: <input type="text" name="password" id="password" value="${requestScope.User.password}"><span
            id="passwordcheck"></span></div>
    <br>
    <div><select name="usertype">
        <option value="User">User</option>
        <option value="Member">Member</option>
        <option value="Manager">Manager</option>
    </select></div>
    <br>
    <div>
        <input type="submit" value="submit">
        <input type="reset" value="reset">
    </div>
</form>
<script type="text/javascript">

    window.onload = function () {
        var usertype = "${requestScope.User.usertype}";
        if (usertype== ""){
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
</body>
</html>
