
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
</div><div id='page'>
<div class='post' style='float: none; width: 100%'>
    <div class='entry'>
        <div style='width:400px; margin:25px; margin-left: auto;margin-right: auto;'>
            <form action="AccessoryServlet?type=AccessoryModify&oldId=${requestScope.Accessory.id}" method="post"
                  onsubmit="return validate()">
                <div><h3>id:</h3> <input type="text" name="id" id="id"
                                         class='input' value="${requestScope.Accessory.id}"><span id="idcheck"></span>
                </div>
                <br>
                <div><h3>name:</h3> <input type="text" name="name" id="name"
                                           class='input' value="${requestScope.Accessory.name}"><span id="namecheck"></span>
                </div>
                <br>
                <div><h3>price:</h3> <input type="text" name="price" id="price"
                                             class='input' value="${requestScope.Accessory.price}"><span id="pricecheck"></span>
                </div>
                <br>
                <div><h3>maker:</h3> <input type="text" name="maker" id="maker"
                                              class='input' value="${requestScope.Accessory.maker}"><span id="makercheck"></span>
                </div>
                <br>
                <div><h3>discount:</h3> <input type="text" name="discount" id="discount"
                                              class='input' value="${requestScope.Accessory.discount}"><span id="discountcheck"></span>
                </div>
                <br>
                <div>
                    <input type="submit" value="submit" class="btnbuy">
                    <input type="reset" value="reset"  class="btnbuy">
                </div>
            </form>
            <script type="text/javascript">

                window.onload = function () {
                    var user = "${requestScope.Accessory}";
                    if (user == "") {
                        window.location.assign("AccessoryServlet?type=AccessoryList");
                        return;
                    }
                }
            </script>
        </div>
    </div>
</div>
<jsp:include page="/Footer.jsp"></jsp:include>