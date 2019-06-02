<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
</head>
<body>
	<!-- START SNS -->
        <div class="section" id="sns">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="text-center pb-4">
                            <h1>CONNECT <span class="font-weight-bold text-info">US</span></h1>
                        </div>
                    </div>
                    <div class="text-center mx-auto">
                        <ul class="list-unstyled list-inline mb-5">
                            <li class="list-inline-item pr-5"><a href="#"><i class="footer-icon fab fa-facebook text-muted fa-4x"></i></a></li>
                            <li class="list-inline-item pr-5"><a href="#"><i class="footer-icon fab fa-instagram text-muted fa-4x"></i></a></li>
                            <li class="list-inline-item pr-5"><a href="#"><i class="footer-icon fab fa-twitter text-muted fa-4x"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="footer-icon fab fa-google-plus-g text-muted fa-4x"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
	<!-- END SNS -->



        <!--START FOOTER-->
        <footer class="footer bg-light">
            <div class="container">
                <div class="row justify-content-center text-center">
                    <div class="col-md-4 mt-5">

                    <!--ログインの場合：「Logout」  -->
                    	<s:if test="#session.loginFlag==1">
                    		<h5 class="font-weight-bold">ログアウトはこちら</h5>
                        	<hr class="light">
                        	<a href='<s:url action="LogoutAction"/>' class="btn btn-footer mt-1">Logout</a>
                        </s:if>
                    <!--未ログインの場合：「login」  -->
                        <s:else>
                        	<h5 class="font-weight-bold">ログインはこちら</h5>
                        	<hr class="light">
                        	<a href='<s:url action="GoLoginAction"/>' class="btn btn-footer mt-1">Login</a>
                        </s:else>
                        <!--ログイン時：「新規登録表示なし」表示  -->
                        <s:if test="#session.loginFlag != 1">
                        	<h5 class="font-weight-bold mt-5">新規登録はこちら</h5>
                        	<a href='<s:url action="CreateUserAction"/>' class="btn btn-footer mt-1">SIGN UP</a>
                        </s:if>
                        <hr class="light">

                    </div>
                    <div class="col-md-4 footer-category">
                        <hr class="light">
                        <h5>Category</h5>
                        <hr class="light">
                        <a href='<s:url action="ProductListAction"/>'>All</a>
                        <a href='<s:url action="ProductCategoryAction"><s:param name="categoryId" value="1"/></s:url>'>Shaft</a>
                        <a href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="2"/></s:url>'>Head</a>
                        <a href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="3"/></s:url>'>Helmet</a>
                        <a href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="4"/></s:url>'>Gloves</a>
                        <a href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="5"/></s:url>'>Apparel</a>
                        <a href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="6"/></s:url>'>Shoes</a>
                    </div>
                    <div class="col-md-4 footer-shop">
                        <hr class="light">
                        <h5>Shop Info</h5>
                        <hr class="light">
                        <div class="ggmap mb-2"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1630.4368807897565!2d139.66194656333423!3d35.50175509710358!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x60185e70b5498369%3A0x8c5300a41995c9ec!2z44CSMjMwLTAwNzcg56We5aWI5bed55yM5qiq5rWc5biC6ba06KaL5Yy65p2x5a-65bC-77yV5LiB55uu77yZ4oiS77yR77yX!5e0!3m2!1sja!2sjp!4v1559365296286!5m2!1sja!2sjp" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe></div>
                        <p>〒230-0077</p>
                        <p>神奈川県横浜市鶴見区東寺尾5-9-17-232</p>
                        <p class="mb-5">Tel : 080-0808-0808</p>
                        <p>営業時間：</p>
                        <p>月・木／土日祝日 10:00～19:00</p>
                        <p class="mb-5">水・金 13:00～22:00</p>
                        <p>定休日：毎週火曜日</p>
                    </div>
                    <div class="col-md-12">
                        <div class="text-center text-white footer-alt mt-5">
                            <p class="text-muted mb-0">&copy; Copyright | Yasuhiro All Right Reserved</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!--END FOOTER-->



</body>
</html>