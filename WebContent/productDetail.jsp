<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ItemDetail</title>
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
        <section class="section" id="items">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-md-12">
                    	<div class="row">
                    		<div class="col-lg-6 col-md-7">
		                        <div class="carousel-inner item-photo">
	                                <img id="main-photo" class="w-100" src='<s:property value="productInfoDTO.imageFilePath"/>/<s:property value="productInfoDTO.imageFileName"/>'>
	                                <ul class="thumb-photo">
	                                    <li class="thumb active"><img class="change-photo" src='<s:property value="productInfoDTO.imageFilePath"/>/<s:property value="productInfoDTO.imageFileName"/>'></li>
	                                    <li class="thumb"><img class="change-photo" src='./images/second-item.png'></li>
	                                    <li class="thumb"><img class="change-photo" src='./images/third-item.png'></li>
	                                </ul>
		                        </div>
		                    </div>

		                    <div class="col-lg-6 col-md-5">
		                        <div class="item-detail">
		                            <div class="carousel-inner">
		                                <div class="name-box">
		                                    <h1><s:property value="productInfoDTO.productName"/></h1>
		                                </div>
		                                <div class="price-box">
		                                    価格：<span class="price"> <s:property value="productInfoDTO.price"/>円</span>
		                                </div>
		                                <form action="AddCartAction">
			                                <div class="row">
				                                    <div class="col-sm-5 ">
				                                        <div class="item-counts">
				                                            数量：
				                                            <select name="productCount" id="AddCartAction_productCount">
				                                                <option value="1">1</option>
				                                                <option value="2">2</option>
				                                                <option value="3">3</option>
				                                                <option value="4">4</option>
				                                                <option value="5">5</option>
				                                            </select>
				                                        </div>
				                                    </div>
				                                    <div class="col-sm-7 ">
				                                        <div class="item-colors">
				                                            カラー：
				                                            <select name="productColor" id="AddCartAction_productColor">
				                                                <option value="black">black</option>
				                                                <option value="white">white</option>
				                                            </select>
				                                        </div>
				                                    </div>
				                                    <div class="col-lg-12">
				                                        <div class="cart-btns">
				                                            <button type="submit" class="cart-btn">ADD TO CART</button>
				                                        </div>
				                                    </div>
			                                </div>
		                                	<s:hidden name="productId" value="%{productInfoDTO.productId}"/>
		                                </form>
		                            </div>
		                        </div>
		                    </div>
		                    <!--関連商品3つ表示-->
                            <div class="row related-items">
                            	<s:iterator value="relatedProductList">
                                <div class="col-sm-4 slide-item mx-auto">
                                     <a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
                                         <img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'>
                                         <h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/><br></h5>
                                     </a>
                                </div>
                               </s:iterator>
                           </div>
	                    </div>
                    </div>


                    <div class="col-lg-2 col-md-12 sidebar-right category" role="complementary">
                        <div class="carousel-inner">
                        <nav class="algo13-sidebar hidden-print">
                            <h3 class="">Category</h3>
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" href='<s:url action="ProductListAction"/>'>All</a>
                                </li>
                                <li>
                                    <a class="nav-link" href='<s:url action="ProductCategoryAction"><s:param name="categoryId" value="1"/></s:url>'>Shaft</a>
                                </li>
                                <li>
                                    <a class="nav-link" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="2"/></s:url>'>Head</a>
                                </li>
                                <li>
                                    <a class="nav-link" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="3"/></s:url>'>Helmet</a>
                                </li>
                                <li>
                                    <a class="nav-link" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="4"/></s:url>'>Gloves</a>
                                </li>
                                <li>
                                    <a class="nav-link" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="5"/></s:url>'>Apparel</a>
                                </li>
                                <li>
                                    <a class="nav-link" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="6"/></s:url>'>Shoes</a>
                                </li>
                            </ul>
                        </nav>
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



