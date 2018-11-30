<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/Header.jsp"></jsp:include>
<script type="text/javascript">
    function validate() {
        var tags = document.getElementsByTagName("span");
        for (var i = 0; i < tags.length; i++) {
            tags[i].innerText = "";
        }
        var star = document.getElementById("star").value;
        if (star == "") {
            document.getElementById("starcheck").innerHTML = "<font color='red' size='-1'>star should not be empty<font>";
            return false;
        }
        var reviewcontent = document.getElementById("reviewcontent").value;
        if (reviewcontent == "") {
            document.getElementById("contentcheck").innerHTML = "<font color='red' size='-1'>content should not be empty<font>";
            return false;
        }
        return true;
    }
</script>
</div><div id='page'>
<div class='post' style='float: none; width: 100%'>
    <div class='entry'>
        <div style='width:400px; margin:25px; margin-left: auto;margin-right: auto;'>
            <form action="ReviewServlet?type=Submit" method="post"
                  onsubmit="return validate()">
                <div><h3>id:</h3> <input type="text" name="id" id="id"
                                         class='input' value="${requestScope.id}" readonly="readonly"><span
                        id="idcheck"></span>
                </div>
                <br>
                <div><h3>type:</h3> <input type="text" name="itemtype" id="itemtype"
                                           class='input' value="${requestScope.itemtype}" readonly="readonly"><span
                        id="typecheck"></span>
                </div>
                <br>
                <div><h3>star:</h3> <input type="text" name="star" id="star"
                                           class='input'><span id="starcheck"></span>
                </div>
                <br>
                <div><h3>content:</h3><input type="text"   name="content" id="reviewcontent"
                                                  class='input'><span id="contentcheck"></span>
                </div>
                <div>
                    <input type="submit" value="submit" class="btnbuy">
                    <input type="reset" value="reset" class="btnbuy">
                </div>
            </form>
            <script type="text/javascript">

                window.onload = function () {
                    var id = "${requestScope.id}";
                    var itemtype = "${requestScope.itemtype}"
                    if (id == "" || itemtype == "") {
                        window.location.assign("welcome_page.jsp");
                        return;
                    }
                }
            </script>
        </div>
    </div>
</div>
<jsp:include page="/Footer.jsp"></jsp:include>

