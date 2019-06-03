package org.wx.jiu.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.domain.Address;
import org.wx.jiu.domain.Good;
import org.wx.jiu.domain.OrderInfo;
import org.wx.jiu.domain.OrderInfoDetail;
import org.wx.jiu.domain.User;
import org.wx.jiu.service.OrderInfoService;

import com.alibaba.druid.sql.visitor.functions.Now;
import com.github.pagehelper.PageInfo;
/******************
 * 订单
 * @author HT
 *
 */
@Controller
public class OrderInfoController extends BaseController{
	
	
	/*************
	 * 跳转到前台订单页面
	 * Ht
	 * @return
	 */
	/*@RequestMapping("/view/toorderInfo")
	public String toorderInfo(HttpSession session,Model model){
		User u = (User) session.getAttribute("user");
		Address address=addressService.selectOneAddressAllByIsDefault(u.getPkUserId());
		model.addAttribute("address", address);//前台拿去收货地址
		//--------------------------------------
		Good g = new Good();
		g.setPkGoodId(66);
		Good g1 = new Good();
		g1.setPkGoodId(67);
		Good g2= new Good();
		g2.setPkGoodId(68);
		List<Good> goodsList = new ArrayList<>();
		goodsList.add(0, g);
		goodsList.add(1, g1);
		goodsList.add(2, g2);
		List<OrderInfoDetail> orderList= new ArrayList<>();
		Integer i = 3;//比如有3个商品
		List<String> uuidList = new ArrayList<>();
		//将所有生成的UUID放到集合当中去,批量生成uuid
		for(Integer j = 0;j<i;j++){
			uuidList.add(j, UUID.randomUUID().toString().replace("-", ""));
		}
		//批量查询所有商品根据商品id
		List<Good> newsgoodsList = new ArrayList<>();
		for(Integer j = 0;j<i;j++){
			Good good = new Good();
			good=goodService.queryById(goodsList.get(j).getPkGoodId());
			newsgoodsList.add(j, good);
		}
		//批量添加订单详情
		OrderInfoDetail orderInfod = new OrderInfoDetail();
		for(Integer j = 0;j<i;j++){
			orderInfod.setPkOrderInfoDetailId(uuidList.get(j));
			orderInfod.setFkGoodId(newsgoodsList.get(j).getPkGoodId());
			orderInfod.setNum(4);
			orderInfod.setTitle(newsgoodsList.get(j).getGoodTitle());
			orderInfod.setPrice(newsgoodsList.get(j).getGoodPrice());
			orderInfod.setCountMoney(newsgoodsList.get(j).getGoodPrice()*3);
			orderInfod.setGoodImg(newsgoodsList.get(j).getGoodCoverImg());
			orderInfod.setSpecificationsInfo("浓香型52度375ml单瓶");
			orderInfoDetailService.saveNoNull(orderInfod);
		};
		//批量查询所有添加的商品详细，并且在页面上面显示出来
		List<OrderInfoDetail> orderInfoDet = new ArrayList<>();
		OrderInfoDetail orderInfo = new OrderInfoDetail();
		for(Integer j = 0;j<i;j++){			
			orderInfo=orderInfoDetailService.queryById(uuidList.get(j));
			orderInfoDet.add(j,orderInfo);
		};
		model.addAttribute("countprice","2800");
		model.addAttribute("orderInfo", orderInfoDet);
		return "view/order/orderinfo";
	}*/
	
	@RequestMapping("/view/zfbQr")
	public String viewZfbQr(String pay){
		System.out.println(pay);
		return "view/order/zfbQr";
	}
	
	
	/******************
	 * 跳转到订单管理
	 * @作者:Ht
	 * @return
	 */
	@RequestMapping("/admin/Order/toOrderAdmin")
	public String toOrderadmin() {
		return "admin/order/order";
	}
	/****************
	 * 分页显示所有订单
	 * @作者:Ht
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/Order/selectAllOrderAdmin")
	@ResponseBody
	public PageInfo<OrderInfo> selectgAllOrderAdmin(Integer pageNum,@RequestParam(value="pageSize",required=false,defaultValue="10") Integer pageSize){
		return orderInfoService.selectAllOrderAndOther(pageNum, pageSize);
	}
	/*****************
	 * 订单编号模糊查询及分页显示
	 * @作者:Ht
	 */
	@RequestMapping("/admin/Order/selectOrderAdminMohu")
	@ResponseBody
	public PageInfo<OrderInfo> selectOrderAdminMohu(Integer pageNum,@RequestParam(value="pageSize",required=false,defaultValue="10") Integer pageSize,String orderid){
		return orderInfoService.selectAllOrderAndOtherMohu(pageNum, pageSize, orderid);
	}
	/************
	 * 订单逻辑删除
	 * @作者:Ht
	 */
	@RequestMapping("/admin/Order/OrderInfo_delete")
	@ResponseBody
	public Integer OrderInfo_delete(String orderid){
		Integer a=orderInfoService.deleteByIsdelete(orderid);
		return a;
	}
	/**********
	 * 查询已经删除的订单，并分页显示，做恢复查询
	 * @作者:Ht
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/admin/Order/selectOrderByDelete")
	@ResponseBody
	public PageInfo<OrderInfo> selectOrderByDelete(Integer pageNum,@RequestParam(value="pageSize",required=false,defaultValue="10") Integer pageSize){
		return orderInfoService.selectOrderByDelete(pageNum, pageSize);
	}
	/**********
	 * 恢复已经删除的文件
	 * @作者:Ht
	 * @param orderid
	 * @return
	 */
	@RequestMapping("/admin/Order/huifuController")
	@ResponseBody
	public Integer huifuController(String orderid){
		Integer a=orderInfoService.updateByIsdeleteToHuiFu(orderid);
		return a;
	}
	/**********
	 * 修改状态
	 * Ht
	 * @param orderid
	 * @return
	 */
	@RequestMapping("/admin/Order/updatestate")
	@ResponseBody
	public Integer updatestate(String orderid){
		Integer a =orderInfoService.updateByState(orderid);
		return a;
	}
	
}
