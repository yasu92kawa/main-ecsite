<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Love Laccrosse</title>

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
        <!-- OWL SLIDER -->
        <link rel="stylesheet" href="css/owl.carousel.css" />
        <link rel="stylesheet" href="css/owl.theme.css" />
        <link rel="stylesheet" href="css/owl.transitions.css" />
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
        <jsp:include page="mainHeader.jsp" />

        <!-- START HOME -->
        <div class="section bg-dark h-400vh" id="home">
            <div class="bg-overlay"></div>
            <a id="video" class="youtube-bg" data-property="{videoURL:'https://youtu.be/FVZY-phjoc8',containment:'#home', showControls:false, autoPlay:true, loop:true, mute:true, startAt:0, opacity:1, quality:'default'}"></a>
            <div class="header-table">
                <div class="container">
                    <div class="row justify-content-center col-lg-12" style="margin-right: 0px; margin-left: 0px;">
                        <div class="text-center header-content mx-auto">
                                <h2 class="text-info first-title mb-2">Hi.</h2>
                                <h1 class="header-name text-white text-capitalize">We are <span class="element font-weight-bold" data-elements="a best Lacrose Shop."></span></h1>
                                <p class="text-white text-center mx-auto header-desc mt-2">アメリカ最新の商品をいち早くお届けします。<br></p>
                                <div class="arrow bounce mb-3">
                                     <a href='<s:url action="ProductListAction"/>' class="btn btn-outline-custom btn-round inner-link">商品一覧はこちら</a>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END HOME -->

         <!--- Start Image Slider -->

         <div class="worksslider inside section">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="4000">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-1" data-slide-to="1"></li>
                        <li data-target="#carousel-1" data-slide-to="2"></li>
                    </ol>


                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="images/slide1.png" alt="">
                            <div class="carousel-caption1">
                                <h1 class="">Let's join us!</h1>
                                <h3 class="sliderh3 mb-5">最新の情報をいち早くお届けします</h3>
                                <a href='<s:url action="CreateUserAction"/>'><button type="button" class="btn btn-primary btn-hide btn-md btn-top">新規会員はこちら</button></a>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/slide2.png" alt="">
                            <div class="carousel-caption2">
                                    <h1 class="">Freshman camp.</h1>
                                    <h3 class="sliderh3 mb-5">新入生のための1泊２日の練習合宿</h3>
                                    <a href='<s:url action="CampAction"/>'><button type="button" class="btn btn-success btn-hide btn-md btn-top">詳細はこちら</button></a>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/slide3.png" alt="">
                            <div class="carousel-caption3">
                                <h1 class="">Fell Free.</h1>
                                <h3 class="sliderh3 mb-5">お気軽にお問い合わせください。</h3>
                                <a href='<s:url action="ContactAction"/>'><button type="button" class="btn btn-default btn-hide btn-md">お問い合わせ</button></a>
                            </div>
                        </div>
                    </div>


                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
             </div>
         </div>
        <!--- End Image Slider -->


        <!-- START Items -->
        <section class="section " id="items">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <h1>Our <span class="font-weight-bold text-info">items</span></h1>
                        </div>
                    </div>
                </div>
                <div class="row mt-3 ">
                    <div class="col-lg-4 col-md-6">
                    	<a href='<s:url action="ProductCategoryAction"><s:param name="categoryId" value="1"/></s:url>'>
                        <figure class="itembox p-4 mt-4 rounded">
                            <img src="images/shaft.png" alt="sample84"/>
                            <figcaption>
                                <div class="heading">
                                    <h3>shaft</h3>
                                </div>
                                <p>パス・ショットのリリースの瞬間を感じやすいように重心の位置を最適化したデザイン</p>
                            </figcaption>
                        </figure>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6">
                    	<a href='<s:url action="ProductCategoryAction" value="2"><s:param name="categoryId"/></s:url>'>
                        <figure class="itembox p-4 mt-4 rounded">
                            <img src="images/head.png" alt="sample84"/>
                            <figcaption>
                                <div class="heading">
                                    <h3>head</h3>
                                </div>
                                <p>パス時の”抜け感”を追求した構造。もうヘッドのせいとは言わせない。</p>
                            </figcaption>
                        </figure>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6">
                    	<a href='<s:url action="ProductCategoryAction" value="3"><s:param name="categoryId"/></s:url>'>
                        <figure class="itembox p-4 mt-4 rounded">
                            <img src="images/helmet.png" alt="sample84"/>
                            <figcaption>
                                <div class="heading">
                                    <h3>helmet</h3>
                                </div>
                                <p>草食動物の頭からヒントを得て実現したデザイン。視界を最大限に確保した設計。</p>
                            </figcaption>
                        </figure>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6">
                    	<a href='<s:url action="ProductCategoryAction" value="4"><s:param name="categoryId"/></s:url>'>
	                        <figure class="itembox p-4 mt-4 rounded">
	                            <img src="images/gloves.png" alt="sample84"/>
	                            <figcaption>
	                                <div class="heading">
	                                    <h3>gloves</h3>
	                                </div>
	                                <p>グローブ着用時の”素手感”を実現した、素材開発からこだわったグローブ</p>
	                            </figcaption>
	                        </figure>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6">
                    	<a href='<s:url action="ProductCategoryAction" value="5"><s:param name="categoryId"/></s:url>'>
	                        <figure class="itembox p-4 mt-4 rounded">
	                            <img src="images/apparel.png" alt="sample84"/>
	                            <figcaption>
	                                <div class="heading">
	                                    <h3>apparel</h3>
	                                </div>
	                                <p>リーグ戦期の夏でも常にさらっとした肌感を保ちパフォーマンス低下を防止</p>
	                            </figcaption>
	                        </figure>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6">
                    	<a href='<s:url action="ProductCategoryAction" value="6"><s:param name="categoryId"/></s:url>'>
	                        <figure class="itembox p-4 mt-4 rounded">
	                            <img src="images/shoes.png" alt="sample84"/>
	                            <figcaption>
	                                <div class="heading">
	                                    <h3>shoes</h3>
	                                </div>
	                                <p>ソールメーカーとの共同開発で足への負担を最大限に削減したシューズ</p>
	                            </figcaption>
	                        </figure>
                        </a>
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
        <!--EASING JS-->
        <script src="js/jquery.easing.min.js"></script>
        <script src="js/scrollspy.min.js"></script>
        <!--PORTFOLIO FILTER JS-->
        <script src="js/isotope.js"></script>
        <!-- Magnific Popup Js -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <!-- TYPED -->
        <script src="js/typed.js"></script>
        <!--YOUTUBE BACKGROUND-->
        <script src="js/jquery.mb.YTPlayer.js"></script>
        <!--GOOGLE MAP-->
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

        <!-- OWL CAROUSEL -->
        <script src="js/owl.carousel.min.js"></script>
        <!--CUSTOM JS-->
        <script src="js/custom.js"></script>

        <script>
            $(".youtube-bg").mb_YTPlayer();

            $(".hover").mouseleave(function () {
            $(this).removeClass("hover");
            });

        </script>
    </body>
</html>

