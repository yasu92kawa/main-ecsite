<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cart</title>



        <!-- Style Css -->
        <link href="css/style.css" rel="stylesheet">

        <!--icon -->
        <link rel="shortcut icon" href="images/favicon.ico">

        <link href="css/materialdesignicons.min.css" rel="stylesheet">

        <link href="css/mobiriseicons.css" rel="stylesheet">

        <link href="css/magnific-popup.css" rel="stylesheet" >

        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>

        <!-- Font Css -->
        <link href="https://fonts.googleapis.com/css?family=M+PLUS+1p" rel="stylesheet">

        <!-- YOUTUBE -->
        <link href="css/ytplayer.css" rel="stylesheet" >

        <!--Bootstrap -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/flexible-bootstrap-carousel.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">

        <!-- OWL SLIDER -->
        <link rel="stylesheet" href="css/owl.carousel.css" />
        <link rel="stylesheet" href="css/owl.theme.css" />
        <link rel="stylesheet" href="css/owl.transitions.css" />


    </head>
    <body>
    	<jsp:include page="subHeader.jsp" />

        <!-- START Main -->
        <section class="section" id="cart">
            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-lg-12 mb-5">
                        <div class="text-center">
                            <h1>YOUR <span class="font-weight-bold text-info">CART</span></h1>
                        </div>
                    </div>
                </div>

                <div class="row">
                	<s:if test="cartInfoDTOList != null && cartInfoDTOList.size() > 0">
	                    <div class="col-md-9 col-sm-8">
	                        <div class="cart-items">
	                            <hr>
	                            <div class="cart-item">
		                            <s:iterator value="cartInfoDTOList">
		                                <div class="row py-4">
			                                    <div class="col-md-5">
			                                        <div class="cart-photo">
			                                            <img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' alt="">
			                                        </div>
			                                    </div>
			                                    <div class="col-md-7">
			                                        <h3><s:property value="productName"/></h3>
			                                        <div class="row">
			                                            <div class="col-sm-6">
			                                                <div class="cart-detail">
			                                                    <p>個数：　<span class="cart-stock"><s:property value="productCount"/></span></p>
			                                                    <p>色：　<span class="cart-color"><s:property value="productColor"/></span></p>
			                                                    <a href='<s:url action="DeleteCartAction"><s:param name="productId" value="%{productId}"/></s:url>'>削除</a>
			                                                </div>
			                                            </div>
			                                            <div class="col-sm-6">
			                                                <div class="cart-price">
			                                                    <p>価格：</p>
			                                                    <p class="cart-each-total">￥<s:property value="price"/></p>
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </div>
		                                </div>
		                                <hr>
	                              </s:iterator>
	                            </div>
	                        </div>
	                    </div>

	                    <div class="col-md-3 col-sm-4">
	                        <div class="cart-total">
	                                <h5>小計（<s:property value="totalCount"/>点)</h5>
	                                <p class="mt-3">¥<s:property value="totalPrice"/></p>
	                                <a href='<s:url action="PaymentAction"/>' class="regi-btn">CHEAK OUT</a>
	                        </div>
	                    </div>
                   </s:if>
                    <s:else>
                    	<h2 class="text-center font-weight-bold" style=" margin: 0 auto; padding:5vh;">カート情報は存在しません</h2>
                    </s:else>
                    <div class="item-category">
                        <div id="carousel-card1" class="carousel slide">
                            <ol class="carousel-indicators slide-underline">
                                <li data-target="#carousel-card1" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-card1" data-slide-to="1"></li>
                            </ol>

                            <div class="carousel-inner slide-items" >
                                <div class="carousel-item active">
                                    <div class="row ">
                                        <div class="col-4 slide-item">
                                            <a href='<s:url action="ProductCategoryAction"><s:param name="categoryId" value="1"/></s:url>'>
                                                <img class="card-img-top" src="images/shaft.png">
                                                <h5 class="card-title text-dark text-center pt-2 ">shaft</h5>
                                            </a>
                                        </div>
                                        <div class="col-4 slide-item">
                                            <a href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="2"/></s:url>'>
                                                <img class="card-img-top" src="images/head.png">
                                                <h5 class="card-title text-dark text-center pt-2 ">head</h5>
                                            </a>
                                        </div>

                                        <div class="col-4 slide-item">
                                            <a href='<s:url action="ProductCategoryAction"><s:param name="categoryId" value="3"/></s:url>'>
                                                <img class="card-img-top" src="images/helmet.png">
                                                <h5 class="card-title text-dark text-center pt-2 ">helmet</h5>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row ">
                                        <div class="col-4 slide-item">
                                            <a href='<s:url action="ProductCategoryAction"><s:param name="categoryId" value="4"/></s:url>'>
                                                <img class="card-img-top" src="images/gloves.png">
                                                <h5 class="card-title text-dark text-center pt-2 ">gloves</h5>
                                            </a>
                                        </div>
                                        <div class="col-4 slide-item">
                                            <a href='<s:url action="ProductCategoryAction"><s:param name="categoryId" value="5"/></s:url>'>
                                                <img class="card-img-top" src="images/apparel.png">
                                                <h5 class="card-title text-dark text-center pt-2 ">appalel</h5>
                                            </a>
                                        </div>
                                        <div class="col-4 slide-item">
                                            <a href='<s:url action="ProductCategoryAction"><s:param name="categoryId" value="6"/></s:url>'>
                                                <img class="card-img-top" src="images/shoes.png">
                                                <h5 class="card-title text-dark text-center pt-2 ">shoes</h5>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carousel-card1" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carousel-card1" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END Items -->
        <jsp:include page="footer.jsp" />


        <!-- JAVASCRIPTS -->
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>

        <script src="js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="js/flexible-bootstrap-carousel.min.js"></script>

        <!-- OWL CAROUSEL -->
        <script src="js/owl.carousel.min.js"></script>
        <!--CUSTOM JS-->
        <script src="js/custom.js"></script>

        <script src="https://code.jquery.com/jquery-3.1.0.slim.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>







        <script>

            $(".hover").mouseleave(function () {
                $(this).removeClass("hover");
            });

            (function(window, $) {
                'use strict';
                $(function() {
                // 固定サイドバーのスクロール追従開始＆終了位置の設定(affix用)
                setTimeout(function() {
                    $('.algo13-sidebar').affix({
                    offset: {

                        bottom: function() {
                        return (this.bottom = $('footer').outerHeight(true));
                        }
                    }
                    })
                }, 100);
                });
            })(window, jQuery);


            $(function(){
                $("img.change-photo").hover(function(){
                    var ImgSrc = $(this).attr("src");
                    var ImgAlt = $(this).attr("alt");
                    $("img#main-photo").attr({src:ImgSrc,alt:ImgAlt});
                    $("img#main-photo").fadeIn("slow");
                    return false;
                });
            });

            jQuery(function($){
                $('.thumb').hover(function(){
                    $('.thumb.active').removeClass('active');
                    $(this).addClass('active');
                });
            });






        </script>
    </body>
</html>



