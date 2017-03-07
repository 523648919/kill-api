<%--
  Created by IntelliJ IDEA.
  User: administator
  Date: 2016/11/3
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="resource/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/index.css">

    <title>一特抽奖系统</title>
  </head>
  <body >
  <div class="container" >

    <div id="appb">
      <p>
        <!-- 使用 router-link 组件来导航. -->
        <!-- 通过传入 `to` 属性指定链接. -->
        <!-- <router-link> 默认会被渲染成一个 `<a>` 标签 -->
        <a href="/kill">首页</a>
        <a href="list.htm">已签到</a>
        <a href="order.htm">未签到</a>
      </p>
      <!-- 路由出口 -->
      <!-- 路由匹配到的组件将渲染在这里 -->
      <router-view></router-view>
    </div>

      <div><h2 style="text-align: center;font-weight: bold">欢迎使用一特公司抽奖平台 <span class="label label-primary">Beta</span></h2><br/></div>
      <div class="panel panel-success" id="order" >
          <!-- Default panel contents -->
          <div class="panel-heading"><b style="font-size: 16px">员工未签到列表 <span class="badge" id="message">{{message}}</span></b></div>
         <div class="table-responsive">
        <table class="table table-hover table-bordered">
          <thead>
          <tr>
            <th>产品</th>
            <th>产品数量</th>
            <th>手机号</th>
            <th>结果时间</th>
            <th>详情</th></tr>
          </thead>
          <tbody >

          <tr  v-for="data in list" >
            <td>{{data.name}}</td>
            <td>1(台)</td>
            <td>{{data.user_phone}}</td>
            <td  >{{data.end_time}}</td>
            <td><a :href="'detail.htm?seckill_id=' +data.seckill_id" class="label label-info">查看</a></td></tr>
          </tbody>
        </table>
      </div>
    </div>
      </div>
  <template id="index">
</template>
  <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
  <script src="resource/jquery/jquery.min.js"></script>
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="resource/dist/js/bootstrap.min.js"></script>
  <script src="resource/vue/vue.js"></script>
  <script src="resource/vue/vue-router.js"></script>
  <script src="resource/vue/config.js"></script>
  <script src="resource/vue/index.js"></script>
  <script>
    function timer()
    {
      var ts = (new Date(2017,01,06,10,30,00)) - (new Date());//计算剩余的毫秒数
      var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);//计算剩余的天数
      var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数
      var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数
      var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数
      dd = checkTime(dd);
      hh = checkTime(hh);
      mm = checkTime(mm);
      ss = checkTime(ss);
      document.getElementById("timer").innerHTML = dd + "天" + hh + "时" + mm + "分" + ss + "秒";
      setInterval("timer()",1000);
    }
    function checkTime(i)
    {
      if (i < 10) {
        i = "0" + i;
      }
      return i;
    }
  </script>
  </body>
</html>
