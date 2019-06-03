

$(function(){  
	load();
}); 
function load(){
	$.ajax({
		url :"/view/allGoodType", //查询大类的方法
		type : 'post',
		cache : false,
		dataType : 'json',
		success : function(json) {
			var list=json.data;
			$("#u1").empty();//清空 
			var count=0;
			$.each(list,function(index,goodType){
				count++;
				//var name=goodType.name;
				var id=goodType.pkTypeBigId;
				if(count==1){
					$("#u1").append("<li class='active' onclick='loadSmall("+goodType.pkTypeBigId+")' id='"+goodType.pkTypeBigId+"'>"+goodType.typeBigName+"</li>");//大类点击事件
				    loadSmall(id);//显示第一个大类的所有小类*/
				}else{
					$("#u1").append("<li class='' onclick='loadSmall("+goodType.pkTypeBigId+")'>"+goodType.typeBigName+"</li>");
				}

			})
		}, 
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			layer.closeAll('loading');
			layer.msg("网络异常!请刷新。。。")
		}
	});
} 

//点击大类显示对应小类的数据
function loadSmall(id){
	$.ajax({
		url:"/view/allGoodTypeById",  //查询小类的方法
		data:{"pkTypeBigId":id},
		type:'post',
		cache : false,//同步：意思是当有返回值以后才会进行后面的js程序。
		dataType : 'json',
		success : function(json) {
			var list=json.data;
			$("#u2").empty();//清空
			var count=0;
			$.each(list,function(index,good){
				count++;
				//var name=goods.name;
				//var id=goods.id;
				//var img = goods.img;
				$("#u2").append("<li class='w-3' onclick='loadGoods("+good.pkTypeSmallId+")'><img src='"+'/'+good.typeSmallImg+"'><span>"+good.typeSmallName+"</span></li>");
			})
		},error : function(XMLHttpRequest, textStatus, errorThrown) {
			layer.closeAll('loading');
			layer.msg("网络异常!请刷新。。。")
		}
	})
}
/*//点击任意小类跳转页面
function loadGoods(id){
	window.location.href=webPath+"/GoodsTypeController/goodList.jhtml?id="+id;
}*/