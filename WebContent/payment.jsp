<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Select addresse</title>

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
        <section class="section" id="">
            <div class="container ">
                <div class="row justify-content-center">
                    <div class="col-lg-12 mb-5">
                        <div class="text-center">
                            <h1>SELLECT <span class="font-weight-bold text-info">ADRRESS</span></h1>
                        </div>
                    </div>
                </div>
                <div class="text-center py-4">
                	 <a href='<s:url action="CreateDestinationAction"/>' class="text-center mt-2 mb-5">
	                    <input type="submit" class="btn btn-outline-dark btn-round btn1 " value="新しい住所を登録">
	                </a>
                </div>

                <div class="row">
                	<s:iterator value="destinationInfoDTOList">
	                    <div class="col-sm-6 col-lg-4">
	                        <div class="each-address">
		                            <div class="address-info  pl-0">
		                                <ul class=" pl-0">
		                                    <li  class="font-weight-bold pb-2"><s:property value="familyName"/><s:property value="firstName"/></li>
		                                    <li >〒<s:property  value="postalCode"/></li>
		                                    <li ><s:property  value="prefectures"/></li>
		                                    <li ><s:property value="firstAddress"/></li>
		                                    <li ><s:property value="secondAddress"/></li>
		                                    <li class="pt-2">TEL:<s:property value="tel"/></li>
		                                </ul>

		                            </div>
		                            <div class="ship-this-address text-center mb-0">
		                            	<a href='<s:url action="PaymentConfirmAction"><s:param name="destinationId" value="%{id}"/><s:param name="userId" value="%{userId}"/></s:url>'>この住所を使う</a>
		                            </div>
		                            <div class="delete-address">
		                                <a href='<s:url action="DeleteDestinationAction"><s:param name="destinationId" value="%{id}"/></s:url>' class="delete-btn">削除</a>
		                            </div>
		                            <s:hidden name="userId" value="userId"/>
	                        </div>
	                    </div>
                    </s:iterator>
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
