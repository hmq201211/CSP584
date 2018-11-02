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
</head>
<script type="text/javascript">
    function register() {
        window.location.assign("UserServlet?type=UserRegister")
    }
</script>
<body>
<form action="UserServlet?type=UserCheckLogin" method="post">
    <table border="1">
        <tr>
            <td>
                username:
            </td>
            <td>
                <input type="text" name="username" id="username">
            </td>
        </tr>
        <tr>
            <td>
                password:
            </td>
            <td>
                <input type="password" name="password" id="password">
            </td>
        </tr>
        <tr>
            <td>
                usertype:
            </td>
            <td>
                <select name="usertype">
                    <option value="User">User</option>
                    <option value="Manager">Manager</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="submit">

            </td>
            <td>
                <input type="reset" value="reset">
            </td>
        </tr>
    </table>

</form>
<button id="register"  onclick="register()">Register Now</button>
</body>
</html>