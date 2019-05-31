<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign up</title>



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

        <!-- START Main -->
        <section class="section" id="items">
            <div class="container ">
                <div class="row justify-content-center">
                    <div class="col-lg-12 mb-5">
                        <div class="text-center">
                            <h1>CREATE <span class="font-weight-bold text-info">DESTINATION</span></h1>
                        </div>
                    </div>
                </div>

                <div class="panel">
                    <div class="form-control text-center p-0">
                        <form action="CreateDestinationConfirmAction" >
                        	<p>姓（全角）</p>
                        	<s:if test="familyNameErrorList!=null && familyNameErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold">
									<s:property value="familyNameErrorList"/><br>
								</div>
							</s:if>
                            <div class="form-group">
                                <s:textfield value="%{#session.familyName}" name="familyName" id="name" type="text" class="form-control" placeholder="例）田中" />
                            </div>
                            <p>名（全角）</p>
                            <s:if test="firstNameErrorList!=null && firstNameErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold">
									<s:property value="firstNameErrorList"/><br>
								</div>
							</s:if>
                            <div class="form-group">
                                <s:textfield name="firstName" id="name" type="text" class="form-control" placeholder="例）太郎" />
                            </div>
                            <p>郵便番号</p>
                            <s:if test="postalCodeErrorList!=null && postalCodeErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold">
									<s:property value="postalCodeErrorList"/><br>
								</div>
							</s:if>
                            <div class="form-group">
                                <s:textfield value="%{#session.postalCode}" name="postalCode" id="name" type="text" class="form-control" placeholder="ハイフンなし" />
                            </div>
                            <p>都道府県</p>
                            <div class="text-left py-3">
                            	<select name="prefectures" value="%{#session.prefectures}"required>
									<option value="">都道府県をお選びください</option>
									<optgroup label="北海道・東北">
										<option value="北海道">北海道</option>
										<option value="青森県">青森県</option>
										<option value="秋田県">秋田県</option>
										<option value="岩手県">岩手県</option>
										<option value="山形県">山形県</option>
										<option value="宮城県">宮城県</option>
										<option value="福島県">福島県</option>
									</optgroup>
									<optgroup label="甲信越・北陸">
										<option value="山梨県">山梨県</option>
										<option value="長野県">長野県</option>
										<option value="新潟県">新潟県</option>
										<option value="富山県">富山県</option>
										<option value="石川県">石川県</option>
										<option value="福井県">福井県</option>
									</optgroup>
									<optgroup label="関東">
										<option value="茨城県">茨城県</option>
										<option value="栃木県">栃木県</option>
										<option value="群馬県">群馬県</option>
										<option value="埼玉県">埼玉県</option>
										<option value="千葉県">千葉県</option>
										<option value="東京都">東京都</option>
										<option value="神奈川県">神奈川県</option>
									</optgroup>
									<optgroup label="東海">
										<option value="愛知県">愛知県</option>
										<option value="静岡県">静岡県</option>
										<option value="岐阜県">岐阜県</option>
										<option value="三重県">三重県</option>
									</optgroup>
									<optgroup label="関西">
										<option value="大阪府">大阪府</option>
										<option value="兵庫県">兵庫県</option>
										<option value="京都府">京都府</option>
										<option value="滋賀県">滋賀県</option>
										<option value="奈良県">奈良県</option>
										<option value="和歌山県">和歌山県</option>
									</optgroup>
									<optgroup label="中国">
										<option value="岡山県">岡山県</option>
										<option value="広島県">広島県</option>
										<option value="鳥取県">鳥取県</option>
										<option value="島根県">島根県</option>
										<option value="山口県">山口県</option>
									</optgroup>
									<optgroup label="四国">
										<option value="徳島県">徳島県</option>
										<option value="香川県">香川県</option>
										<option value="愛媛県">愛媛県</option>
										<option value="高知県">高知県</option>
									</optgroup>
									<optgroup label="九州・沖縄">
										<option value="福岡県">福岡県</option>
										<option value="佐賀県">佐賀県</option>
										<option value="長崎県">長崎県</option>
										<option value="熊本県">熊本県</option>
										<option value="大分県">大分県</option>
										<option value="宮崎県">宮崎県</option>
										<option value="鹿児島県">鹿児島県</option>
										<option value="沖縄県">沖縄県</option>
									</optgroup>
								</select>
                            </div>
                            <p>市町村</p>
                            <s:if test="firstAddressErrorList!=null && firstAddressErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold">
									<s:property value="firstAddressErrorList"/><br>
								</div>
							</s:if>

                            <div class="form-group">
                                <s:textfield value="%{#session.firstAddress}" name="firstAddress" id="name" type="text" class="form-control" placeholder="例) 横浜市緑区六本" />
                            </div>
                            <p>丁・番地・マンション</p>
                            <s:if test="secondAddressErrorList!=null && secondAddressErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold">
									<s:property value="secondAddressErrorList"/><br>
								</div>
							</s:if>
                            <div class="form-group mt-2">
                                <s:textfield value="%{#session.secondAddress}" name="secondAddress" id="name" type="text" class="form-control" placeholder="例) 5-9-17-232" />
                            </div>
                            <p>電話番号</p>
                            <s:if test="telErrorList!=null && telErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold">
									<s:property value="telErrorList"/><br>
								</div>
							</s:if>
                            <div class="form-group mt-2">
                                <s:textfield value="%{#session.tel}" name="tel" type="tel" class="form-control" placeholder="例) 08012345678" />
                            </div>
                            <button type="submit" class="login-submit btn btn-custom">CREATE ACCOUNT</button>
                        </form>
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
