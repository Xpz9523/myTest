package org.wx.jiu.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.GoodTypeBig;
import org.wx.jiu.domain.GoodTypeSmall;
import org.wx.jiu.service.GoodTypeSmallService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class GoodTypeSmallServiceImpl extends BaseServiceImpl<GoodTypeSmall> implements GoodTypeSmallService{
	/**
	 * 小类型显示所有
	 */
	@Override
	public PageInfo<GoodTypeSmall> selectAllGoodTypeSmall(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		List<GoodTypeSmall> list = goodTypeSmallMapper.selectSmallAll();
		PageInfo<GoodTypeSmall> page = new PageInfo<>(list);
		return page;
	}
	/**
	 * 小类型显示一个
	 */
	@Override
	public void deleteSmallGoodType(Integer pkTypeSmallId) {
		goodTypeSmallMapper.deleteGoodTypeSmallById(pkTypeSmallId);
		
	}
/**
 * 小类型根据ID得到一个
 */
	@Override
	public GoodTypeSmall getGoodTypeSmallByid(Integer pkTypeSmallId) {
		return goodTypeSmallMapper.getGoodTypeSmallById(pkTypeSmallId);
	}
	/**
	 * 查询类型存在
	 */
	@Override
	public int getGoodTypeSmallByName(String typeSmallName) {
		return goodTypeSmallMapper.getGoodTypeSmallByName(typeSmallName);
	}
	@Override
	public List<GoodTypeSmall> selectSmallAll() {
		// TODO Auto-generated method stub
		return goodTypeSmallMapper.selectSmallAll();
	}
	
	
	@Override
	public List<GoodTypeSmall> selectGoodTypeSmallList(Integer pkTypeBigId) {
		return 	goodTypeSmallMapper.selectGoodTypeSmallList( pkTypeBigId);
		
	}

}
