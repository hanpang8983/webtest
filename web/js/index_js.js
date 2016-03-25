/**
 * Created by InCosmos on 2016/3/15.
 */

var page;
var i;
$(document).ready(function(){
    getPosts(1);
})

//获取文章内容方法
function getPosts(pagenum){
    $.ajax({
        type:"POST",
        url:"post_getAllPost.action",
        data:"page.currentPage="+pagenum,
        success:function(msg){
            var obj= $.parseJSON(msg);
            page=obj[1];
            $("#postContent").empty();
            for (var i=0;i<obj[0].length;i++){
                addPost(obj[0][i]);
            }
            paging(page);
        }
    })
}
//绘制分页方法
function paging(page){
    $("ul.pagination").empty();
    if(page.currentPage==1){
        $("ul.pagination").append(
        "<li class='disabled'>"+
            "<span><span aria-hidden='true'>&laquo;</span></span>"+
        "</li>"
        )
    }else {
        $("ul.pagination").append(
            "<li>"+
                "<a onclick='getPosts(page.currentPage-1)' aria-label='Previous'>"+
                    "<span aria-hidden='true'>&laquo;</span>"+
                "</a>"+
            "</li>"
        )
    }

    for (i=page.pagingStart;i<=page.pagingEnd;i++){
        if(i==page.currentPage){
            $("ul.pagination").append(
                "<li class='active'><span>"+i+"</span></li>"
            )
        }else{
            $("ul.pagination").append(
                "<li><a onclick='getPosts(this.text)' >"+i+"</a></li>"
            )
        }
    }
    console.log(page.pagingStart);
    console.log(page.pagingEnd);
    if(page.currentPage==page.totalPage){
        $("ul.pagination").append(
            "<li class='disabled'>"+
            "<span><span aria-hidden='true'>&raquo;</span></span>"+
            "</li>"
        )
    }else{
        $("ul.pagination").append(
            "<li>"+
            "<a onclick='getPosts(page.currentPage+1)' aria-label='Next'>"+
            "<span aria-hidden='true'>&raquo;</span>"+
            "</a>"+
            "</li>"
        )
    }
}

function addPost(post){
    $("#postContent").append(
        "<div class='row'>"+
            "<div id='postsHead'  class='col-md-4 col-xs-4'>"+
                "<div id='date' class='col-md-12'>"+
                    "<p>" +post.publishdate+"</p>"+
                "</div>"+
                "<div id='tag' class='col-md-12'>"+
                "   <h3><strong>文本文本文本文本</strong></h3>"+
                "</div>"+
                "<div id='reply' class='col-md-12'>"+
                    "<p>"+
                        "sdadasadasdadasssdadadasadasdadadadasadasdadadadasadasdadadadasadasdadadadasadasdada"+
                    "</p>"+
                "</div>"+
            "</div>"+
            "<div id='body' class='col-md-8 col-xs-8'>"+
                "<div class='col-md-6 col-xs-6'>"+
                    "<img class='img-rounded' src='images/152ac65c10385343937c69b29313b07ecb8088f6.jpg'/>"+
                "</div>"+
                "<div class='col-md-6 col-xs-6'>"+
                    "<div id='title' class='col-md-12'>"+
                        "<a><strong>"+post.title+"</strong></a>"+
                    "</div>"+
                    "<div id='content' class='col-md-12'>"+
                        "<p>"+post.content+"</p>"+
                    "</div>"+
                "</div>"+
            "</div>"+
        "</div>"
    )
}