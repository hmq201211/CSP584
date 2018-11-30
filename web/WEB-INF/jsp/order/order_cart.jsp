<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/Header.jsp"></jsp:include>
<script type="text/javascript">
    function validate() {
        var tags = document.getElementsByTagName("span");
        for(var i =0 ;i<tags.length;i++){
            tags[i].innerText = "";
        }
        var creditnumber = document.getElementById("creditnumber").value;
        if (creditnumber == "") {
            document.getElementById("creditnumbercheck").innerHTML = "<font color='red' size='-1'>credit card number should not be empty<font>";
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
<jsp:include page="/LeftNavigationBar.jsp"></jsp:include>
<div id='content'>
    <div class='post'><h2 class='title meta'>
        <a style='font-size: 24px;'>My Cart</a>
    </h2>
        <div class='entry'>
            <table id='bestseller'>

                <c:forEach items="${list}" var="string" varStatus="userStatus">

                    <c:if test="${userStatus.count%3==1}">
                        <tr></c:if>
                    <td>
                        <c:set value="${ fn:split(string, '-') }" var="result"></c:set>
                        <c:set var="Total" value="${Total+result[2]}"></c:set>
                        <div id='shop_item'><h3><font color="red">No.${userStatus.count} </font></h3>
                            <strong>${result[1]}</strong>
                            <ul>
                                <li id='item'><img src='images/accessory/${result[0]}.JPG' alt=''/></li>
                                <li>
                                    <form action='OrderServlet?type=Remove' method='post'>
                                        <input type='hidden' name='id' value='${result[0]}'>
                                        <input type='submit' class='btnbuy' value='Remove from cart'></form>
                                </li>
                                <li id='item'><strong>Price: ${result[2]}</strong></li>
                            </ul>
                        </div>
                    </td>

                    <c:if test="${userStatus.count % 3 == 0||userStatus.count==userStatus.end} "></tr></c:if>


                </c:forEach>
            </table>
            <table id='bestseller'>
                <tr>
                    <td>
                        Total Price: ${Total}
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action="OrderServlet?type=Place" method="post"
                              onsubmit="return validate()">
                            <div><h3>Credit Card Number:</h3> <input type="text" name="creditNumber" id="creditnumber"
                                                     class='input' ><span id="creditnumbercheck"></span>
                            </div>
                            <br>
                            <div><h3>Address:</h3> <input type="text" name="address" id="address"
                                                       class='input'><span id="addresscheck"></span>
                            </div>
                            <br>
                            <div>
                                <input type="submit" value="submit" class="btnbuy">
                                <input type="reset" value="reset"  class="btnbuy">
                            </div>
                        </form>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</div>

<jsp:include page="/Footer.jsp"></jsp:include>
