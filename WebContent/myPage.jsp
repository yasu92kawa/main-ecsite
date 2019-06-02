<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>



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
        <section class="section" id="mypage">
            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-lg-12 mb-5">
                        <div class="text-center">
                            <h1>MY <span class="font-weight-bold text-info">PAGE</span></h1>
                        </div>
                    </div>
                </div>

                <div class="tabs">

                    <input id="purchase" type="radio" name="tab" checked>
                    <label class="tab" for="purchase">購入履歴</label>
                    <input id="register_address" type="radio" name="tab">
                    <label class="tab" for="register_address">登録住所</label>
                    <input id="personal_info" type="radio" name="tab">
                    <label class="tab" for="personal_info">個人情報</label>

                    <div class="tab_content" id="purchase_content">
                        <div class="tab_content_description">
                        	<s:iterator value="purchaseHistoryInfoDTOList">
	                            <div class="row purchase_item py-3">
		                            <s:if test="purchaseHistoryInfoDTOList != null && purchaseHistoryInfoDTOList.size() > 0">
		                                <div class="col-sm-5 ">
		                                    <div class="cart-photo">
		                                        <img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' alt="">
		                                    </div>
		                                </div>
		                                <div class="col-sm-7">
		                                    <h3><s:property  value="productName"/></h3>
		                                    <div class="row">
		                                        <div class="col-sm-12">
		                                            <div class="cart-detail mt-3">
		                                                <p>個数：　<span class="cart-stock"><s:property  value="productCount"/></span></p>
		                                                <p>色：　<span class="cart-color"><s:property  value="productColor"/></span></p>
		                                                <p>価格： <span class="cart-each-total">¥<s:property  value="price"/></span></p>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
	                                </s:if>
	                                <s:else>
	                    				<h4 class="text-center">購入履歴は存在しません</h4>
	                    			</s:else>
	                            </div>
                            </s:iterator>
                        </div>
                    </div>

                    <div class="tab_content" id="register_address_content">
                    	<s:if test="destinationInfoDTOList.size() == 0">
               				<h4 class="text-center">登録住所は存在しません</h4>
               			</s:if>
                    	<s:iterator value="destinationInfoDTOList">
	                        <div class="resist-address">
		                            <div class="address-info  pl-0">
		                                <ul class=" pl-0">
		                                    <li class="font-weight-bold pb-2"><s:property value="familyName"/><s:property value="firstName"/></li>
		                                    <li>〒<s:property  value="postalCode"/></li>
		                                    <li ><s:property  value="prefectures"/></li>
		                                    <li ><s:property value="firstAddress"/></li>
		                                    <li ><s:property value="secondAddress"/></li>
		                                    <li class="pt-2">TEL:<s:property value="tel"/></li>
		                                </ul>
		                            </div>
		                            <div class="delete-address">
		                                <a href='<s:url action="DeleteDestinationAction"><s:param name="destinationId" value="id"/></s:url>' class="delete-btn">削除</a>
		                            </div>
	                        </div>
                        </s:iterator>
                        <div class="text-center py-3">
		                	 <a href='<s:url action="CreateDestinationAction"/>' class="text-center mt-2 mb-5">
			                    <input type="submit" class="btn btn-outline-dark btn-round btn1 " value="新しい住所を登録">
			                </a>
		                </div>

                    </div>

                    <div class="tab_content" id="personal_info_content">
	                        <div class="tab_content_description">
	                            <div class="pernonal_info">
	                                <div class="form-control text-center confirm-info p-0">
	                                        <p>姓（全角）</p>
	                                        <div class="confirm-user-info">
	                                        	<s:property value="userInfoDTO.familyName" />
	                                        </div>
	                                        <p>名（全角）</p>
	                                        <div class="confirm-user-info">
	                                        	<s:property value="userInfoDTO.firstName" />
	                                        </div>
	                                        <p>姓（かな）</p>
	                                        <div class="confirm-user-info">
	                                        	<s:property value="userInfoDTO.familyNameKana" />
	                                        </div>
	                                        <p>名（かな）</p>
	                                        <div class="confirm-user-info">
	                                        	<s:property value="userInfoDTO.firstNameKana" />
	                                        </div>
	                                        <p>メールアドレス</p>
	                                       <div class="confirm-user-info">
	                                        	<s:property value="userInfoDTO.email" />
	                                        </div>
	                                        <p>ユーザーID</p>
	                                        <div class="confirm-user-info">
	                                        	<s:property value="userInfoDTO.userId" />
	                                        </div>
	                                        <p>パスワード</p>
	                                        <div class="confirm-user-info">
	                                        	<s:property value="concealedPassword" />
	                                        </div>
	                                </div>
	                                <div class="text-center pt-5">
					                	 <a href='<s:url action="ChangeUserInfoAction"/>' class="text-center">
						                    <input type="submit" class="btn btn-outline-dark btn-round btn1 " value="ユーザー情報を更新する">
						                </a>
					                </div>
					                <div class="text-center pt-5">
					                	 <a href='<s:url action="ResetPasswordAction"/>' class="text-center">
						                    <input type="submit" class="btn btn-outline-dark btn-round btn1 " value="パスワードを更新する">
						                </a>
					                </div>
	                            </div>
	                        </div>

                    </div>

                </div>

            </div>
        </section>
        <!-- END-->



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



