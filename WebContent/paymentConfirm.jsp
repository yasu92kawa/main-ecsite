<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Order Confirm</title>

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
        <section class="section" id="order">
            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-lg-12 mb-5">
                        <div class="text-center">
                            <h1>Order <span class="font-weight-bold text-info">Confirm</span></h1>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-9 col-sm-8">
                        <h3 class="text-center mb-3 font-weight-bold  text-info">お届け先</h3>
                        <div class="order-address">

                            <div class="address-info  pl-0">
	                            <s:iterator value="choosenDestinationInfoDTOList">
	                                <ul class=" pl-0">
	                                    <li class="font-weight-bold pb-2"><s:property  value="familyName"/><s:property  value="firstName"/></li>
	                                    <li><s:property value="postalCode"/></li>
	                                    <li><s:property value="prefectures"/></li>
	                                    <li><s:property value="firstAddress"/></li>
	                                    <li><s:property value="secondAddress"/></li>
	                                    <li><s:property value="tel"/></li>
	                                </ul>
	                            </s:iterator>
                            </div>
                        </div>
                        <h3 class="mt-5 text-center font-weight-bold text-info">注文商品</h3>

                        <div class="order-item my-3">
                        	<s:iterator value="cartInfoDTOList">
	                            <div class="row py-2">
	                                <div class="col-md-5">
	                                    <div class="cart-photo">
	                                         <img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' alt="">
	                                    </div>
	                                </div>
	                                <div class="col-md-7">
	                                    <h3><s:property value="productName"/></h3>
	                                    <div class="row">
	                                        <div class="col-sm-6 mt-4">
	                                            <div class="cart-detail">
	                                                <p>個数：　<span class="cart-stock"><s:property value="productCount"/></span></p>
	                                                <p>色：　<span class="cart-color"><s:property value="productColor"/></span></p>

	                                            </div>
	                                        </div>
	                                        <div class="col-sm-6 mt-4">
	                                            <div class="cart-price">
	                                                <p>価格：</p>
	                                                <p class="cart-each-total">¥<s:property value="price"/></p>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            	<hr>
                            </s:iterator>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-4">
                        <div class="cart-total">
                                <a href='<s:url action="PaymentCompleteAction"><s:param name="destinationId" value="destinationId"/></s:url>' class="regi-btn">BUT IT NOW</a>
                                <h5>Total</h5>
                                <p>¥<s:property value="totalPrice"/></p>
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



