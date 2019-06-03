package org.wx.jiu.service.impl;

import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.OrderInfoDetail;
import org.wx.jiu.service.OrderInfoDetailService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class OrderInfoDetailServiceImpl extends BaseServiceImpl<OrderInfoDetail> implements OrderInfoDetailService{

	@Override
	public PageInfo<OrderInfoDetail> selectAllOrderInfoMohu(int pageNum, int pageSize, String orderinfoid) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<OrderInfoDetail> page= new PageInfo<>(orderInfoDetailMapper.selectAllOrderInfoAdminMohu(orderinfoid));
		return page;
	}

}
