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
        <!-- Start Navbar -->
        <nav class="navbar sub-nav">
            <div class="container-fluid header-no-menu">
                <a class="navbar-brand logo header-no-menu" href="#">
                    <img src="images/logo_white.png" alt="" class="img-fluid logo-dark">
                </a>
            </div>
        </nav>
        <!-- End Navbar -->

        <!-- START Main -->
        <section class="section" id="items">
            <div class="container ">
                <div class="row justify-content-center">
                    <div class="col-lg-12 mb-5">
                        <div class="text-center">
                            <h1>SIGN <span class="font-weight-bold text-info">UP</span></h1>
                        </div>
                    </div>
                </div>

                <div class="panel">
                    <div class="form-control text-center p-0">
                        <form action="CreateUserConfirmAction" >
                            <p>姓（全角）</p>
                            <s:if test="familyNameErrorList!=null && familyNameErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold text-left">
									<s:property value="familyNameErrorList"/><br>
								</div>
							</s:if>
                            <div class="form-group">
                                <s:textfield name="familyName" value="%{#session.familyName}" id="name" type="text" class="form-control" placeholder="例）田中" />
                            </div>
                            <p>名（全角）</p>
                            <s:if test="firstNameErrorList!=null && firstNameErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold text-left">
									<s:property value="firstNameErrorList"/><br>
								</div>
							</s:if>
                            <div class="form-group">
                                <s:textfield name="firstName" value="%{#session.firstNameKana}" id="name" type="text" class="form-control" placeholder="例）太郎"/>
                            </div>
                            <p>姓（かな）</p>
                            <s:if test="familyNameKanaErrorList!=null && familyNameKanaErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold text-left">
									<s:property value="familyNameKanaErrorList"/><br>
								</div>
							</s:if>
                            <div class="form-group">
                                <s:textfield name="familyNameKana" value="%{#session.familyNameKana}" id="name" type="text" class="form-control" placeholder="例）たなか" />
                            </div>
                            <p>名（かな）</p>
                            <s:if test="firstNameKanaErrorList!=null && firstNameKanaErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold">
									<s:property value="firstNameKanaErrorList"/><br>
								</div>
							</s:if>
                            <div class="form-group">
                                <s:textfield name="firstNameKana" value="%{#session.firstNameKana}" id="name" type="text" class="form-control" placeholder="例）たろう" />
                            </div>
                            <p>性別</p>
                            <div class="form-group border-0 text-left">
                                <label><input type="radio" name="sex" value="0" checked>男</label>
                                <label><input type="radio" name="sex" value="1">女</label>
                            </div>
                            <p>メールアドレス</p>
                            <s:if test="emailErrorList!=null && emailErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold text-left">
									<s:property value="emailErrorList"/><br>
								</div>
							</s:if>
                            <div class="form-group mt-2">
                                <s:textfield name="email" value="%{#session.email}" id="email" type="email" class="form-control" placeholder="メールアドレス*" />
                            </div>
                            <p>ユーザーID</p>
                            <s:if test="userIdErrorList!=null && userIdErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold text-left">
									<s:property value="userIdErrorList"/><br>
								</div>
							</s:if>
                            <s:if test="duplicateUserIdMessage !=null">
								<div class="error text-danger alert-danger font-weight-bold text-left">
									<s:property value="duplicateUserIdMessage"/><br>
								</div>
							</s:if>
                            <div class="form-group">
                                <s:textfield name="userId" value="%{#session.userId}" id="" type="text" class="form-control" placeholder="user123" />
                            </div>
                            <p>パスワード</p>
                            <s:if test="passwordErrorList!=null && passwordErrorList.size()>0">
								<div class="error text-danger alert-danger font-weight-bold text-left">
									<s:property value="passwordErrorList"/><br>
								</div>
							</s:if>
                            <s:if test="passwordMismatchingMessage != null">
								<div class="error text-danger alert-danger font-weight-bold text-left">
									<s:property value="passwordMismatchingMessage"/><br>
								</div>
							</s:if>
                            <div class="form-group">
                                <input name="password" type="password" class="form-control" placeholder="6文字以上" >
                            </div>
                            <p>パスワード（確認）</p>
                            <div class="form-group">
                                <input name="rePassword" type="password" class="form-control" placeholder="6文字以上" required>
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
