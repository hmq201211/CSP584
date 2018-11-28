
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/Header.jsp"></jsp:include>
<script type="text/javascript">
    function register() {
        window.location.assign("UserServlet?type=UserRegister")
    }
</script>
<div id='menu' style='float: right;'>
    <ul>
        <li><a href='ViewOrder'><span class='glyphicon'>View Order</span></a></li>
        <li><a href='#'><span class='glyphicon'>Login</span></a></li>
        <li><a href='Cart'><span class='glyphicon'>Cart(0)</span></a></li>
    </ul>
</div>

</div><div id='page'>
<div class='post' style='float: none; width: 100%'>
    <div class='entry'>
        <div style='width:400px; margin:25px; margin-left: auto;margin-right: auto;'>
            <form action="UserServlet?type=UserCheckLogin" method="post">
                <table  style='width:100%'>
                    <tr>
                        <td>
                           <h3>username:</h3>
                        </td>
                        <td>
                            <input type="text" name="username" id="username" class='input'>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3>password:</h3>
                        </td>
                        <td>
                            <input type="password" name="password" id="password" class='input'>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3>usertype:</h3>
                        </td>
                        <td>
                            <select name="usertype" class='input'>
                                <option value="User">User</option>
                                <option value="Member">Member</option>
                                <option value="Manager">Manager</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="submit" class='btnbuy'>
                        </td>
                        <td>
                            <input type="reset" value="reset" class='btnbuy'>
                        </td>
                    </tr>
                </table>

            </form>
            <button id="register" onclick="register()" class='btnbuy'>Register Now</button>
        </div>
    </div>
</div>
<jsp:include page="/Footer.jsp"></jsp:include>
