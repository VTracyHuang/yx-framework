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
            {type: 'checkbox', fixed: 'left'},
                {field: 'phone', title: '手机号码'},
                {field: 'password', title: '密码'},
                {field: 'exkey', title: '加密秘钥'},
                {field: 'userType', title: '用户类型:1、个人用户；2、企业用户'},
                {field: 'userName', title: '用户名'},
                {field: 'realName', title: '真实姓名'},
                {field: 'idType', title: '证件类型：1、身份证;2、组织机构代码证'},
                {field: 'idNumber', title: '证件号码'},
                {field: 'acno', title: '银行账号'},
                {field: 'status', title: '用户状态:1、有效；0、无效'},
                {field: 'accountStatus', title: '存管账户状态：0、未开通；1、已开通；2、被拒绝'},
                {field: 'companyName', title: '企业名称'},
                {field: 'transactorName', title: '经办人姓名'},
                {field: 'transactorPhone', title: '经办人手机号码'},
                {field: 'source', title: '用户来源：1：PC;2：wx;3：ANDROID；4：IOS'},
                {field: 'refPhone', title: '推荐人手机号码'},
                {field: 'email', title: '邮箱'},
                {field: 'reqseqno', title: '交易流水号'},
                {field: 'isBorrower', title: '是否为借款人：1、是；0、否'},
                {field: 'isDepositary', title: '是否受托人:1、是；0、否'},
                {field: 'chargeFlow', title: '充值流水'},
                {field: 'withdrawFlow', title: '提现流水'},
            {field: 'opt', title: '操作', fixed: 'right', width: 160, align: 'center', toolbar: '#toolBar'}
        ]],
        url: 'user/selectPage',
        method: 'post',
        request: {
            pageName: 'current', //页码的参数名称，默认：page
            limitName: 'size' //每页数据量的参数名，默认：limit
        },
        response: {
            statusCode: 200, //成功的状态码，默认：0
            msgName: 'message' //状态信息的字段名称，默认：msg
        },
        elem: '#UserInfoTable',
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
                title: "查看用户",
                type: 2,
                content: "user.html",
                success: function (layero, index) {
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function () {
                layui.layer.full(index);
            });
            layui.layer.full(index);
        } else if (layEvent === 'del') { //删除
            var dataIds = [data.id];
            layer.confirm('您确定要删除吗？', {icon: 3, title: '确认'}, function () {
                $.ajax({
                    type: 'POST',
                    url: 'user/delete',
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
                title: "编辑用户",
                type: 2,
                content: "user.html",
                success: function (layero, index) {
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function () {
                layui.layer.full(index);
            });
            layui.layer.full(index);
        }
    });

    //监听表格复选框选择
    table.on('checkbox(tableFilter)', function (obj) {
    });

    //查询
    $(".search_btn").click(function () {
        var searchKey = $(".search_input").val();
        tableIns.reload({
            where: { //设定异步数据接口的额外参数，任意设
                condition: {
                    searchKey: searchKey
                }
            },
            page: {
                curr: 1 //重新从第 1 页开始
            }
        });
    });

    //添加会员
    $(".usersAdd_btn").click(function () {
        pageOperation = 1;
        var index = layui.layer.open({
            title: "添加用户",
            type: 2,
            content: "user.html",
            success: function (layero, index) {
                setTimeout(function () {
                    layui.layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            }
        });
        //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
        $(window).resize(function () {
            layui.layer.full(index);
        });
        layui.layer.full(index);
    });

    //批量删除
    $(".batchDel").click(function () {
        var checkStatus = table.checkStatus('userTable');
        if (checkStatus.data.length === 0) {
            layer.msg("请选择要删除的用户", {icon: 0, time: 2000});
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
                url: 'user/delete',
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