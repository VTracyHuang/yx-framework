layui.config({
    base: "../../js/"
}).use(['base', 'form', 'layer', 'jquery', 'table'], function () {
    var base = layui.base,
        form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        $ = layui.jquery,
        table = layui.table;
        //页面操作：0：查看，1：添加，2：修改
        pageOperation = 0;
        jobId = "";


    var tableIns = table.render({
        //设置表头
        cols: [[
            {type: 'checkbox', fixed: 'left'},
                {field: 'jobId', title: '任务id',width:100},
                {field: 'beanName', title: 'bean名称',width:200},
                {field: 'methodName', title: '方法名',width:200},
                {field: 'params', title: '参数',width:150},
                {field: 'status', title: '状态', templet: '<div>{{d.status === 0 ? "成功" : "失败"}}</div>',width:100},
                {field: 'times', title: '耗时（毫秒）',width:200},
                {field: 'createTime', title: '执行时间',width:200},
                {field: 'error', title: '失败信息',width:300}
                // {field: 'opt', title: '操作', fixed: 'right', width: 160, align: 'center', toolbar: '#toolBar'}
        ]],
        url: 'scheduleJobLog/selectPage',
        method: 'post',
        contentType: 'application/json',
        request: {
            pageName: 'current', //页码的参数名称，默认：page
            limitName: 'size' //每页数据量的参数名，默认：limit
        },
        response: {
            statusCode: 200, //成功的状态码，默认：0
            msgName: 'message' //状态信息的字段名称，默认：msg
        },
        elem: '#ScheduleJobLogTable',
        page: {
            elem: 'pageDiv',
            limit: 10,
            limits: [10, 20, 30, 40, 50]
        }
    });

    //监听工具条
    table.on('tool(tableFilter)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data;
        jobId = data.jobId;

        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
        if (layEvent === 'detail') { //查看
            pageOperation = 0;
            var index = layui.layer.open({
                title: "查看定时任务",
                type: 2,
                content: "scheduleJob.html",
                success: function (layero, index) {
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
           /* $(window).resize(function () {
                layui.layer.full(index);
            });*/
            layui.layer.full(index);
        } else if (layEvent === 'del') { //删除
            var jobIds = [data.jobId];
            layer.confirm('您确定要删除吗？', {icon: 3, title: '确认'}, function () {
                $.ajax({
                    type: 'POST',
                    url: 'scheduleJob/delete',
                    data: JSON.stringify(jobIds),
                    success: function (data) {
                        if (data.code == 200) {
                            if (data.data === true) {
                                obj.del();
                                layer.msg("删除成功", {icon: 1, time: 2000});
                            }
                        } else {
                            layer.msg(data.message, {icon: 2});
                        }
                    }
                });
            });
        } else if (layEvent === 'edit') { //编辑
            pageOperation = 2;
            var index = layui.layer.open({
                title: "编辑定时任务",
                type: 2,
                content: "scheduleJob.html",
                success: function (layero, index) {
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
           /* $(window).resize(function () {
                layui.layer.full(index);
            });*/
            layui.layer.full(index);
        }
    });

    //监听表格复选框选择
    table.on('checkbox(tableFilter)', function (obj) {
    });

    //查询
    $(".search_btn").click(function () {
        var beanName = $(".beanName").val();
        var methodName=$(".methodName").val();

        tableIns.reload({
            where: { //设定异步数据接口的额外参数，任意设
                condition: {
                    bean_name: beanName,
                    method_name:methodName
                }
            },
            page: {
                curr: 1 //重新从第 1 页开始
            }
        });
    });

    //立即执行
    $(".batchRun").click(function () {
        var checkStatus = table.checkStatus('ScheduleJobTable');
        if (checkStatus.data.length === 0) {
            layer.msg("请选择要立即执行的定时任务", {icon: 0, time: 2000});
            return;
        }
        layer.confirm('确定立即执行选中的定时任务？', {icon: 3, title: '确认'}, function (index) {
            var indexMsg = layer.msg('操作中，请稍候', {icon: 16, time: false, shade: 0.8});
            var jobIds = [];
            for (var i = 0; i < checkStatus.data.length; i++) {
                jobIds[i] = checkStatus.data[i].jobId;
            }
            $.ajax({
                type: 'POST',
                url: 'scheduleJob/run',
                data: JSON.stringify(jobIds),
                success: function (data) {
                    if (data.code == 200) {
                        if (data.data === true) {
                            layer.close(indexMsg);
                            layer.msg("操作成功", {icon: 1, time: 2000});
                            tableIns.reload({
                                page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            });
                        }
                    } else {
                        layer.msg(data.message, {icon: 2});
                    }
                }
            });
        });
    });



});
