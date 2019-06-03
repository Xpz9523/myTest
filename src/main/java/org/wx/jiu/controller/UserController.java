package org.wx.jiu.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.common.BaseService;
import org.wx.jiu.common.JsonResult;
import org.wx.jiu.domain.Good;
import org.wx.jiu.domain.OrderInfo;
import org.wx.jiu.domain.User;
import org.wx.jiu.domain.UserLevel;
import org.wx.jiu.mapper.UserMapper;
import org.wx.jiu.service.UserService;
import org.wx.jiu.util.SendSms;
import org.wx.jiu.util.SmsUnit;

import com.github.pagehelper.PageInfo;

@Controller
public class UserController extends BaseController {

	/***************
	 * 跳转到前台登录页面 Ht
	 * 
	 * @return
	 */
	@RequestMapping("/Wine/login")
	public String viewLogin() {
		return "view/user/login";
	}

	/**
	 * @author Ht
	 * @time 2018年3月19日 11:44:30
	 * @return 跳转到前台查看信息
	 */
	@RequestMapping("/Wine/Info")
	public String toInfo(String name, String password, HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("user")!=null) {
			Object o=request.getSession().getAttribute("user");
			//session.setAttribute("user", "user");
			User user2=(User)o;
			OrderInfo info0 = new OrderInfo();
			info0.setFkUserId(userService.selectUserAndLevel(user2.getLoginName()).getPkUserId());
			info0.setOrderInfoState(0);
			request.setAttribute("order0", orderInfoService.queryParamList(info0).size());
			// 待发货时
			OrderInfo info2 = new OrderInfo();
			info2.setFkUserId(userService.selectUserAndLevel(user2.getLoginName()).getPkUserId());
			info2.setOrderInfoState(2);
			request.setAttribute("order2", orderInfoService.queryParamList(info2).size());
			// 代收货时
			OrderInfo info3 = new OrderInfo();
			info3.setFkUserId(userService.selectUserAndLevel(user2.getLoginName()).getPkUserId());
			info3.setOrderInfoState(3);
			request.setAttribute("order3", orderInfoService.queryParamList(info3).size());
			// 代评价时
			OrderInfo info4 = new OrderInfo();
			info4.setFkUserId(userService.selectUserAndLevel(user2.getLoginName()).getPkUserId());
			info4.setOrderInfoState(4);
			request.setAttribute("order4", orderInfoService.queryParamList(info4).size());
			return "view/user/userInfo";
		}
		User u = userService.viewLogin(name, password);
/*		User u = userService.login(name, password);*/
		if (u != null) {
			session.setAttribute("user", userService.selectUserAndLevel(name)); // 登录成功存入session
			// 当待付款时
			OrderInfo info0 = new OrderInfo();
			info0.setFkUserId(userService.selectUserAndLevel(name).getPkUserId());
			info0.setOrderInfoState(0);
			request.setAttribute("order0", orderInfoService.queryParamList(info0).size());
			// 待发货时
			OrderInfo info2 = new OrderInfo();
			info2.setFkUserId(userService.selectUserAndLevel(name).getPkUserId());
			info2.setOrderInfoState(2);
			request.setAttribute("order2", orderInfoService.queryParamList(info2).size());
			// 代收货时
			OrderInfo info3 = new OrderInfo();
			info3.setFkUserId(userService.selectUserAndLevel(name).getPkUserId());
			info3.setOrderInfoState(3);
			request.setAttribute("order3", orderInfoService.queryParamList(info3).size());
			// 代评价时
			OrderInfo info4 = new OrderInfo();
			info4.setFkUserId(userService.selectUserAndLevel(name).getPkUserId());
			info4.setOrderInfoState(4);
			request.setAttribute("order4", orderInfoService.queryParamList(info4).size());
			return "view/user/userInfo";
		}
		return "view/user/login";
	}

	/***********
	 * 跳转到用户注册界面 Ht
	 * 
	 * @return
	 */
	@RequestMapping("/Wine/toregister")
	public String toregister() {
		return "view/user/register";
	}

	/*******
	 * 注册验证确认手机号是否重复 Ht
	 * 
	 * @return
	 */
	@RequestMapping("/Wine/yanz")
	@ResponseBody
	public Integer yanZ(String phone) {
		User u = userService.getHeadImg(phone);
		Integer i = 1;
		if (u == null) {
			i = 0;// 可以注册
		}
		return i;
	}

	/************
	 * 发送手机验证码 Ht
	 * 
	 * @return
	 */
	@RequestMapping("/Wine/sendPhone")
	@ResponseBody
	public Map<String, Object> sendPhone(String phone) {
		System.out.println(phone);
		/*
		 * String phoneyan = String.valueOf(new
		 * Random().nextInt(899999)+100000);//生成短信验证码 String phoneContent =
		 * "您的注册验证码为:"+phoneyan+"请勿泄露您的验证码。"+"【今朝有酒】"; SendSms sms = new
		 * SendSms(); sms.sendSms(phone,phoneContent);
		 */
		Map<String, Object> map = new HashMap<>();
		Integer i =0;
		String phoneyan = String.valueOf(new Random().nextInt(899999)+100000);//生成短信验证码
		String phoneContent = "您的注册验证码为:"+phoneyan+"请勿泄露您的验证码。"+"【今朝有酒】";
		SendSms sms = new SendSms();
		sms.sendSms(phone, phoneContent);
		System.out.println(phoneyan);
		map.put("i", i);
		map.put("phoneyan", phoneyan);
		return map;
	}

	/***************
	 * 新用户注册 Ht
	 * 
	 * @return
	 */
	@RequestMapping("/Wine/registerUser")
	public String registerUser(String phone, String pwd) {
		User u = new User();
		u.setLoginName(phone);
		u.setUserName(phone);
		u.setLoginPwd(pwd);
		u.setUserPhone(phone);
		u.setFkUserLevelId(1);
		u.setUserHeadimg("lib/common/img/login/03.jpg");
		u.setIsAdmin(0);
		userService.saveNoNull(u);
		return "view/user/login";
	}

	/**
	 * @author GG
	 * @param 2018年3月21日
	 *            09:17:24
	 * @return 跳转到前台修改密码的界面
	 */
	@RequestMapping("/Wine/view/toPassword/{pkUserId}")
	public String toUpPwd(@PathVariable(value = "pkUserId", required = false) Integer pkUserId, HttpSession session) {
		session.setAttribute("pkUserId", pkUserId);
		return "view/user/password";
	}

	/**
	 * @author GG
	 * @param 2018年3月22日
	 *            13:11:44
	 * @return 跳转到前台修改用户信息的界面
	 */
	@RequestMapping("/Wine/view/toInfo/{pkUserId}")
	public String toUpInfo(@PathVariable(value = "pkUserId", required = false) Integer pkUserId, HttpSession session) {
		System.err.println(userService.queryById(pkUserId).getUserBirthday());
		session.setAttribute("user", userService.queryById(pkUserId));
		return "view/user/upInfo";
	}

	/**
	 * @author GG
	 * @param 2018年3月22日
	 *            14:40:22
	 * @return 接受修改的数据
	 */
	@RequestMapping("/Wine/view/upInfo")
	@ResponseBody
	public String upInfo(User user, HttpSession session) {
		JsonResult<User> jsonResult = new JsonResult<>(500, "系统错误，请重试！");
		if (userService.updateNoNull(user) > 0) {
			jsonResult.setCode(200);
			jsonResult.setMsg("修改成功");
		}
		return responseAPI.getJsonString(jsonResult);
	}

	/***********
	 * 跳转到前台首页 wyd
	 * 
	 * @return
	 */

	@RequestMapping("/Wine/ind")
	public String toindex() {
		return "view/index/index";
	}

	/**
	 * @author GG
	 * @param 2018年3月21日
	 *            09:17:24
	 * @retur 前台判断原密码是否正确
	 */
	@RequestMapping("/Wine/view/upPwd")
	@ResponseBody
	public String isPwd(Integer pkUserId, String oldPwd, String newPwd) {
		JsonResult<User> jsonResult = new JsonResult<>(500, "原密码错误，请重试！");
		if (userService.queryById(pkUserId).getLoginPwd().equals(oldPwd)) {
			User user = new User();
			user.setPkUserId(pkUserId);
			user.setLoginPwd(newPwd);
			if (userService.updateNoNull(user) > 0) {
				System.err.println("新密码为：" + user.getLoginPwd());
				jsonResult.setCode(200);
				jsonResult.setMsg("修改成功");
			} else {
				jsonResult.setCode(50);
				jsonResult.setMsg("系统错误，请稍后再试！");
			}
		}
		return responseAPI.getJsonString(jsonResult);
	}

	/**
	 * @author GG
	 * @param 2018年3月21日
	 *            09:17:24
	 * @retur 前台修改密码
	 *//*
		 * @RequestMapping("/Wine/view/upPwd")
		 * 
		 * @ResponseBody public String upPwd(Integer pkUserId,String newPwd){
		 * JsonResult<User> jsonResult = new JsonResult<>(500, "添加失败"); User
		 * user=new User(); user.setPkUserId(pkUserId);
		 * user.setLoginPwd(newPwd); if(userService.updateNoNull(user)>0){
		 * System.err.println("新密码为："+user.getLoginPwd());
		 * jsonResult.setCode(200); jsonResult.setMsg("修改成功"); } return
		 * responseAPI.getJsonString(jsonResult); }
		 */
	/**
	 * @author GG
	 * @param 2018年3月21日
	 *            09:17:24
	 * @return 前台退出帐号
	 */
	@RequestMapping("/Wine/exit")
	public String toExit(HttpSession session) {
		session.removeAttribute("loginName");
		return "view/user/login";
	}

	// 去后台登录页面
	@RequestMapping("/Wine/manage/tologin")
	public String toIndex(HttpServletRequest request) {
		request.setAttribute("list", userService.queryAllList());
		return "admin/user/login";
	}

	// 用户登录
	@RequestMapping("/manage/login")
	public String login(String loginName, String loginPwd, User user, HttpSession session) {
		System.err.println(loginName + "========" + loginPwd);
		User u = userService.login(loginName, loginPwd);
		if (u != null) {
			System.err.println("======登录成功========");
			session.setAttribute("u", u);
			System.out.println(u);
			session.setAttribute("loginName", loginName);
			return "admin/index";
		}
		return "admin/user/login";
	}

	// 登录时加载用户头像
	@RequestMapping("/user/getHeadImg")
	@ResponseBody
	public Map<String, Object> getHeadImg(String loginName) {
		System.err.println("loginName：" + loginName);
		Map<String, Object> map = new HashMap<>();
		User u = userService.getHeadImg(loginName);
		String headImgPath = u.getUserHeadimg();
		if (headImgPath != null && headImgPath != "") {
			System.err.println("------------------" + headImgPath);
			map.put("msg", headImgPath);
		} else {
			map.put("msg", "");
		}
		return map;
	}

	// 去用户等级页面
	@RequestMapping("/admin/userlevel/tolevelpage")
	public String tolevelpage() {
		return "admin/user/userlevel";
	}

	// 去用户管理页面
	@RequestMapping("/admin/user/touserpage")
	public String touserpage() {
		return "admin/user/useradmin";
	}

	// 遍历所有用户
	@RequestMapping("/admin/user/listUser")
	@ResponseBody
	public Map<String, Object> listUser(Integer pageNum, Integer pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> page = userService.selectAllUser(pageNum, pageSize);
		map.put("code", 0);
		map.put("msg", "success");
		map.put("count", page.size());
		map.put("data", page);
		return map;
	}

	// 用户逻辑删除
	@RequestMapping("/admin/user/confirmDel")
	@ResponseBody
	public Map<String, Object> confirmDel(Integer pkUserId) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			userService.delUserById(pkUserId);
			map.put("msg", "");
		} catch (Exception e) {
			map.put("msg", "");
		}
		return map;
	}

	// 用户头像上传
	@RequestMapping("/admin/user/uploadHeadImg")
	@ResponseBody
	public Map<String, Object> uploadHeadImg(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		System.out.println("------进入文件上传-------");
		InputStream in = null;
		OutputStream out = null;
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();
		if (file != null) {
			String uploadPath = request.getServletContext().getRealPath("/lib/common/img/login/");
			File uploadfile = new File(uploadPath);
			if (!uploadfile.exists()) {
				uploadfile.mkdirs();// 如果不存在就创建新的文件目录
			}
			System.out.println("文件路径为:--------" + uploadPath);
			String newfileName = getNewFileName(file.getOriginalFilename());
			try {
				// 获得文件输入流
				in = file.getInputStream();
				// 根据上传文件路径与新文件名创建输入流
				out = new FileOutputStream(new File(uploadfile, newfileName));
				IOUtils.copy(in, out);// IO操作
				map.put("code", 0);
				map.put("msg", "文件上传成功");
				map.put("data", map2);
				map2.put("src", "../../lib/common/img/login/" + newfileName);
				map2.put("title", "图片丢失");
				in.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	// 上传头像是获取新文件名
	private static String getNewFileName(String fileName) {
		String newfileName = "";
		if (fileName != null) {
			String extion = fileName.substring(fileName.lastIndexOf("."));
			newfileName = UUID.randomUUID().toString() + extion;
		}
		return newfileName;
	}

	// 用户确认添加
	@RequestMapping("/admin/user/confirmAdd")
	@ResponseBody
	public Map<String, Object> confirmAdd(String userHeadimg, String loginName, String userName, Integer userSex,
			String userEmail, Integer userAge, String userPhone, Date userBirthday) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = new User();
		user.setIsAdmin(1);
		user.setIsDelete(1);
		user.setLoginName(loginName);
		user.setFkUserLevelId(1);
		user.setLoginPwd("123");
		user.setUserAge(userAge);
		user.setUserBirthday(userBirthday);
		user.setUserEmail(userEmail);
		user.setUserHeadimg(userHeadimg);
		user.setUserName(userName);
		user.setUserPhone(userPhone);
		user.setUserSex(userSex);

		Integer result = userService.saveNoNull(user);
		if (result > 0) {
			map.put("msg", "新建成功");
			return map;
		} else {
			map.put("msg", "新建失败");
		}
		return map;
	}

	// 编辑用户时回显信息
	@RequestMapping("admin/user/Edit")
	@ResponseBody
	public Map<String, Object> edit(Integer pkUserId) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			User user = userService.queryById(pkUserId);
			map.put("UserHeadimg", user.getUserHeadimg());
			map.put("LoginName", user.getLoginName());
			map.put("UserName", user.getUserName());
			map.put("UserAge", user.getUserAge());
			map.put("UserSex", user.getUserSex());
			map.put("UserPhone", user.getUserPhone());
			map.put("UserEmail", user.getUserEmail());
			map.put("UserBirthday", user.getUserBirthday());
		} catch (Exception e) {
			map.put("msg", "");
		}
		return map;
	}

	// 确认编辑用户
	@RequestMapping("/admin/user/confirmEdit")
	@ResponseBody
	public Map<String, Object> confirmEdit(String userHeadimg, String loginName, String userName, Integer userSex,
			String userEmail, Integer userAge, String userPhone, Date userBirthday, Integer pkUserId) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = new User();
		user.setPkUserId(pkUserId);
		user.setIsAdmin(1);
		user.setIsDelete(1);
		user.setLoginName(loginName);
		user.setFkUserLevelId(1);
		user.setLoginPwd("123");
		user.setUserAge(userAge);
		user.setUserBirthday(userBirthday);
		user.setUserEmail(userEmail);
		user.setUserHeadimg(userHeadimg);
		user.setUserName(userName);
		user.setUserPhone(userPhone);
		user.setUserSex(userSex);

		Integer result = userService.updateNoNull(user);
		if (result > 0) {
			map.put("msg", "修改成功");
			return map;
		} else {
			map.put("msg", "修改失败");
		}
		return map;
	}

}
