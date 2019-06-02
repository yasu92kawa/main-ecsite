<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Items</title>



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

                <div class="row justify-content-center">
                    <div class="col-lg-12 mb-5">
                        <div class="text-center">
                            <h1>Our <span class="font-weight-bold text-info">items</span></h1>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-9 px-5 items-main">

                        <div class="item-category">
                        	<a class="text-normal" href='<s:url action="ProductListAction"/>' >
                            	<h1 class="text-center mb-4">ALL</h1>
                            </a>

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
                                                <a href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="3"/></s:url>'>
                                                    <img class="card-img-top" src="images/helmet.png">
                                                    <h5 class="card-title text-dark text-center pt-2 ">helmet</h5>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="row ">
                                            <div class="col-4 slide-item">
                                                <a href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="4"/></s:url>'>
                                                    <img class="card-img-top" src="images/gloves.png">
                                                    <h5 class="card-title text-dark text-center pt-2 ">gloves</h5>
                                                </a>
                                            </div>
                                            <div class="col-4 slide-item">
                                                <a href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="5"/></s:url>'>
                                                    <img class="card-img-top" src="images/apparel.png">
                                                    <h5 class="card-title text-dark text-center pt-2 ">appalel</h5>
                                                </a>
                                            </div>
                                            <div class="col-4 slide-item">
                                                <a href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="6"/></s:url>'>
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
                        <div class="item-category" id="shaft">
                        	<a class="text-normal" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="1"/></s:url>'>
                            	<h1 class="text-center mb-4">SHAFTS</h1>
							</a>
                            <div id="carousel-card2" class="carousel slide" >
                                <ol class="carousel-indicators slide-underline">
                                    <li data-target="#carousel-card2" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-card2" data-slide-to="1"></li>
                                </ol>

                                <div class="carousel-inner slide-items">
                                    <div class="carousel-item active">
                                        <div class="row ">
	                                        <s:iterator value="sliderProductList1_1">
	                                            <div class="col-4 slide-item">
	                                                <a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
	                                                    <img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'>
	                                                    <h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/><br></h5>
	                                                </a>
	                                            </div>
                                            </s:iterator>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                    	<div class="row ">
	                                    	<s:iterator value="sliderProductList1_2">
												<div class="col-4 slide-item">
													<a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
														<img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' />
														<h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/></h5>
													</a>
												</div>
											</s:iterator>
										</div>
                                    </div>
                                </div>

                                <a class="carousel-control-prev" href="#carousel-card2" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carousel-card2" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>

                        <div class="item-category" id="head">
                        	<a class="text-normal" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="2"/></s:url>'>
                            	<h1 class="text-center mb-4">HEAD</h1>
                            </a>

                            <div id="carousel-card3" class="carousel slide" >
                                <ol class="carousel-indicators slide-underline">
                                    <li data-target="#carousel-card3" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-card3" data-slide-to="1"></li>
                                </ol>

                                <div class="carousel-inner slide-items">
                                    <div class="carousel-item active">
                                        <div class="row ">
	                                        <s:iterator value="sliderProductList2_1">
	                                            <div class="col-4 slide-item">
	                                                <a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
	                                                    <img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'>
	                                                    <h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/><br></h5>
	                                                </a>
	                                            </div>
                                            </s:iterator>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                    	<div class="row ">
	                                    	<s:iterator value="sliderProductList2_2">
												<div class="col-4 slide-item">
													<a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
														<img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' />
														<h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/></h5>
													</a>
												</div>
											</s:iterator>
										</div>
                                    </div>
                                </div>

                                <a class="carousel-control-prev" href="#carousel-card3" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carousel-card3" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="item-category" id="helmet">
                        	<a class="text-normal" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="3"/></s:url>'>
                            	<h1 class="text-center mb-4">HELMET</h1>
                            </a>

                            <div id="carousel-card4" class="carousel slide" >
                                <ol class="carousel-indicators slide-underline">
                                    <li data-target="#carousel-card" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-card4" data-slide-to="1"></li>
                                </ol>

                                <div class="carousel-inner slide-items">
                                    <div class="carousel-item active">
                                        <div class="row ">
	                                        <s:iterator value="sliderProductList3_1">
	                                            <div class="col-4 slide-item">
	                                                <a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
	                                                    <img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'>
	                                                    <h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/><br></h5>
	                                                </a>
	                                            </div>
                                            </s:iterator>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                    	<div class="row ">
	                                    	<s:iterator value="sliderProductList3_2">
												<div class="col-4 slide-item">
													<a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
														<img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' />
														<h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/></h5>
													</a>
												</div>
											</s:iterator>
										</div>
                                    </div>
                                </div>

                                <a class="carousel-control-prev" href="#carousel-card4" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carousel-card4" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="item-category" id="gloves">
                        	<a class="text-normal" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="4"/></s:url>'>
                            	<h1 class="text-center mb-4">GLOVES</h1>
                            </a>

                            <div id="carousel-card5" class="carousel slide" >
                                <ol class="carousel-indicators slide-underline">
                                    <li data-target="#carousel-card5" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-card5" data-slide-to="1"></li>
                                </ol>

                                <div class="carousel-inner slide-items">
                                    <div class="carousel-item active">
                                        <div class="row ">
	                                        <s:iterator value="sliderProductList4_1">
	                                            <div class="col-4 slide-item">
	                                                <a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
	                                                    <img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'>
	                                                    <h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/><br></h5>
	                                                </a>
	                                            </div>
                                            </s:iterator>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                    	<div class="row ">
	                                    	<s:iterator value="sliderProductList4_2">
												<div class="col-4 slide-item">
													<a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
														<img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' />
														<h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/></h5>
													</a>
												</div>
											</s:iterator>
										</div>
                                    </div>
                                </div>

                                <a class="carousel-control-prev" href="#carousel-card5" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carousel-card5" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="item-category" id="apparel">
                        	<a class="text-normal" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="5"/></s:url>'>
                            	<h1 class="text-center mb-4">APPAREL</h1>
                            </a>

                            <div id="carousel-card6" class="carousel slide" >
                                <ol class="carousel-indicators slide-underline">
                                    <li data-target="#carousel-card6" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-card6" data-slide-to="1"></li>
                                </ol>

                                <div class="carousel-inner slide-items">
                                    <div class="carousel-item active">
                                        <div class="row ">
	                                        <s:iterator value="sliderProductList5_1">
	                                            <div class="col-4 slide-item">
	                                                <a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
	                                                    <img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'>
	                                                    <h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/><br></h5>
	                                                </a>
	                                            </div>
                                            </s:iterator>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                    	<div class="row ">
	                                    	<s:iterator value="sliderProductList5_2">
												<div class="col-4 slide-item">
													<a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
														<img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' />
														<h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/></h5>
													</a>
												</div>
											</s:iterator>
										</div>
                                    </div>
                                </div>

                                <a class="carousel-control-prev" href="#carousel-card6" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carousel-card6" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="item-category" id="shoes">
                        	<a class="text-normal" href='<s:url action="ProductCategoryAction" ><s:param name="categoryId" value="6"/></s:url>'>
                            	<h1 class="text-center mb-4">SHOES</h1>
                            </a>

                            <div id="carousel-card7" class="carousel slide" >
                                <ol class="carousel-indicators slide-underline">
                                    <li data-target="#carousel-card7" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-card7" data-slide-to="1"></li>
                                </ol>

                                <div class="carousel-inner slide-items">
                                    <div class="carousel-item active">
                                        <div class="row ">
	                                        <s:iterator value="sliderProductList6_1">
	                                            <div class="col-4 slide-item">
	                                                <a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
	                                                    <img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'>
	                                                    <h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/><br></h5>
	                                                </a>
	                                            </div>
                                            </s:iterator>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                    	<div class="row ">
	                                    	<s:iterator value="sliderProductList6_2">
												<div class="col-4 slide-item">
													<a href='<s:url action="ProductDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
														<img class="card-img-top" src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' />
														<h5 class="card-title text-dark text-center pt-2 "><s:property value="productName"/></h5>
													</a>
												</div>
											</s:iterator>
										</div>
                                    </div>
                                </div>

                                <a class="carousel-control-prev" href="#carousel-card7" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carousel-card7" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>


                    </div>

                    <div class="col-md-3 sidebar-right category" role="complementary">
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





        </script>
    </body>
</html>