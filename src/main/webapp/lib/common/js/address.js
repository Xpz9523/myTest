layui
		.use(
				[ 'form', 'layer', 'laypage', 'laydate', 'table' ],
				function() {
					var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate, table = layui.table;

					// 列表
					var tableIns = table.render({
						elem : '#addressList',
						url : '/address/admin/selectAddress',
						cellMinWidth : 95,
						page : true,
						height : "full-125",
						limit : 10,
						limits : [ 10, 15, 20, 25 ],
						id : "newsListTable",
						cols : [ [
						/* {type: "checkbox", fixed:"left", width:50}, */
						{
							type : "numbers",fixed : "left",width : 100},
							{field : 'personName',title : '收货人姓名',width : 150},
							{field : 'personPhone',title : '收货人电话',align : 'center',width : 150},
							{field : 'sheng',title : '省',align : 'center',width : 100}, 
							{field : 'shengCode',title : '省编码',align : 'center',width : 100},
							{field : 'city',title : ' 市',align : 'center',width : 100}, 
							{field : 'cityCode',title : ' 市编码',align : 'center',width : 100}, 
							{field : 'area',title : ' 区域',align : 'center',width : 150}, 
							{field : 'areaCode',title : ' 区域编码',align : 'center',width : 150}, 
							{field : 'detailAddress',title : ' 详细地址',align : 'center',width : 300},
							{field : 'isDefault',title : ' 是否默认地址',align : 'center',width : 120,toolbar : '#addressListBar2'}, 
							{title : '操作',width : 170,toolbar : '#addressListBar',fixed : "right",align : "center"} ] ]});
					// 模糊搜索
					var $ = layui.$, active = {
						reload : function() {
							// 赋值
							var selectMy = $("#selectMy").val();
							// 执行重载
							table.reload('newsListTable', {
								page : {
									curr : 1
								// 重新从第 1 页开始
								},
								where : {
									receivePersonName : selectMy || null
								}

							});
						}
					};
					$('.demoTable .layui-btn').on('click', function() {
						var type = $(this).data('type');
						active[type] ? active[type].call(this) : '';
					});
					// 列表操作
					table.on('tool(addressList)', function(obj) {
						var data = obj.data; // 获得当前行数据
						var layEvent = obj.event; // 获得 lay-event 对应的值（也可以是表头的
													// event 参数对应的值）
						var tr = obj.tr; // 获得当前行 tr 的DOM对象
						if (layEvent === 'del') { // 删除
							layer.confirm('确定删除此数据吗？', {
								icon : 3,
								title : '提示信息'
							}, function(index) {
								deleteAddress(data);
								layer.close(index);
							});
						} else if (layEvent == 'hui') {
							layer.confirm('确定恢复此数据吗？', {
								icon : 3,
								title : '提示信息'
							}, function(index) {
								huiaddress(data);
								layer.close(index);
							});

						} else if (layEvent == 'edit') {

							editAddress(data);
							/* layer.close(index); */

						}
					});

				})

/* 删除 */
function deleteAddress(data) {

	layui.use([ 'form', 'layer', 'laypage', 'laydate', 'table' ],
					function() {
						var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate, table = layui.table;

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

/* 恢复 */
function huiaddress(data) {

	layui.use([ 'form', 'layer', 'laypage', 'laydate', 'table' ],
					function() {
						var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate, table = layui.table;

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

// 弹出层修改
function editAddress(data) {

	document.getElementById("pkAddressId").value = data.pkAddressId;
	document.getElementById("personName").value = data.personName; // 名字
	document.getElementById("personPhone").value = data.personPhone;// 电话
	document.getElementById("shengCode").value = data.shengCode;// 省份编码
	document.getElementById("cityCode").value = data.cityCode;// 市区编码
	document.getElementById("area").value = data.area; // 区域
	document.getElementById("areaCode").value = data.areaCode;
	document.getElementById("detailAddress").value = data.detailAddress;

	layui.use([ 'form', 'layer', 'laypage', 'laydate' ],function() {
						var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
						layer.open({
							title : '<b>修改</b>',
							skin : 'layui-layer-molv',
							type : 1,
							content : $('#updateForm'),
							shadeClose : true, // 点击遮罩关闭层

							anim : 4,
							area : [ '700px', '650px' ]
						});
					});

}

/* 修改  */
	function UpdateAddress() {
		layui.use([ 'form', 'layer', 'laypage', 'laydate' ],function() {
			var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
			 	var pkAddressId = $("#pkAddressId").val();
				var personName = $("#personName").val();
				var personPhone = $("#personPhone").val();
				 var sheng=$("#sheng  option:selected").val();
				 var shengCode = $("#shengCode").val();
				 var city=$("#city  option:selected").val();
				 var cityCode = $("#cityCode").val();
				 var area = $("#area").val();
				 var areaCode = $("#areaCode").val();
				 var updatetime = $("#updatetime").val();
				 var detailAddress = $("#detailAddress").val();
				 
				
		$.ajax({
			url : "/address/admin/updateAdreess",
			type : "post",
			data : {
				"pkAddressId":pkAddressId,
				"personName":personName,
				"personPhone":personPhone,
				"sheng":sheng,
				"shengCode":shengCode,
				"city":city,
				"cityCode":cityCode,
				"area":area,
				"areaCode":areaCode,
				"updatetime":updatetime,
				"detailAddress":detailAddress
				
			},
			dataType : "json",
			success : function(data) {
				if (data == 1) {
					alert("修改成功");
					table.reload("newsListTable");
				} else if (data== 0) {
					alert("修改失败");
					table.reload("newsListTable");
				}
			}
		});
		});

};


