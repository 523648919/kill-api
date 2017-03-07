/**
 * Created by administator on 2017/1/6.
 */

var list = new Vue({
    el: '#list',
    data: {
        message:'Hi.OF!',queryNmae:'',page_num:1,page_count:1,cruetnum:'2',  options: [
            { text: '未签到', value: '0' },
            { text: '已签到', value: '1' },
            { text: '已获奖', value: '2' }
        ],id:'',name:'',status:'',remark:'',
        list: []
    }, methods: {
        open: function (id,name,status) {
            var _self = this;
            this.id = id,this.name = name,this.status = status;
            var index =  layer.open({
                type: 1,
                title: '修改',
                closeBtn: 1,
                shadeClose : true,
                area: ['500px', '280px'],
                skin: 'layui-layer-nobg', //没有背景色
                content: $('#from'),
                btn : [ '完成', '取消' ],
                yes : function(index, layero) {
                    _self.update();
                    layer.close(index);
                    _self.showList(1);
                },
                btn2 : function(index, layero) {
                    layer.close(index);
                }
            });
        },
        update: function () {
            var _self = this;
            var lay ;
            $.ajax({
                type: 'POST',
                url: Vue.config.sys.ip + 'updateEmpoyee.json',
                data: {'status':_self.status,'id':_self.id,'remark':_self.remark},
                timeout: Vue.config.sys.timeout,
                beforeSend: function (XHR) {
                    lay = layer.msg('加载中', {
                        icon: 16,offset: '200px'
                    });
                }, success: function (data) {
                    layer.close(lay);
                    if (data.retCode == '0000') {
                        layer.msg('修改完成', {icon: 1,offset: '200px',time: 1000});
                    } else {
                        layer.msg('修改错误:'+data, {icon: 2,offset: '200px',time: 3000});
                    }
                }, complete: function (XHR, TS) {
                    console.info("处理成功。");
                }
            });
        },
        showList: function (page_num) {
            if(page_num != null && page_num !=undefined ){
                this.page_num = page_num;
            }
            if(page_num <=0 || page_num ==undefined){
                page_num= 1;
            }
            if(page_num >=this.page_count && page_num !=undefined){
                page_num= this.page_count;
            }
            var _self = this;
            var lay ;
            $.ajax({
                type: 'POST',
                url: Vue.config.sys.ip + 'queryEmpoyeeList.json',
                data: {'status':'2','employee_name':_self.queryNmae.trim(),'employee_no':'','page_num':page_num},
                timeout: Vue.config.sys.timeout,
                beforeSend: function (XHR) {
                    lay = layer.msg('加载中', {
                        icon: 16,offset: '200px'
                    });
                }, success: function (data) {
                    layer.close(lay);
                    if (data.retCode == '0000') {
                        _self.list = data.list;
                        _self.page_count = parseInt (parseInt(data.results)/parseInt(data.limit))+1;
                        layer.msg('加载完成', {icon: 1,offset: '200px',time: 1000});
                    } else {
                        layer.msg('加载错误:'+data, {icon: 2,offset: '200px',time: 3000});
                    }
                }, complete: function (XHR, TS) {
                    console.info("处理成功。");
                }
            });
        }
    }
});
list.showList();

