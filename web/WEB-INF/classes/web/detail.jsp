<%--
  Created by IntelliJ IDEA.
  User: administator
  Date: 2016/11/3
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="resource/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/index.css">

    <title>秒杀系统</title>
  </head>
  <body >
  <div class="container"  >
      <div><h2 style="text-align: center;font-weight: bold">欢迎使用秒杀系统公测平台 <span class="label label-primary">Beta</span></h2><br/></div>
      <div class="panel panel-danger">
          <!-- Default panel contents -->
          <div class="panel-heading"><b style="font-size: 16px">产品列表详情 </b></div>
        <div class="panel-body">
          <p>产品:${data.name}</p>
          <p>产品数量:${data.number}(台)</p>
          <p>开始时间:${data.start_date}</p>
          <p >倒计时：<span id="timer" class="text-primary"></span></p>
          <p><button id="butt" style="display: none" type="button" class="btn btn-warning">未开始</button></p>
          <p><button id="end" style="display: none" type="button" class="btn btn-primary ">已结束</button></p>
          <p> <button type="button" id="submit" style="display: none"class="btn btn-danger">立即抢购</button></a></p>
        </div>
    </div>
      </div>
  <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
  <script src="resource/jquery/jquery.min.js"></script>
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="resource/dist/js/bootstrap.min.js"></script>
  <script src="resource/vue/vue.js"></script>
  <script src="resource/vue/index.js"></script>
  <script language="javascript" type="text/javascript">
    var interval = 1000;
    function ShowCountDown(year,month,day,h,m,s,divname)
    {
      var now = new Date();
      var endDate = new Date(year, month-1, day,h,m,s);
      var leftTime=endDate.getTime()-now.getTime();
      var leftsecond = parseInt(leftTime/1000);
//var day1=parseInt(leftsecond/(24*60*60*6));
      var day1=Math.floor(leftsecond/(60*60*24));
      var hour=Math.floor((leftsecond-day1*24*60*60)/3600);
      var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60);
      var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60);
      var cc = document.getElementById(divname);
      cc.innerHTML = day1+"天"+hour+"小时"+minute+"分"+second+"秒";
      if(leftTime <=0){
        clearInterval(timer);
        cc.innerHTML="已结束";
        $("#submit").css("display"," block");

      }else {
        $("#butt").css("display","block");
      }
      if('${data.number}' <= 0){
        $("#submit").css("display"," none");
        $("#end").css("display","block");
        $("#end").attr("disabled","disabled");
      }
    }
    da = '${data.start_time}';
    t = da.split(",");
    var timer =window.setInterval(function(){
      ShowCountDown(t[0],t[1],t[2],t[3],t[4],t[5],'timer');
    }, interval);
  </script>
  </body>
</html>
