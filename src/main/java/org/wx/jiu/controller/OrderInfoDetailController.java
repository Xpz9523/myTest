package org.wx.jiu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.domain.OrderInfo;
import org.wx.jiu.domain.OrderInfoDetail;

import com.github.pagehelper.PageInfo;
/******************
 * 订单详细
 * @author HT
 *
 */
@Controller
public class OrderInfoDetailController extends BaseController{
	/**********
	 * 跳转到订单详细页面
	 * Ht
	 */
	@RequestMapping("/admin/OrderInfo/toOrderinfo")
	public String toOrderinfo(){
		return "admin/order/orderinfo";
	}
	/****************
	 * 分页显示所有订单详细
	 * @作者:Ht
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/OrderInfo/selectAllOrderInfoAdmin")
	@ResponseBody
	public PageInfo<OrderInfoDetail> selectgAllOrderAdmin(Integer pageNum,@RequestParam(value="pageSize",required=false,defaultValue="10") Integer pageSize){
		return orderInfoDetailService.queryPageList(pageNum, pageSize);
	}
	/*****************
	 * 订单详细编号模糊查询及分页显示
	 * @作者:Ht
	 */
	@RequestMapping("/admin/OrderInfo/selectAllOrderInfoAdminMohu")
	@ResponseBody
	public PageInfo<OrderInfoDetail> selectAllOrderInfoAdminMohu(Integer pageNum,@RequestParam(value="pageSize",required=false,defaultValue="10") Integer pageSize,String orderinfoid){
		return orderInfoDetailService.selectAllOrderInfoMohu(pageNum, pageSize, orderinfoid);
	}
	
	/**
	 * 
	 * GG
	 * 根据用户ID查询订单的界面
	 */
	@RequestMapping("/Wine/toOrderAll/{fkUserId}")
	public String toOrder(HttpServletRequest request,@PathVariable(value = "fkUserId", required = false) Integer fkUserId) {
		request.setAttribute("fkUserId", fkUserId);
		return "view/user/order-list";
	}
}
