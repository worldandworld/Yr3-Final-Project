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

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            function loadFile() {
                alert('test');
                document.getElementById('demo').innerHTML = "test";

            }
        </script>
    </head>
    <body>
        <div class="brand">Black White Financial Services</div>
        <div class="address-bar">46 Clanbrassil Street, Dundalk, Co Louth</div>
        <a href="" onclick="loadFile();return false;">Login | Register</a>
        <div class="container">
            <div class="row"></div>
            <div id="demo" classs ="box">

            </div>
        </div>

    </body>

</html>
