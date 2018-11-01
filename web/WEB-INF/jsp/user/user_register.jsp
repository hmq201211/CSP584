<%--
  Created by IntelliJ IDEA.
  User: HMQhm
  Date: 2018/11/1
  Time: 13:26
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
<form action="UserServlet?type=UserAdd" method="post" onsubmit="return validate()">
    <div> username: <input type="text" name="username" id="username"><span id="usernamecheck"></span></div>
    <br>
    <div> password: <input type="text" name="password" id="password"><span id="passwordcheck"></span></div>
    <br>
    <div><select name="usertype">
        <option value="user">User</option>
        <option value="Manager">Manager</option>
    </select></div>
    <br>
    <div>
        <input type="submit" value="submit">
        <input type="reset" value="reset">
    </div>


</form>
</body>
</html>
