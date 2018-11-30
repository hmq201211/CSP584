
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
            <table style='width:100%' border="2">
                <tr>
                    <td>
                        <h3>Number</h3>
                    </td>
                    <td>
                        <h3>Username</h3>
                    </td>
                    <td>
                         <h3>Password</h3>
                    </td>
                    <td>
                        <h3>Usertype</h3>
                    </td>
                    <td>
                        <h3>Options</h3>
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
                    <div> <h3>username:</h3> <input type="text" name="username" id="username" class='input'><span id="usernamecheck"></span>
                    </div>
                    <br>
                    <div><h3>password:</h3> <input type="text" name="password" id="password" class='input'><span id="passwordcheck"></span>
                    </div>
                    <br>
                    <div><select name="usertype" class='input'>
                        <option value="User">User</option>
                        <option value="Member">Member</option>
                        <option value="Manager">Manager</option>
                    </select></div>
                    <br>
                    <div>
                        <input type="submit" value="submit" class='btnbuy'>
                        <input type="reset" value="reset" class='btnbuy'>
                    </div>
                </form>
            </div>

            <br>
            <button onclick="addOne()" class='btnbuy'>Add One User</button>

        </div>
    </div>
</div>
<jsp:include page="/Footer.jsp"></jsp:include>
