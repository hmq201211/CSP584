<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/Header.jsp"></jsp:include>

<script type="text/javascript">
    function addOne() {
        var tag = document.getElementById("addone");
        tag.style.display = "";
    }

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
        var price = document.getElementById("price").value;
        if (price == "") {
            document.getElementById("pricecheck").innerHTML = "<font color='red' size='-1'>price should not be empty<font>";
            return false;
        }
        var maker = document.getElementById("maker").value;
        if (maker == "") {
            document.getElementById("makercheck").innerHTML = "<font color='red' size='-1'>maker should not be empty<font>";
            return false;
        }
        var discount = document.getElementById("discount").value;
        if (discount == "") {
            document.getElementById("addresscheck").innerHTML = "<font color='red' size='-1'>discount should not be empty<font>";
            return false;
        }
        return true;
    }
</script>
<div id='menu' style='float: right;'>
    <ul>
        <li><a href='ViewOrder'><span class='glyphicon'>View Order</span></a></li>
        <li><a href='#'><span class='glyphicon'>Welcome: ${sessionScope.get("User").username}</span></a></li>
        <li><a href='Cart'><span class='glyphicon'>Cart(0)</span></a></li>
    </ul>
</div>

</div><div id='page'>
<jsp:include page="/LeftNavigationBar.jsp"></jsp:include>
<div id='content'>
    <div class='post'><h2 class='title meta'>
        <a style='font-size: 24px;'>Accessories</a>
    </h2>
        <div class='entry'>
            <table id='bestseller'>

                <c:forEach items="${list}" var="accessory" varStatus="userStatus">
                    <c:if test="${userStatus.count%3==1}">
                        <tr></c:if>
                    <td>
                        <div id='shop_item'><h3> ${accessory.name} </h3>
                            <strong>${accessory.price}</strong>
                            <ul>
                                <li id='item'><img src='images/accessories/${accessory.id}.JPG' alt=''/></li>
                                <li>
                                    <form method='post' action='Follow'>
                                        <input type='hidden' name='id' value='${accessory.id}'>
                                        <input type='submit' class='btnbuy' value='Follow Now'></form>
                                </li>
                                <li>
                                    <form method='post' action='ReviewServlet?type=Write'>
                                        <input type='hidden' name='id' value='${accessory.id}'>
                                        <input type='submit' value='WriteReview' class='btnreview'></form>
                                </li>
                                <li>
                                    <form method='post' action='ReviewServlet?type=View'>
                                        <input type='hidden' name='id' value='${accessory.id}'>
                                        <input type='submit' value='ViewReview' class='btnreview'></form>
                                </li>
                                <li align="middle">
                                    <form method='post' action='AccessoryServlet?type=AccessoryUpdate'>
                                        <input type='hidden' name='id' value='${accessory.id}'>
                                        <input type='submit' value='Modify' class='Member'></form>
                                </li>
                                <li align="middle">
                                    <form method='post' action='AccessoryServlet?type=AccessoryDelete'>
                                        <input type='hidden' name='id' value='${accessory.id}'>
                                        <input type='submit' value='Delete' class='Member'></form>
                                </li>
                            </ul>
                        </div>
                    </td>

                    <c:if test="${userStatus.count % 3 == 0||userStatus.count==userStatus.end} "></tr></c:if>


                </c:forEach>
            </table>
            <br>
            <div id="addone" style="display: none">
                <form action="AccessoryServlet?type=AccessoryAddOne" method="post" onsubmit="return validate()">
                    <div><h3>id:</h3> <input type="text" name="id" id="id"
                                             class='input'><span id="idcheck"></span>
                    </div>
                    <br>
                    <div><h3>name:</h3> <input type="text" name="name" id="name"
                                               class='input'><span id="namecheck"></span>
                    </div>
                    <br>
                    <div><h3>price:</h3> <input type="text" name="price" id="price"
                                                 class='input'><span id="pricecheck"></span>
                    </div>
                    <br>
                    <div><h3>maker:</h3> <input type="text" name="maker" id="maker"
                                                 class='input'><span id="makercheck"></span>
                    </div>
                    <br>
                    <div><h3>discount:</h3> <input type="text" name="discount" id="discount"
                                                   class='input'><span id="discountcheck"></span>
                    </div>
                    <br>
                    <div>
                        <input type="submit" value="submit" class='btnbuy'>
                        <input type="reset" value="reset" class='btnbuy'>
                    </div>
                </form>
            </div>

            <br>
            <button onclick="addOne()" class='btnbuy' id="Member">Add One Accessory</button>
            <script type="text/javascript">

                window.onload = function () {
                    var usertype = "${sessionScope.User.usertype}";
                    if (usertype != "Member") {
                        var tags = document.getElementsByClassName("Member");
                        for (var i = 0; i < tags.length; i++) {
                            tags[i].type = "hidden";
                        }
                        $("#Member").hide();
                    }

                }
            </script>
        </div>
    </div>
</div>

<jsp:include page="/Footer.jsp"></jsp:include>
