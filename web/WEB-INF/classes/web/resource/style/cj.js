// 2017/01/14 OF 抽奖程序
var data = {};
data.list = [];
var nametxt = $('.name');
var phonetxt = $('.phone');
var pcount = data.list.length - 1;//参加人数
var runing = true;
var td = 1//谁第几个抽到
var num = 0;
var t;
var shi = false;
var shilist = [];
var v = new Vue({
    methods: {
        showList: function () {
            var lay;
            var _self = this;
            $.ajax({
                type: 'POST',
                url: Vue.config.sys.ip + 'queryCjList.json',
                timeout: Vue.config.sys.timeout,
                beforeSend: function (XHR) {
                    lay = layer.msg('加载中', {
                        icon: 16, offset: '200px'
                    });
                }, success: function (d) {
                    layer.close(lay);
                    if (d.retCode == '0000') {
                        data.list = d.list;
                        pcount = data.list.length - 1;//参加人数
                        layer.msg('加载完成', {icon: 1, offset: '200px', time: 1000});
                    } else {
                        layer.msg('加载错误:' + d, {icon: 2, offset: '200px', time: 3000});
                    }
                }, complete: function (XHR, TS) {
                    console.info("处理成功。");
                }
            });
        }, update: function (employee_no) {
            var _self = this;
            var lay ;
            $.ajax({
                type: 'POST',
                url: Vue.config.sys.ip + 'updateEmpoyee.json',
                data: {'status':'2','id':employee_no,'remark':''},
                timeout: Vue.config.sys.timeout,
                beforeSend: function (XHR) {
                    lay = layer.msg('加载中', {
                        icon: 16,offset: '200px'
                    });
                }, success: function (data) {
                    layer.close(lay);
                    if (data.retCode == '0000') {
                        console.info('修改完成');
                    } else {
                        console.info('修改错误:'+data);
                    }
                }, complete: function (XHR, TS) {
                    console.info("处理成功。");
                }
            });
        }
    }
});

v.showList();
//开始停止
function start() {
    if (runing) {
        if (pcount <= 0 || td == 11) {
            alert("抽奖结束");
            return false;
        }
        runing = false;
        $('#btntxt').removeClass('start').addClass('stop');
        $('#btntxt').html('停止');
        if (shi) {
            startNumShi();
        } else {
            startNum();
        }
    } else {
        runing = true;
        $('#btntxt').removeClass('stop').addClass('start');
        $('#btntxt').html('开始');
        stop();
        if (shi) {
            zdcl();
        }else{
        zd();//中奖处理
        }
    }
}
//循环参加名单
function startNum() {
    //打印中奖者名单
    var tt = Math.random();
    num = Math.floor(tt * pcount);
    nametxt.html(data.list[num].name);
    phonetxt.html(data.list[num].employee_no);
    //$("#image").attr("src", "resource/image/"+data.list[num].id+".jpg");
    t = setTimeout(startNum, 60);
}
//每次出现10个
function startNumShi() {
        if (shilist.length <= 10) {
        for (var i = 0; i < 10; i++) {
            var tt = Math.random();
            num = Math.floor(tt * pcount);
            nametxt.html(data.list[num].name);
            phonetxt.html(data.list[num].employee_no);
            shilist[i] = num;
            pcount = data.list.length - 1;
        }}
    t = setTimeout(startNum, 60);
}
//停止跳动
function stop() {
    pcount = data.list.length - 1;
    clearInterval(t);
    t = 0;
}
//从一等奖开始 
function zd() {
    $('.list').prepend("<p>" + td + ' ' + data.list[num].name + " -- " + data.list[num].employee_no + "</p>");
    //将已中奖者从数组中"删除",防止二次中奖
    v.update(data.list[num].employee_no);
    data.list.splice($.inArray(data.list[num], data.list), 1);
    td = td + 1;
}
function chuli() {
    runing = true;
    $('#btntxt').removeClass('stop').addClass('start');
    $('#btntxt').html('开始');
    stop();
    zdcl();//中奖处理
}

function zdcl() {
    nametxt.html(data.list[shilist[0]].name);
    phonetxt.html(data.list[shilist[0]].employee_no);
    for (var i = 0; i < 10; i++) {
        $('.list').prepend("<p>" + td + ' ' + data.list[shilist[i]].name + " -- " + data.list[shilist[i]].employee_no + "</p>");
        //将已中奖者从数组中"删除",防止二次中奖
    }
    for(var i = 0; i < 10; i++){
        data.list.splice($.inArray(data.list[shilist[i]], data.list), 1);
        td = td + 1;
    }
}

// 方法 1：更换图片地址
$('img').error(function () {
    $(this).attr('src', 'resource/image/ico.png');
});
