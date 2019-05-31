<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Camp</title>



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
            <div class="container">

                <div class="row mt-5">
                    <div class="col-lg-6 contact-wrraper">
                        <div class="text-center">
                            <h1>Reservation <span class="font-weight-bold text-info">Camp</span></h1>
                            <h6 class="whatican pb-4">Feel free</h6>

                        </div>
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <div>
                                    <i class="mbri-letter text-info h1"></i>
                                </div>
                                <div class="mt-3">
                                    <h5 class="mb-0 contact_detail-title font-weight-boldx">メール</h5>
                                    <p class="text-muted">yasu92kawa@gmail.com</p>
                                </div>
                            </div>
                            <div class="col-md-6 text-center">
                                <div>
                                    <i class="mbri-pin text-info h1"></i>
                                </div>
                                <div class="mt-3">
                                    <h5 class="mb-0 contact_detail-title font-weight-bold">オフィス</h5>
                                    <p class="text-muted">オークハウス 横浜アカデミア</p>
                                </div>
                            </div>
                        </div>

                        <div class="form-control">
                            <form method="post" action="mail_confirm.php">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group mt-2">
                                            <input name="name" id="name" type="text" class="form-control" placeholder="お名前*" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mt-2">
                                            <input name="email" id="email" type="email" class="form-control" placeholder="メールアドレス*" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group mt-2">
                                            <input type="text" name="text"class="form-control" id="subject" placeholder="件名" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group mt-2">
                                            <textarea name="comments" id="comments" rows="4" class="form-control" placeholder="メッセージ"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                            <input type="submit" class="btn btn-info" value="Submit">
                                    </div>
                                    <div class="col-lg-12 text-right mt-2">
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                    <div class="col-lg-6">
                        <div class="text-center">
                            <h2>COMMENT<span class="font-weight-bold text-info"> FORM</span></h2>
                            <p>お気軽に書き込みください。</p>
                        </div>
                        <div class="form-control">
                            <form method="post" action="insert2.php">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group mt-2">
                                            <input name="handlname" id="name" type="text" class="form-control" placeholder="ハンドルネーム*" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group mt-2">
                                            <input type="title" name="title"class="form-control" id="subject" placeholder="タイトル" required/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group mt-2">
                                            <textarea name="comments" id="comments" rows="4" class="form-control" placeholder="コメント"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 text-right mt-2">
                                            <input type="submit" class="btn btn-info" value="Submit">
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>


                </div>

                <!-- Start comments -->

                <div class="row justify-content-center">
                    <div class="col-lg-12 mt-5">
                        <div class="text-center">
                            <h2>COMMENTS<span class="font-weight-bold text-info"> LIST</span></h2>
                            <p>今までのコメント一覧です。</p>
                        </div>
                    </div>
                </div>

                <div class="row justify-content-center home-btn">
                    <form method="post" action="http://yasuhiro-portfolio.com/">
                        <input type="submit" class="btn btn-outline-dark btn-round btn1" value="ホームへ戻る">
                    </form>
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

