package org.wx.jiu.service;

import java.util.Date;
import java.util.List;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.OrderInfo;
/*************
 * 订单
 * @author HT
 *
 */

import com.github.pagehelper.PageInfo;
public interface OrderInfoService extends BaseService<OrderInfo>{

	/*************
	 * 查询订单及其它，并分页显示所有
	 * Ht
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	PageInfo<OrderInfo> selectAllOrderAndOther(int pageNum,int pageSize);
	/***********
	 * 根据订单号模糊查询，并分页显示
	 * Ht
	 * @param pageNum
	 * @param pageSize
	 * @param orderid
	 * @return
	 */
	PageInfo<OrderInfo> selectAllOrderAndOtherMohu(int pageNum,int pageSize,String orderid);
	/*************
	 * 查询需要恢复的订单，并分页显示
	 * Ht
	 * @return
	 */
	PageInfo<OrderInfo> selectOrderByDelete(int pageNum,int pageSize);
	/**********
	 * 逻辑删除，并更新时间
	 * Ht
	 * @param orderid
	 * @param updateTime
	 * @return
	 */
	Integer deleteByIsdelete(String orderid);
	/*********
	 * 恢复操作
	 * Ht
	 * @param orderid
	 * @return
	 */
	Integer updateByIsdeleteToHuiFu(String orderid);
	/*********
	 * 发货操作
	 * Ht
	 * @param orderid
	 * @return
	 */
	Integer updateByState(String orderid);
}
