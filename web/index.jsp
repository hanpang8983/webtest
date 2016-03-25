<%--
  Created by IntelliJ IDEA.
  User: InCosmos
  Date: 2016/2/22
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>无标题文档</title>
</head>
<link rel="stylesheet" href="css/index_css.css" type="text/css" >

<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script>
  var page;
  $(document).ready(function(){
    getPosts(1);
  })

  function paging(page){
    $(".pageDiv").empty();
    if(page.currentPage!=1){
      $(".pageDiv").append(
        "<a onclick='getPosts(page.currentPage-1)'>&lt;</a>"
      );
    }

    $(".pageDiv").append(
            "<a>现在页面"+page.currentPage+"</a>"
    );

    if(page.currentPage!=page.totalPage){
      $(".pageDiv").append(
              "<a onclick='getPosts(page.currentPage+1)'>&gt;</a>"
      );
    }

  }

  function addPost(post){
    $("div .grayblock").append(
            "<div class='contentblock'>"+
              "<div class='floatblock'>"+
                "<div class='contHead'>"+
                  "<hr style='width:998px'/>"+
                  "<p>"+post.publishdate+"</p>"+
                  "<hr/>"+
                  "<h1>asdasdadasd</h1>"+
                  "<hr/>"+
                  "<p>文字</p>"+
                "</div>"+
                "<div class='contBody'>"+
                  "<img src='images/152ac65c10385343937c69b29313b07ecb8088f6.jpg' class='contImg'/>"+
                  "<div class='contText'>"+
                    "<a>"+post.title+"</a>"+
                    "<p>"+post.content+"</p></div>"+
                "</div>"+
              "</div>"+
            "</div>"
    )
  }

  function getPosts(pagenum){
    $.ajax({
      type:"POST",
      url:"post_getAllPost.action",
      data:"page.currentPage="+pagenum,
      success:function(msg){
        var obj= $.parseJSON(msg);
        page=obj[1];
        console.log(obj);
        $("div .grayblock").empty();
        for (var i=0;i<obj[0].length;i++){
          console.log(obj[0][i]);
          addPost(obj[0][i]);
        }
        paging(page);
      }
    })
  }

  var bool=false;
  function yidong(){
    if(bool){
      $("#zuobian").animate({left:'-170px'},"fast");
      document.getElementById("jiantou").src="images/right.png";
    }else{
      $("#zuobian").animate({left:'+0px'},"fast");
      document.getElementById("jiantou").src="images/left.png";
    }
    bool=!bool;
  }

  function showLoginDiv(){
    document.getElementById("mb").style.display="block";
    document.getElementById("l").style.display="block";
  }

  function hideLoginDiv(){

    document.getElementById("mb").style.display="none";
    document.getElementById("l").style.display="none";
  }

  function topAover(){
    $(this).addClass("bianse");
    $(this).addClass("shadow1");
  }

  function topAout(){
    $(this).removeClass("bianse");
    $(this).removeClass("shadow1");
  }

  function topblockover(){
    $(this).children(".topAside").css("display","block");
  }

  function topblockout(){
    $(this).children(".topAside").css("display","none");

  }

  $().ready(function(e) {
    var as=document.getElementsByClassName("topblock");
    for(var i=0;i<as.length;i++){
      as.item(i).addEventListener("mouseover",topblockover,false);
      as.item(i).addEventListener("mouseout",topblockout,false);
    }
    var topa=document.getElementsByClassName("topA");
    for(var i=0;i<topa.length;i++){
      topa.item(i).addEventListener("mouseover",topAover,false);
      topa.item(i).addEventListener("mouseout",topAout,false);

    }
  });

</script>

<bod>
<div id="zuobian" class="Ldiv shadow1"  >

  <img id="jiantou" src="images/right.png"  onClick="yidong()" />
</div>
<div class="TopDiv shadow1">
  <div class="topblock">
    <a href="#" class="topA" onMouseOver="a()" >主页</a>

  </div>
  <div class="topblock">
    <a href="#" class="topA">分类</a>
    <div class="topAside">
      <a href="#" class="topA" onMouseOver="a()" >按时大大</a>
      <a href="#" class="topA" onMouseOver="a()" >暗示法大师的法师的法师</a>
      <a href="#" class="topA" onMouseOver="a()" >大概分该</a>
    </div>
  </div>
  <div class="topblock">
    <a href="#" class="topA">留言</a>
    <div class="topAside">
      <a href="#" class="topA" onMouseOver="a()" >阿斯顿噶三顿饭</a>
      <a href="#" class="topA" onMouseOver="a()" >阿斯顿噶三顿饭</a>
      <a href="#" class="topA" onMouseOver="a()" >主和规范化佛顶骨页</a>
    </div>
  </div>
  <div class="topblock">
    <a href="#" class="topA">关于我们</a>

  </div>
  <div class="topblock">
    <a href="#" class="topA">送水电话</a>
    <div class="topAside">
      <a href="#" class="topA" onMouseOver="a()" >大公会</a>
      <a href="#" class="topA" onMouseOver="a()" >该倒是发个</a>
      <a href="#" class="topA" onMouseOver="a()" >刮风的该</a>
    </div>
  </div>

  <div class="topA topALogin shadow1"><a href="#" class="toplogin" onClick="showLoginDiv()">点击登录</a></div>
</div>
<!--登录块-->
<div id="mb" class="mengban" onClick="hideLoginDiv()"></div>
<div id="l" class="login" ></div>
<!--登录块-->
<a class="maoA backBottomPosition" href="#bottom">跳到底部</a>
<a class="maoA backTopPosition" href="#">跳到顶部</a>
<div class="content shadowblack" >
  <div class="grayblock">

    <div class="contentblock">
      <div class="floatblock">
        <div class="contHead">
          <hr style=" width:998px"/>
          <p>XXXX年XX月XX日</p>
          <hr/>
          <h1>文字</h1>
          <hr/>
          <p>文字</p>
        </div>
        <div class="contBody">
          <img src="images/152ac65c10385343937c69b29313b07ecb8088f6.jpg" class=" contImg"/>
          <div class="contText">
            <a>asdadasdasdasdsad</a>
            <p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p></div>
        </div>
      </div>
    </div>
  </div>
  <div class="pageDiv" style="width: 100%;height: 40px;background-color: #ffb2c0"  >
  </div>
</div>
</bod>
<a name="bottom"></a>
</html>

