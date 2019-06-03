package org.wx.jiu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.domain.Address;
import org.wx.jiu.domain.ShopCar;
import org.wx.jiu.domain.User;

import com.github.pagehelper.PageInfo;

/**
 * PL
 * 购物车
 * @author Administrator
 *
 */
@Controller
public class CartController extends BaseController {

	Logger logger = Logger.getLogger(CartController.class);
	
	


	/******************
	 * 进入收收购车
	 * 作者:pl
	 * 
	 * 
	 * @return
	 */
	@RequestMapping("/admin/selectAllCart")
	public String selectAllselectAllCart(HttpServletRequest Request) {
		return "admin/shoppingCart/cart";
	}
	
	
	// 显示所有
	@RequestMapping("/admin/selectCart")
	@ResponseBody
	public Map<String, Object> selectCart(Address model, Integer page, Integer limit) {
		logger.info("=======进入selectCart=======");
		Map<String, Object> map = new HashMap<String, Object>();
		PageInfo<ShopCar> pageInfo = shopCarService.findAllAddressForPage(page, limit);
				//queryPageList(page, limit);
		logger.info("user："+pageInfo.getList());
		map.put("code", 0);
		map.put("msg", "success");
		map.put("count", pageInfo.getTotal());
		map.put("data", pageInfo.getList());
		return map;
	}
	
	/**
	 *同步进入购物车前台页面
	 *作者：Xpz
	 *2018年3月19日16:16:46 
	 */
	@RequestMapping("/view/car")
	public String listShopCar(Model model,HttpSession sion){
		User user = (User) sion.getAttribute("u");
		List<ShopCar> list = shopCarService.getAllCarByUserId(user.getPkUserId());
		model.addAttribute("list",list);
		double i = 0;
		for (ShopCar shopCar : list) {
			i= (shopCar.getNum()*shopCar.getPrice()+i);
		}
		System.out.println(i);
		return "view/shopCar/showcar";
		
	}
	/**
	 * 前台购物车加按钮根据购物车id数量减一
	 * 作者：Xpz
	 * 时间
	 */
	@RequestMapping("/car/subtract")
	@ResponseBody
	public ShopCar carNumsubtract(Integer pkShopCarId){
		System.out.println(pkShopCarId);
		ShopCar shopCar = shopCarService.queryById(pkShopCarId);
		int oldnum=shopCar.getNum();
		if(oldnum!=1){	
			shopCar.setNum(oldnum-1);
			Double oop=(double) Math.round(((oldnum-1)*shopCar.getPrice())*10)/10;
			shopCar.setCountMoney(oop);			
			shopCarService.updateNoNull(shopCar);
			}
		shopCar.setNum(oldnum);
		return shopCar;
	}
	// 添加方法
		@RequestMapping("/car/add")
		@ResponseBody
		public ShopCar add(Integer id) {
			ShopCar shopCar = shopCarService.queryById(id);
			shopCar.setNum(shopCar.getNum() + 1);
			//控制double型数据
			Double oop=(double) Math.round((shopCar.getNum()*shopCar.getPrice())*10)/10;
			shopCar.setCountMoney(oop);
			shopCarService.update(shopCar);
			return shopCar;
		}
	
/**
 * 前台购物车全选按钮
 * 作者:Xpz
 * 时间：2018-3-25 14:02:13
 */
	@RequestMapping("/car/commentprice")
	@ResponseBody
	public List<ShopCar> commentprice(HttpServletRequest request) {
		User user2 = (User) request.getSession().getAttribute("user");		
		List<ShopCar> list = shopCarService.getAllCarByUserId(user2.getPkUserId());		
		return list;
	}
	
	
	/**
	 * 前台首页进入自己购物车判断用户是否登录
	 * 作者：Xpz
	 * 2018-3-25 15:48:22
	 */
	@RequestMapping("/car/gomyCar")
	public String goMyCar(HttpSession sion,Model model){
		System.out.println("用户进入购物车");
		User user = (User) sion.getAttribute("user");
		if(user!=null){
			System.out.println("用户不为空");
			List<ShopCar> list = shopCarService.getAllCarByUserId(user.getPkUserId());
			model.addAttribute("list",list);
			double i = 0;
			for (ShopCar shopCar : list) {
				i= (shopCar.getNum()*shopCar.getPrice()+i);
			}
			System.out.println(i);
			return "view/shopCar/showcar";
		}else {
			System.out.println("用户为空");
			return "view/user/login";
		}
		
	}
	/**
	 * 前台商品勾选
	 * 作者：Xpz
	 * 2018-3-25 15:49:09
	 */
		@RequestMapping("/car/selectByid")
		@ResponseBody
		public Double selectByid(Integer id, Double price) {
			ShopCar hpShopCat = shopCarService.queryById(id);
			Double prices = (hpShopCat.getCountMoney()) + price;
			System.out.println(prices);
			return prices;
		}
		/**
		 * 前台购物车非勾选
		 * 作者：Xpz
		 * 2018-3-25 15:49:46
		 * 
		 */
		@RequestMapping("/car/selectByid2")
		@ResponseBody
		public Double selectByid2(Integer id, Double prices) {
			ShopCar hpShopCat = shopCarService.queryById(id);
			Double pricess = prices - (hpShopCat.getCountMoney());
			double b = Math.round(pricess * 10) / 10;
			return b;
		}
		//查询总价
		// 计算用户购物总价
		/**
		 * 前台购物车计算总价
		 * 作者：Xpz
		 * 	2018-3-25 15:50:41
		 */
		@RequestMapping("/car/test2")
		@ResponseBody
		public Double test2(Integer id) {
			ShopCar hpShopCat=shopCarService.queryById(id);
		  return hpShopCat.getCountMoney();
	  }
		
}
