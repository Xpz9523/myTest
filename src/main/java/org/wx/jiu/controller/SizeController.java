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
import org.wx.jiu.domain.GoodTypeSmall;
import org.wx.jiu.domain.Size;
import org.wx.jiu.service.SizeService;

import com.github.pagehelper.PageInfo;
@Controller
public class SizeController extends BaseController {
	@RequestMapping("/admin/Big/listsize")
	public String listGoodTypes(){
		return "admin/size/listsize";
		
	}
	/**
	 * 显示所有未删除的规格
	 * 作者：Xpz
	 */
	@RequestMapping("/admin/Big/selectAllSize")
	@ResponseBody
	public PageInfo<Size> selectAllGoodTypes(Integer pageNum,@RequestParam(value="pageSize",required=false,defaultValue="5")Integer pageSize){
		System.out.println("进入规格");
		PageInfo<Size> page =sizeService.selectAllSize(pageNum, pageSize);
			return page;
		
	}
	/**
	 * 逻辑删除商品大规格
	 * 作者：Xpz
	 */
	@RequestMapping("/admin/Big/deleteSize")
	@ResponseBody
	public Map<String, Object> deleteSize(Integer bid){
		Map<String, Object> jsonMap = new HashMap<>();
		Size si = new Size();
		si.setIsDelete(0);
		si.setPkSizeId(bid);
		try {
			sizeService.updateNoNull(si);
			jsonMap.put("status", 200);
			jsonMap.put("message", "删除成功");
		} catch (Exception e) {
			jsonMap.put("status", 500);
			jsonMap.put("message", e.getMessage());
		}
		return jsonMap;
		
	}
	/**
	 * 跳转到修改页面
	 * 作者:Xpz
	 */
	@RequestMapping("/admin/Big/updateSize")
	public String updateSize(Model model, Integer pkSizeId ){
		System.out.println(pkSizeId+"aaaaaa");
		Size si  = sizeService.getSizeById(pkSizeId);
		model.addAttribute("Size",si);
		return "admin/size/updatesize";
	}

	/**
	 * 修改数据提交到数据库
	 */
		@RequestMapping("/admin/Big/updateSizes")
		public String updateGoodType(Size model){
			sizeService.updateNoNull(model);
			return"admin/size/listsize";
		}

		/**
		 * 添加一个大商品类型
		 * 作者:Xpz
		 * 
		 */
		@RequestMapping("/admin/Big/addsize")
		@ResponseBody
		public Map<String,  Object> addBigGoodTypes(Size model){
			Map<String, Object> jsonMap = new HashMap<>();
			System.out.println(model.toString());
			int i = sizeService.getSizeByName(model.getSizeName());
			if(i>0){
					jsonMap.put("status", 500);
					jsonMap.put("message","该类型已存在" );
					
				}else{
					System.out.println("=============");
					sizeService.saveNoNull(model);
					jsonMap.put("status", 200);
					jsonMap.put("message", "添加成功");
				}
				
				
				
			return jsonMap;
			
		}
}
