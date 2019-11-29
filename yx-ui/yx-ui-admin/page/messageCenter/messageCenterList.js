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
    dataId = "";
    deptId = "";

    var tableIns = table.render({
        //设置表头
        cols: [[
            {field: 'id', title: 'id', hidden:true},
            {field: 'title', title: '内容标题'},
            {field: 'sketch', title: '内容简述'},
            {field: 'description', title: '描述'},
            {field: 'keywords', title: '关键字'},
            {field: 'status', title: '是否有效',templet: '#statusTpl'},
            {field: 'type', title: '类型',templet:'#typeTpl'},
            {field: 'opt', title: '操作', fixed: 'right', width: 250, align: 'left', toolbar: '#toolBar'}
        ]],
        url: 'sysMessageCenter/selectPage',
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
        toolbar: true,
        defaultToolbar :  ['filter'],
        elem: '#sysMessageCenterTable',
        page: {
            elem: 'pageDiv',
            limit: 10,
            limits: [10, 20, 30, 40, 50]
        }
    });

    //监听工具条
    table.on('tool(tableFilter)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data;
        dataId = data.id;
        deptId = data.deptId;
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
        if (layEvent === 'detail') { //查看
            pageOperation = 0;
            var index = layui.layer.open({
                title: "查看消息",
                type: 2,
                content: "messageCenter.html",
                success: function (layero, index) {
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回消息列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            /*$(window).resize(function () {
                layui.layer.full(index);
            });*/
            layui.layer.full(index);
        } else if (layEvent === 'del') { //删除
            var dataIds = [data.id];
            layer.confirm('您确定要删除吗？', {icon: 3, title: '确认'}, function () {
                $.ajax({
                    type: 'POST',
                    url: 'sysMessageCenter/delete',
                    data: JSON.stringify(dataIds),
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
                title: "编辑消息",
                type: 2,
                content: "messageCenter.html?id=2",
                success: function (layero, index) {
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回消息列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            /*$(window).resize(function () {
                layui.layer.full(index);
            });*/
            layui.layer.full(index);
        } else if (layEvent === 'upline') { //发布
            var dataIds = [data.id];
            layer.confirm("您确定要发布吗？", {icon: 3, title: "确认"}, function () {
                $.ajax({
                    type: 'POST',
                    url: 'sysMessageCenter/upline',
                    data: JSON.stringify(dataIds),
                    success: function (data) {
                        if (data.code == 200) {
                            if (data.data === true) {
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
        }else if (layEvent === 'downline') { //下线
            var dataIds = [data.id];
            layer.confirm("您确定要下线吗？", {icon: 3, title: "确认"}, function () {
                $.ajax({
                    type: 'POST',
                    url: 'sysMessageCenter/downline',
                    data: JSON.stringify(dataIds),
                    success: function (data) {
                        if (data.code == 200) {
                            if (data.data === true) {
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
        }else if (layEvent === 'ranking') { //置顶或取消置顶
            layer.confirm("您确定要置顶吗？", {icon: 3, title: "确认"}, function () {
                $.ajax({
                    type: 'POST',
                    url: 'sysMessageCenter/ranking',
                    data: JSON.stringify(data.id),
                    success: function (data) {
                        if (data.code == 200) {
                            layer.msg("操作成功", {icon: 1, time: 2000});
                            tableIns.reload({
                                page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            });
                        } else {
                            layer.msg(data.message, {icon: 2});
                        }
                    }
                });
            });
        }
    });

    //监听表格复选框选择
    table.on('checkbox(tableFilter)', function (obj) {
    });

    //查询
    $(".search_btn").click(function () {
        var title = $(".title").val();
        var type = $(".type").val();
        var status = $(".status").val();
        tableIns.reload({
            where: { //设定异步数据接口的额外参数，任意设
                condition: {
                    title: title,
                    type: type,
                    status: status,
                }
            },
            page: {
                curr: 1 //重新从第 1 页开始
            }
        });
    });

    //添加
    $(".SysSlideshowAdd_btn").click(function () {
        pageOperation = 1;
        var index = layui.layer.open({
            title: "添加消息",
            type: 2,
            content: "messageCenter.html",
            success: function (layero, index) {
                setTimeout(function () {
                    layui.layer.tips('点击此处返回消息列表', '.layui-layer-setwin .layui-layer-close', {
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
    });

    //批量删除
    $(".batchDel").click(function () {
        var checkStatus = table.checkStatus('sysMessageCenterTable');
        if (checkStatus.data.length === 0) {
            layer.msg("请选择要删除的消息", {icon: 0, time: 2000});
            return;
        }
        layer.confirm('确定删除选中的信息？', {icon: 3, title: '确认'}, function (index) {
            var indexMsg = layer.msg('删除中，请稍候', {icon: 16, time: false, shade: 0.8});
            var dataIds = [];
            for (var i = 0; i < checkStatus.data.length; i++) {
                dataIds[i] = checkStatus.data[i].id;
            }
            $.ajax({
                type: 'POST',
                url: 'sysMessageCenter/delete',
                data: JSON.stringify(dataIds),
                success: function (data) {
                    if (data.code == 200) {
                        if (data.data === true) {
                            layer.close(indexMsg);
                            layer.msg("删除成功", {icon: 1, time: 2000});
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
    })


});