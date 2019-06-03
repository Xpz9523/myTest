package org.wx.jiu.service;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.OrderInfo;
import org.wx.jiu.domain.OrderInfoDetail;

import com.github.pagehelper.PageInfo;
/**************
 * 订单详情
 * @author Ht
 *
 */
public interface OrderInfoDetailService extends BaseService<OrderInfoDetail>{
	/***********
	 * 根据订单号模糊查询，并分页显示
	 * Ht
	 * @param pageNum
	 * @param pageSize
	 * @param orderid
	 * @return
	 */
	PageInfo<OrderInfoDetail> selectAllOrderInfoMohu(int pageNum,int pageSize,String orderinfoid);
}
