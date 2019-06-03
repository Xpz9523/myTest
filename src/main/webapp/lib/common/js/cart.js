layui.use([ 'form', 'layer', 'laypage', 'laydate','table' ],function() {
	var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate, table=layui.table;

    //列表
    var tableIns = table.render({
        elem: '#addressList',
        url : '/admin/selectCart',
        cellMinWidth : 120,
        page : true,
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "newsListTable",
        cols : [[
        	  /*{type: "checkbox", fixed:"left", width:50,height:50},*/
            {type: "numbers", fixed:"left", width:150,height:50},
            {field: 'userLoginName', title: '用户姓名', width:150,height:50},
            {field: 'cartGoodName', title: '商品名称', align:'center', width:150,height:50},
            {field: 'title', title: '标题', align:'center', width:300,height:50},
            {field: 'num', title: '数量',  align:'center',width:150,height:50},
            {field: 'price', title: ' 单价',  align:'center',width:100,height:50},
            {field: 'countMoney', title: ' 总计',  align:'center',width:100,height:50},
            {field: 'goodImg', title: ' 商品图片',   align:'center',width:300, templet:imgFmt,height:150},
            {field: 'sizeInfo', title: ' 规格信息',  align:'center',width:300,height:50},
           /* {field: 'detailAddress', title: ' 详细地址',  align:'center',width:220},
            {field: 'isDefault', title: ' 是否默认地址',  align:'center',width:150, toolbar:'#addressListBar2'},*/
            /*{field: 'createTime', title: ' 创建时间',  align:'center',width:250,height:50},
            {field: 'updateTime', title: ' 最后修改时间',  align:'center',width:250,height:50},*/
            /*{title: '操作', width:170, toolbar:'#addressListBar',fixed:"right",align:"center"}*/
        ]]
    });
    //模糊搜索
    var $ = layui.$, active = {
      reload: function(){  	
    	 //赋值
    	var selectMy=$("#selectMy").val();
        //执行重载
        table.reload('newsListTable', {
          page: {
            curr: 1 //重新从第 1 页开始
          }
          ,where: {
        	  receivePersonName: selectMy||null
            }
    	
        });
      }
    };
    $('.demoTable .layui-btn').on('click', function(){
    	  var type = $(this).data('type');
    	  active[type] ? active[type].call(this) : '';
    	}); 
    //列表操作
    table.on('tool(addressList)', function(obj){
    	  var data = obj.data; //获得当前行数据
   	      var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
   	      var tr = obj.tr; //获得当前行 tr 的DOM对象	  
        if(layEvent === 'del'){ //删除
            layer.confirm('确定删除此数据吗？',{icon:3, title:'提示信息'},function(index){
            	  deleteAddress(data);
            	  layer.close(index);
                });
        }else if(layEvent=='hui'){
            layer.confirm('确定恢复此数据吗？',{icon:3, title:'提示信息'},function(index){
          	  huiaddress(data);
          	  layer.close(index);
              });
        	
        } 
    });
})


function imgFmt(d){
	return '<img style="width:120px;height:50px" src="'+d.goodImg+'" />'
}
/* 删除 */
	function deleteAddress(data) {
	
	layui.use([ 'form', 'layer', 'laypage', 'laydate','table' ],function() {
		var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate, table=layui.table;

			$.ajax({
						url : "/address/admin/delAddress",
						type : "post",
						data : {
							"pkAddressId" : data.pkAddressId
						},
						dataType : "json",
						success : function(data) {
							if (data == 1) {
								layer.msg("删除成功");// 提示成功操作消息
								table.reload("newsListTable");
							} else if (data == 0) {
								alert("删除失败")
							}
						}
					});
});
};

/* 删除 */
function huiaddress(data){

layui.use([ 'form', 'layer', 'laypage', 'laydate','table' ],function() {
	var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate, table=layui.table;

		$.ajax({
					url : "/address/admin/recoverAddress",
					type : "post",
					data : {
						"pkAddressId" : data.pkAddressId
					},
					dataType : "json",
					success : function(data) {
						if (data == 1) {
							layer.msg("恢复成功");// 提示成功操作消息
							table.reload("newsListTable");
						} else if (data == 0) {
							alert("恢复失败")
						}
					}
				});
});
};

