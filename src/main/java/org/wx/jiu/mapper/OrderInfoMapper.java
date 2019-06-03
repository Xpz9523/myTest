package org.wx.jiu.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.OrderInfo;

import com.github.pagehelper.PageInfo;
@Mapper
public interface OrderInfoMapper extends BaseMapper<OrderInfo> {
	
	/*********
	 * 分页显示订单及其相关信息
	 * Ht
	 * @return
	 */
	public List<OrderInfo> selectAllOrderAndOther();
	/**********
	 * 模糊查询及分页显示
	 * Ht
	 * @return
	 */
	public List<OrderInfo> selectAllOrderAndOtherMohu(String orderid);
	/*************
	 * 查询订单恢复
	 * Ht
	 * @return
	 */
	public List<OrderInfo> selectOrderByDelete();
	/**********
	 * 逻辑删除
	 * Ht
	 * @param orderid
	 * @return
	 */
	public Integer deleteByIsdelete(String orderid);
	/***********
	 * 恢复操作
	 * Ht
	 * @param orderid
	 * @return
	 */
	public Integer updateByIsdeleteToHuiFu(String orderid);
	/**********
	 * 发货操作
	 * Ht
	 * @param orderid
	 * @return
	 */
	public Integer updateByState(String orderid);
}