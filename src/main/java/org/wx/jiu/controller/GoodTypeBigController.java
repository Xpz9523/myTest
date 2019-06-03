package org.wx.jiu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.domain.GoodTypeBig;

import com.github.pagehelper.PageInfo;
/**
 * 
 * @author 谢蘋泽
 *	商品类型
 */
@Controller
public class GoodTypeBigController extends BaseController {
		
	
	/**
	 * 显示所有商品类型
	 * 作者：Xpz
	 */
	@RequestMapping("/admin/Big/listGoodTypes")
	public String listGoodTypes(){
		return "admin/goodtype/listgoodtype";
		
	}
	/**
	 * 添加一个大商品类型
	 * 作者:Xpz
	 * 
	 */
	@RequestMapping("/admin/Big/addBigGoodTypes")
	@ResponseBody
	public Map<String,  Object> addBigGoodTypes(GoodTypeBig model){
		Map<String, Object> jsonMap = new HashMap<>();
		System.out.println(model.toString());
		int i = goodTypeBigService.getGoodTypeBigByName(model.getTypeBigName());
		if(i>0){
				jsonMap.put("status", 500);
				jsonMap.put("message","该类型已存在" );
				
			}else{
				System.out.println("=============");
				goodTypeBigService.saveNoNull(model);
				jsonMap.put("status", 200);
				jsonMap.put("message", "添加成功");
			}
			
			
			
		return jsonMap;
		
	}
	/**
	 * 异步显示商品类型
	 * 作者：Xpz
	 */
	@RequestMapping("/admin/Big/selectAllGoodTypes")
	@ResponseBody
	public PageInfo<GoodTypeBig> selectAllGoodTypes(Integer pageNum,@RequestParam(value="pageSize",required=false,defaultValue="5")Integer pageSize){
			PageInfo<GoodTypeBig> page = goodTypeBigService.selectAllGoodTypeBig(pageNum, pageSize);
			return page;
		
	}
	/**
	 * 跳转到修改页面
	 * 作者:Xpz
	 */
	@RequestMapping("/admin/Big/updateBigType")
	public String updateBigGoodTypes(Model model, Integer pkTypeBigId ){
		GoodTypeBig bigGoodType = goodTypeBigService.getGoodTypeBigById(pkTypeBigId);
		model.addAttribute("bigGoodType",bigGoodType);
		return "admin/goodtype/updatebigtype";
	}
	
	/**
	 * 修改数据提交到数据库
	 */
		@RequestMapping("/admin/Big/updateGoodType")
		public String updateGoodType(GoodTypeBig model){
			goodTypeBigService.updateNoNull(model);
			return"admin/goodtype/listgoodtype";
		}
	/**
	 * 逻辑删除商品大类型
	 * 作者：Xpz
	 */
	@RequestMapping("/admin/Big/deleteBigGoodType")
	@ResponseBody
	public Map<String, Object> deleteBigGoodType(Integer bid){
		Map<String, Object> jsonMap = new HashMap<>();
		try {
			goodTypeBigService.deleteBigGoodType(bid);
			jsonMap.put("status", 200);
			jsonMap.put("message", "删除成功");
		} catch (Exception e) {
			jsonMap.put("status", 500);
			jsonMap.put("message", e.getMessage());
		}
		return jsonMap;
		
	}
}
