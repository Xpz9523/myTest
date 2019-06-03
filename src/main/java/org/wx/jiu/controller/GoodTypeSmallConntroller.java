package org.wx.jiu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.domain.GoodTypeBig;
import org.wx.jiu.domain.GoodTypeSmall;
import org.wx.jiu.domain.Size;

import com.github.pagehelper.PageInfo;

@Controller
public class GoodTypeSmallConntroller extends BaseController {

	/**
	 * 显示所有小商品类型
	 * 作者：Xpz
	 */
	@RequestMapping("/admin/Small/listGoodTypes")
	public String listGoodTypes(){
		return "admin/goodtype/listsmallgoodtype";
		
	}
	
	@RequestMapping("/admin/Small/selectAllGoodTypes")
	@ResponseBody
	public PageInfo<GoodTypeSmall> selectAllGoodTypes(Integer pageNum,@RequestParam(value="pageSize",required=false,defaultValue="5")Integer pageSize){
		PageInfo<GoodTypeSmall> page =goodTypeSmallService.selectAllGoodTypeSmall(pageNum, pageSize);
			return page;
		
	}
	/**
	 * 逻辑删除商品小类型
	 * 作者：Xpz
	 */
	@RequestMapping("/admin/Small/deleteBigGoodType")
	@ResponseBody
	public Map<String, Object> deleteBigGoodType(Integer bid){
		Map<String, Object> jsonMap = new HashMap<>();
		try {
			GoodTypeSmall gi = new GoodTypeSmall();
			gi.setPkTypeSmallId(bid);
			gi.setIsDelete(0);
			goodTypeSmallService.updateNoNull(gi);
			jsonMap.put("status", 200);
			jsonMap.put("message", "删除成功");
		} catch (Exception e) {
			jsonMap.put("status", 500);
			jsonMap.put("message", e.getMessage());
		}
		return jsonMap;
		
	}
	/**
	 * 添加一个小商品类型
	 * ：Xpz
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/Small/addSmallGoodTypes")
	@ResponseBody
	public Map<String,  Object> addSamllGoodTypes(GoodTypeSmall model){
		Map<String, Object> jsonMap = new HashMap<>();
		System.out.println(model.toString());
		int i = goodTypeSmallService.getGoodTypeSmallByName(model.getTypeSmallName());
		if(i>0){
				jsonMap.put("status", 500);
				jsonMap.put("message","该类型已存在" );
				
			}else{
				System.out.println("=============");
				goodTypeSmallService.saveNoNull(model);
				jsonMap.put("status", 200);
				jsonMap.put("message", "添加成功");
			}
			
			
			
		return jsonMap;
		
	}
	/**
	 * 跳转到小商品修改页面
	 * 作者：Xpz
	 * @return
	 */
	@RequestMapping("/admin/small/updatesmallType")
	public String updateSamllGoodType(Integer pkTypeSmallId,Model model){
		GoodTypeSmall gs = goodTypeSmallService.getGoodTypeSmallByid(pkTypeSmallId);
	 List<GoodTypeBig> bg=	goodTypeBigService.getAllBigGoodType();
		model.addAttribute("GoodTypeSmall",gs);
		model.addAttribute("bg",bg);
		return "admin/goodtype/updatesamlltype";
		
	}
	@RequestMapping("/admin/small/updateGoodType")
	@ResponseBody
	public String updateSamllGoodTypes(GoodTypeSmall model ){
		goodTypeSmallService.updateNoNull(model);
		return "admin/goodtype/listsmallgoodtype";
		
	}
	/**
	 * 得到所有规格父类
	 * @return
	 */
	@RequestMapping("/admin/small/getAllBigGoodType")
	@ResponseBody
	public Map<String, Object> getAllSize(){
		Map<String, Object> jsonMap = new HashMap<>();
		List<GoodTypeBig> list = 	goodTypeBigService.getAllBigGoodType();
		jsonMap.put("list", list);
		return jsonMap;
		
	}
}
