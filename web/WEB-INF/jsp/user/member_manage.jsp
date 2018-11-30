<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="/Header.jsp"></jsp:include>
</div><div id='page'>
<jsp:include page="/LeftNavigationBar.jsp"></jsp:include>
<div id='content'>
    <div class='post'><h2 class='title meta'>
        <a style='font-size: 24px;'>Manage Web Content</a>
    </h2>
        <div class='entry'>
            <table id='bestseller'>
                <tr>
                    <td>
                        <form action='WebContentManageServlet?type=Player' method='post'>
                            <input type='submit' class='btnbuy' value='Manage Player'></form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action='WebContentManageServlet?type=Team' method='post'>
                            <input type='submit' class='btnbuy' value='Manage Team'></form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action='WebContentManageServlet?type=Game' method='post'>
                            <input type='submit' class='btnbuy' value='Manage Game'></form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action='WebContentManageServlet?type=Accessory' method='post'>
                            <input type='submit' class='btnbuy' value='Manage Accessory'></form>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<jsp:include page="/Footer.jsp"></jsp:include>
