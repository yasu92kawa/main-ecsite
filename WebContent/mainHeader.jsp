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
    <header>
        <!-- Start Navbar -->
    	<nav class="navbar navbar-expand-md navbar-fixed-top custom-nav sticky">
            <div class="container-fluid">
                <a class="navbar-brand pt-0 logo" href="#">
                    <img src="images/logo_black.png" alt="" class="img-fluid logo-light">
                    <img src="images/logo_white.png" alt="" class="img-fluid logo-dark">
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href='<s:url action="HomeAction"/>'>Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"  href='<s:url action="ProductListAction"/>'>Items</a>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link" href='<s:url action="CartAction"/>'>Cart</a>
                        </li>


                        <li class="nav-item">
                                <a class="nav-link" href='<s:url action="ContactAction"/>'>Contact</a>
                        </li>
                        <li class="nav-item">
                                <a class="nav-link" href='<s:url action="CampAction"/>'>Camp</a>
                        </li>
                        <!--ログイン時：「Mypage」表示  -->
                        <s:if test="#session.loginFlag == 1">
                        	<li class="nav-item">
	                             <a class="nav-link" href='<s:url action="MyPageAction"/>'>My Page</a>
	                        </li>
                        </s:if>

                        <!--ログイン時：「Logout」  -->
                        <s:if test="#session.loginFlag == 1">
                        	<li class="nav-item">
	                            <a class="nav-link" href='<s:url action="LogoutAction"/>'>Logout</a>
	                        </li>
                        </s:if>
                         <!--未ログイン時：「login」  -->
                        <s:else>
                        	<li class="nav-item">
	                            <a class="nav-link" href='<s:url action="GoLoginAction"/>'>Login</a>
	                        </li>
                        </s:else>
                    </ul>
                </div>
            </div>
        </nav>
	</header>
        <!-- End Navbar -->