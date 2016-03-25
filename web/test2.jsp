<%--
  Created by IntelliJ IDEA.
  User: InCosmos
  Date: 2016/2/22
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="css/index_css01.css" rel="stylesheet">
    <script src="js/index_js.js"></script>
</head>

<body style="padding-top: 50px">
<nav class="nav navbar-inverse navbar-fixed-top">
    <div class="container ">
        <div class="navbar-header">
            <a href="post_getAllPost.action" class="navbar-brand">首页</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">刷刷刷</a></li>
                        <li><a href="#">法规发生光辉</a></li>
                        <li><a href="#">发粉红色</a></li>
                        <li><a href="#">大发发电话</a></li>
                    </ul>
                </li>
                <li><a href="#">留言板</a></li>
                <li><a href="#">关于我们</a></li>
            </ul>
            <button type="button" class="btn btn-default navbar-btn navbar-right" >登录</button>
        </div>
    </div>
</nav>

<div id="postContent" style="box-shadow:0px 0px 3px 3px rgba(162, 149, 236, 0.78) " class="container text-center">
</div>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <nav id="page">
                <ul class="pagination">

                </ul>
            </nav>
        </div>
    </div>
</div>

</body>

</html>