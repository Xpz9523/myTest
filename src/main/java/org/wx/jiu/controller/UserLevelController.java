package org.wx.jiu.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.UserLevel;
import com.github.pagehelper.PageInfo;

@Controller
public class UserLevelController extends BaseController{
	
	
	//遍历用户等级
	@RequestMapping("/admin/userlevel/listUserLevel")
	@ResponseBody
	public Map<String,Object> listUserLevel(Integer pageNum, Integer pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
		List<UserLevel> page = userLevelService.selectAllUserLevel(pageNum, pageSize);
		map.put("code", 0);
		map.put("msg", "success");
		map.put("count", page.size());
		map.put("data", page);
		return map;
	}
	
	//确认添加用户等级
	@RequestMapping("/admin/userlevel/confirmAdd")
	@ResponseBody
	public Map<String,Object> confirmAdd(String userLevelName,String userLevelRemark){
		Map<String, Object> map = new HashMap<String, Object>();
		UserLevel userLevel = new UserLevel();
		userLevel.setUserLevelName(userLevelName);
		userLevel.setUserLevelRemark(userLevelRemark);
		Integer result = userLevelService.saveNoNull(userLevel);
		if(result>0) {
			map.put("msg", "新建成功");
			return map;
		}else {
			map.put("msg", "新建失败");
		}
		return map;
	}
	
	//逻辑删除用户等级
	@RequestMapping("/admin/userlevel/confirmDel")
	@ResponseBody
	public Map<String,Object> confirmDel(Integer pkUserLevelId){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			userLevelService.delUserLevelById(pkUserLevelId);
			map.put("msg", "");
		} catch (Exception e) {
			map.put("msg", "");
		}
		return map;
	}
	
	//编辑用户等级时回显等级信息
	@RequestMapping("/admin/userlevel/edit")
	@ResponseBody
	public Map<String,Object> edit(Integer pkUserLevelId){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			UserLevel userLevel = userLevelService.queryById(pkUserLevelId);
			map.put("LevelName", userLevel.getUserLevelName());
			map.put("LevelRemark", userLevel.getUserLevelRemark());
		} catch (Exception e) {
			map.put("msg", "");
		}
		return map;
	}
	
	//确认编辑用户等级
	@RequestMapping("/admin/userlevel/confirmEdit")
	@ResponseBody
	public Map<String,Object> confirmEdit(Integer pkUserLevelId,String userLevelName,String userLevelRemark){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			UserLevel userLevel = new UserLevel();
			userLevel.setPkUserLevelId(pkUserLevelId);
			userLevel.setUserLevelName(userLevelName);
			userLevel.setUserLevelRemark(userLevelRemark);
			Integer result = userLevelService.updateNoNull(userLevel);
			if(result>0) {
				map.put("msg", "");
				return map;
			}else {
				map.put("msg", "");
			}
			return map;
		} catch (Exception e) {
			map.put("msg", "");
		}
		return map;
	}
}
