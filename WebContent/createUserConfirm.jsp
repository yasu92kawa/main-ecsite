<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UserCreate Confirm</title>

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
                            <h1>CONFIRM <span class="font-weight-bold text-info"> USER INFO</span></h1>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="form-control text-center confirm-info p-0">
                        <s:form action="CreateUserCompleteAction" >
                            <p>姓（全角）</p>
							<div class="confirm-user-info">
							    <s:property value="familyName" escape="false"/>
							</div>
							<p>名（全角）</p>
							<div class="confirm-user-info">
							    <s:property value="firstName" escape="false"/>
							</div>
							<p>姓（かな）</p>
							<div class="confirm-user-info">
							    <s:property value="familyNameKana" escape="false"/>
							</div>
							<p>名（かな）</p>
							<div class="confirm-user-info">
							    <s:property value="firstNameKana" escape="false"/>
							</div>
							<p>性別</p>
							<div class="confirm-user-info">
								<s:if test="sex == 0">
									<p class="text-center font-weight-normal">男</p>
								</s:if>
								<s:else>
									<p class="text-center font-weight-normal">女</p>
								</s:else>
							</div>
							<p>メールアドレス</p>
							<div class="confirm-user-info">
							    <s:property value="email" escape="false"/>
							</div>
							<p>ユーザーID</p>
							<div class="confirm-user-info">
							    <s:property value="userId" escape="false"/>
							</div>
							<p>パスワード</p>
							<div class="confirm-user-info">
							    <s:property value="concealedPassword" escape="false"/>
							</div>
                            <button type="submit" class="login-submit btn btn-custom">COMPLETE</button>
                        </s:form>
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
