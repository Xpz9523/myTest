package org.wx.jiu.common;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hamcrest.core.IsInstanceOf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.wx.jiu.exception.BusinessException;
import org.wx.jiu.service.*;
import org.wx.jiu.util.JsonResultUtil;
import org.wx.jiu.util.ReadPropertyPlaceholder;

public class BaseController {
	
	  @Resource 
	  protected ResponseAPI responseAPI;
	 
	/*
	 * @Resource protected ReadPropertyPlaceholder readPropertyPlaceholder;
	 */

	@Autowired
	protected AddressService addressService;

	@Autowired
	protected CarouselService carouselService;
	
	@Autowired
	protected CommentService CommentService;

	@Autowired
	protected GoodService goodService;

	@Autowired
	protected GoodTypeBigService goodTypeBigService;

	@Autowired
	protected GoodTypeSmallService goodTypeSmallService;

	@Autowired
	protected NewsService newsService;

	@Autowired
	protected OrderInfoDetailService orderInfoDetailService;

	@Autowired
	protected OrderInfoService orderInfoService;

	@Autowired
	protected ShopCarService shopCarService;

	@Autowired
	protected SizeDetailService sizeDetailService;

	@Autowired
	protected SizeService sizeService;

	@Autowired
	protected UserLevelService userLevelService;

	@Autowired
	protected UserService userService;

	public static final String SUCCESS = "success";
	public static final String ERROR = "error";
	public static final String ERRORCODE = "500";

	/**
	 * @功能: 所有的子类方法执行之前都要先执行此方法，子类方法不需要在model此方法中的参数 aop
	 * @作者: 柯栋 @代号:隐无为
	 * @param model
	 */
	/*
	 * @ModelAttribute public void init(Model model) {
	 * model.addAttribute("webPath",
	 * readPropertyPlaceholder.getProperty("sys.webPath"));
	 * model.addAttribute("imgPath",
	 * readPropertyPlaceholder.getProperty("sys.imgPath"));
	 * model.addAttribute("webRoot",
	 * readPropertyPlaceholder.getProperty("sys.webRoot")); }
	 */

	/**
	 * @功能: 异常统一捕获
	 * @作者: 柯栋 @代号:隐无为
	 * @时间: 2017年2月28日
	 */
	/*
	 * @ExceptionHandler
	 * 
	 * @ResponseBody public String exceptionProcess(HttpServletRequest request,
	 * HttpServletResponse response, RuntimeException ex) {
	 * 
	 * JsonResult<String> jsonReturnData = new JsonResult<String>(500, "系统出错");
	 * return responseAPI.getJsonString(jsonReturnData); }
	 */

	/***********************
	 * 处理统一异常
	 * 
	 * @param request
	 * @param response
	 * @param ex
	 * @return
	 */
	@ExceptionHandler(value = RuntimeException.class)
	@ResponseBody
	public JsonResult handleException(HttpServletRequest request, HttpServletResponse response, RuntimeException ex) {

		// 判断异常类型
		if (ex instanceof BusinessException) {
			return JsonResultUtil.error(ex.getMessage(), null);
		} else {
			JsonResult result = new JsonResult(-1, "系统异常");
			return result;
		}
	}
	/****************
	 * 时间日期统一处理
	 * 作者:ht
	 * @param binder
	 */
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));        
	}

}
