<%--
  Created by IntelliJ IDEA.
  User: HMQhm
  Date: 2018/11/1
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>List Page</title>
    <script type="text/javascript">
        function addOne() {
            var tag = document.getElementById("addone");
            tag.style.display="";
        }

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
<table border="1">
    <tr>
        <td>
            Number
        </td>
        <td>
            Username
        </td>
        <td>
            Password
        </td>
        <td>
            Usertype
        </td>
        <td>
            Options
        </td>
    </tr>
    <% int i = 1;%>
    <c:forEach items="${list}" var="user">
        <tr>
            <td>
                <%=i++%>
            </td>
            <td>
                    ${user.username}
            </td>
            <td>
                    ${user.password}
            </td>
            <td>
                    ${user.usertype}
            </td>
            <td>
                <a href="UserServlet?type=UserDelete&username=${user.username}">
                    Delete
                </a>
                ||
                <a href="UserServlet?type=UserUpdate&username=${user.username}">
                    Modify
                </a>
            </td>
        </tr>

    </c:forEach>
</table>
<br>
<div id="addone" style="display: none">
    <form action="UserServlet?type=UserAddOne" method="post" onsubmit="return validate()">
        <div> username: <input type="text" name="username" id="username"><span id="usernamecheck"></span></div>
        <br>
        <div> password: <input type="text" name="password" id="password"><span id="passwordcheck"></span></div>
        <br>
        <div><select name="usertype">
            <option value="User">User</option>
            <option value="Manager">Manager</option>
        </select></div>
        <br>
        <div>
            <input type="submit" value="submit">
            <input type="reset" value="reset">
        </div>
    </form>
</div>

<br>
<button onclick="addOne()">Add One User</button>
</body>
</html>
