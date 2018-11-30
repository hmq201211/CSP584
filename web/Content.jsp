<!-- center portion content for home index page-->
<div id="content">
    <div class="post">
        <h2 class="title">
            <a href="#">Soccer World is opening for you</a>
        </h2>
        <div class="entry">
            <img src="images/site/table.jpg"
                 style="width: 600px; display: block; margin-left: auto; margin-right: auto"/>
            <br> <br>
            <h2>Follow everything you are interested in Soccer Fan</h2>
            <br> <br>
            <h2>We can make your life more wonderful and magical</h2>
        </div>
    </div>
    <div class="post">
        <h2 class="title meta">
            <a style="font-size: 24px;">Recommend to Special You</a>
        </h2>
        <div class="entry">

            <table id="bestseller">
                <tr>
                    <td>
                        <div id="shop_item">
                            <h3>England</h3>
                            <strong>Manchester</strong>
                            <ul>
                                <li id="item"><img src="images/team/Manchester.JPG" alt="Manchester"/></li>
                                <li>
                                    <form action='FollowServlet?type=Follow' method='post'>
                                        <input type='submit' class="btnbuy" value='Follow'>
                                        <input type="hidden" name="id" value="Manchester">
                                        <input type="hidden" name="itemtype" value="team">
                                    </form>
                                </li>

                                <li>
                                    <form action='ReviewServlet?type=Write' method='post'>
                                        <input type='submit' class="btnreview" value='WriteReview'>
                                        <input type="hidden" name="id" value="Manchester">
                                        <input type="hidden" name="itemtype" value="team">
                                    </form>
                                </li>
                                <li>
                                    <form action='ReviewServlet?type=View' method='post'>
                                        <input type='submit' class="btnreview" value='ViewReview'>
                                        <input type="hidden" name="id" value="Manchester">
                                        <input type="hidden" name="itemtype" value="team">
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </td>
                    <td>
                        <div id="shop_item">
                            <h3>England</h3>
                            <strong>Liverpool</strong>
                            <ul>
                                <li id="item"><img src="images/team/Liverpool.JPG" alt="liverpool"/>
                                </li>
                                <li>
                                    <form action='FollowServlet?type=Follow' method='post'>
                                        <input type='submit' class="btnbuy" value='Follow'>
                                        <input type="hidden" name="id" value="Liverpool">
                                        <input type="hidden" name="itemtype" value="team">
                                    </form>
                                </li>

                                <li>
                                    <form action='ReviewServlet?type=Write' method='post'>
                                        <input type='submit' class="btnreview" value='WriteReview'>
                                        <input type="hidden" name="id" value="Liverpool">
                                        <input type="hidden" name="itemtype" value="team">
                                    </form>
                                </li>
                                <li>
                                    <form action='ReviewServlet?type=View' method='post'>
                                        <input type='submit' class="btnreview" value='ViewReview'>
                                        <input type="hidden" name="id" value="Liverpool">
                                        <input type="hidden" name="itemtype" value="team">
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<!-- end #content -->