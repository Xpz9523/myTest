package org.wx.jiu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.GoodTypeBig;
import org.wx.jiu.mapper.GoodTypeBigMapper;
import org.wx.jiu.service.GoodTypeBigService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class GoodTypeBigServiceImpl extends BaseServiceImpl<GoodTypeBig> implements GoodTypeBigService {
	
	/**
	 * 查询所有商品大类型且状态是未删除状态的
	 * 作者:Xpz
	 */
	public PageInfo<GoodTypeBig> selectAllGoodTypeBig(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		List<GoodTypeBig> list = goodTypeBigMapper.selectBigAll();
		PageInfo<GoodTypeBig> page = new PageInfo<>(list);
		return page;
	}
	/**
	 * 逻辑删除商品大类型
	 * 作者:Xpz
	 */
	public void deleteBigGoodType(Integer pkTypeBigId) {
		goodTypeBigMapper.deleteBigGoodType(pkTypeBigId);
	}
	/**
	 * 根据id查询一个商品大种类
	 * 作者：Xpz
	 */
	@Override
	public GoodTypeBig getGoodTypeBigById(Integer pkTypeBigId) {
		
		return goodTypeBigMapper.getGoodTypeBigById(pkTypeBigId);
	}
	/**
	 * 判断一个商品大类型是否存在
	 * 作者：Xpz
	 */
	@Override
	public int getGoodTypeBigByName(String typeBigName) {
	
		return goodTypeBigMapper.getGoodTypeBigByName(typeBigName);
	}
	/**
	 * 查询所有状态为未删除的商品大类型且以List集合返回
	 * 作者：Xpz
	 */
	@Override
	public List<GoodTypeBig> getAllBigGoodType() {
		
		return goodTypeBigMapper.selectBigAll();
	}

		
}
