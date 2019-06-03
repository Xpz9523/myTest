package org.wx.jiu.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.OrderInfo;
import org.wx.jiu.mapper.OrderInfoMapper;
import org.wx.jiu.service.OrderInfoService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class OrderInfoServiceImpl extends BaseServiceImpl<OrderInfo> implements OrderInfoService{

	@Override
	public PageInfo<OrderInfo> selectAllOrderAndOther(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<OrderInfo> page = new PageInfo<>(orderInfoMapper.selectAllOrderAndOther()) ;
		return page;
	}

	@Override
	public PageInfo<OrderInfo> selectAllOrderAndOtherMohu(int pageNum, int pageSize, String orderid) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<OrderInfo> page = new PageInfo<>(orderInfoMapper.selectAllOrderAndOtherMohu(orderid));
		return page;
	}

	@Override
	public PageInfo<OrderInfo> selectOrderByDelete(int pageNum,int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<OrderInfo> page = new PageInfo<>(orderInfoMapper.selectOrderByDelete());
		return page;
	}

	@Override
	public Integer deleteByIsdelete(String orderid) {
		return orderInfoMapper.deleteByIsdelete(orderid);
	}

	@Override
	public Integer updateByIsdeleteToHuiFu(String orderid) {
		return orderInfoMapper.updateByIsdeleteToHuiFu(orderid);
	}

	@Override
	public Integer updateByState(String orderid) {
		return orderInfoMapper.updateByState(orderid);
	}

}
