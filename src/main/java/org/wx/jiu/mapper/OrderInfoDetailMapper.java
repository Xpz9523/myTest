package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.OrderInfo;
import org.wx.jiu.domain.OrderInfoDetail;
@Mapper
public interface OrderInfoDetailMapper extends BaseMapper<OrderInfoDetail> {
	/**********
	 * 模糊查询及分页显示
	 * Ht
	 * @return
	 */
	public List<OrderInfoDetail> selectAllOrderInfoAdminMohu(String orderinfoid);
	
}