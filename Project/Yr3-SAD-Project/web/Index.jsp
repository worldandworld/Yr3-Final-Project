<%-- 
    Document   : Index
    Created on : 02-Feb-2016, 17:52:09
    Author     : Savan Mathew
--%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="TablesDto.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Black White Financial Services</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/business-casual.css" rel="stylesheet">
        <link rel="stylesheet" href="css/normalize.css">


        <link rel="stylesheet" href="css/style.css">

        <!-- Fonts -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="./css/styles.css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="./js/formslider.js"></script>
        <script>
            function loadFile() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        document.getElementById("demo").innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("GET", "login2.html", true);
                xhttp.send();

            }
            function about() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        document.getElementById("demo").innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("GET", "about.html", true);
                xhttp.send();

            }
            function contact() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        document.getElementById("demo").innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("GET", "contact.html", true);
                xhttp.send();

            }
        </script>
    </head>
    <body>
        <div class="brand">Black White Financial Services</div>
        <div class="address-bar">46 Clanbrassil Street, Dundalk, Co Louth</div>

        <!-- Navigation -->
        <nav class="navbar navbar-default" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                    <a class="navbar-brand" href="Index.jsp">Business Casual</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="">Home</a>
                        </li>
                        <li>
                            <a href="" onclick="about(); return false;">About</a>
                        </li>
                        <li>
                            <a href="" onclick="contact(); return false;">Contact</a>
                        </li>
                        <li>
                            <a href="" onclick="loadFile();
                                    return false;">Login | Register</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <div id="demo">
            <div class="container">
                <div class="row">
                    <div class="box">
                        <div class="col-lg-12 text-center">
                            <div id="carousel-example-generic" class="carousel slide">
                                <!-- Indicators -->
                                <ol class="carousel-indicators hidden-xs">
                                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <img class="img-responsive img-full" src="img/slide-1.jpg" alt="">
                                    </div>
                                    <div class="item">
                                        <img class="img-responsive img-full" src="img/slide-2.jpg" alt="">
                                    </div>
                                    <div class="item">
                                        <img class="img-responsive img-full" src="img/slide-3.jpg" alt="">
                                    </div>
                                </div>

                                <!-- Controls -->
                                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                    <span class="icon-prev"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                    <span class="icon-next"></span>
                                </a>
                            </div>
                            <h2 class="brand-before">
                                <small>Welcome to</small>
                            </h2>
                            <h1 class="brand-name">Business Casual</h1>
                            <hr class="tagline-divider">
                            <h2>
                                <small>By
                                    <strong>Start Bootstrap</strong>
                                </small>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container -->
        </div>

            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <p>Copyright &copy; Your Website 2014</p>
                        </div>
                    </div>
                </div>
            </footer>

            <!-- jQuery -->
            <script src="js/jquery.js"></script>
            <script src="js/index.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="js/bootstrap.min.js"></script>

            <!-- Script to Activate the Carousel -->
            <script>
                                $('.carousel').carousel({
                                    interval: 5000 //changes the speed
                                });
            </script>

    </body>

</html>
