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
    <!–[if IE]>
    <script src="resource/vue/html5.js"></script>
    <![endif]–>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="resource/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/index.css">
    <title>一特抽奖系统</title>
</head>
<body>
<div class="container" id="list">
    <div>
        <p>
            <a href="/kill">首页</a>
            <a href="list.htm">已签到</a>
            <a href="cj.htm">未签到</a>
            <a href="hj.htm">已中奖</a>
        </p>
    </div>
    <div><h2 style="text-align: center;font-weight: bold">欢迎使用一特公司抽奖平台 <span class="label label-primary">Beta</span>
    </h2><br/></div>
    <div class="panel panel-success">
        <!-- Default panel contents -->
        <div class="panel-heading"><b style="font-size: 16px">员工已签到列表 <span class="badge">{{message}}</span></b>
            <div style="display: inline-block;text-align: right;width: 80%;">
                <input type="text" class="form-control" id="queryNmae" v-model="queryNmae" placeholder="查询员工编号"
                       style="display: inline-block;    width: 30%;    margin-left: 0px;">
                <button type="button" @click="showList()" class="btn btn-primary">查询</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>员工编号</th>
                    <th>员工姓名</th>
                    <th>所属中心</th>
                    <th>所属部门</th>
                    <th>电话</th>
                    <th>状态</th>
                    <th>签到时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <tr v-for="data in list">
                    <td>{{data.employee_no}}</td>
                    <td>{{data.name}}</td>
                    <td>{{data.center}}</td>
                    <td>{{data.depart}}</td>
                    <td>{{data.mobile}}</td>
                    <td v-if="data.status ==1">已签到</td>
                    <td v-if="data.status ==0">未签到</td>
                    <td v-if="data.status ==2">已中奖</td>
                    <td>{{data.crt_date}}</td>
                    <td><a href="javascrpt:;" @click="open(data.id,data.name,data.status)">修改</a></td>
                </tr>
                </tbody>

                <tfoot>
                <tr>
                    <td colspan="8">
                        <div class="pull-right">
                            <ul class="pagination" style="  margin: 0px 0;  ">
                                <li class="previous  "><a href="javascrip:;" @click="showList(page_num-1)">&larr;
                                    上一页</a></li>
                                <li v-for="item in page_count" class="active1"><a href="javascrip:;"
                                                                                  @click="showList(item)">{{item}}</a>
                                </li>
                                <li class="next"><a href="javascrip:;" @click="showList(page_num+1)">下一页 &rarr;</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <div class="footer"> Copyright &copy; 2017 一特软件开发团队</div>
    <div id="from" style="display: none;   width: 100%;   padding: 30px;" class="form-horizontal" role="form">
        <fieldset disabled>
        <div class="form-group">
            <label class="col-sm-3 control-label">员工姓名： </label>
            <div class="col-sm-8">
                <input type="text"  :value="name"  class="form-control"  >
            </div>
        </div>
        </fieldset>
        <div class="form-group">
            <label class="col-sm-3 control-label">状   态：</label>
            <div class="col-sm-8">
                <select class="form-control" v-model="status">
                    <option value="0">未签到</option>
                    <option value="1">已签到</option>
                    <option value="2">已获奖</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">备注： </label>
            <div class="col-sm-8">
                <input type="text"  v-model="remark"  class="form-control"  >
            </div>
        </div>
    </div>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="resource/jquery/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="resource/dist/js/bootstrap.min.js"></script>
<script src="resource/vue/vue.js"></script>
<script src="resource/layer/layer.js"></script>
<script src="resource/vue/config.js"></script>
<script src="resource/vue/app.js"></script>
</body>
</html>
