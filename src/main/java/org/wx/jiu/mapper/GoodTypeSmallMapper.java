package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.GoodTypeBig;
import org.wx.jiu.domain.GoodTypeSmall;

@Mapper
public interface GoodTypeSmallMapper extends BaseMapper<GoodTypeSmall> {
	/**
	 * 查询所有商品xiao类型且状态是未删除状态的 作者:Xpz
	 */
	List<GoodTypeSmall> selectSmallAll();

	/**
	 * 逻辑删除商品xiao类型 作者:Xpz
	 */
	void deleteGoodTypeSmallById(Integer pkTypeSmallId);

	/**
	 * 根据id查询一个商品xiao类型 作者：Xpz
	 */
	GoodTypeSmall getGoodTypeSmallById(Integer pkTypeSmallId);

	int getGoodTypeSmallByName(String typeSmallName);
	
	/****
	 * 根据大类型ID 获取小类型所有的商品对象
	 * pl
	 * @return ：list
	 */
	List<GoodTypeSmall> selectGoodTypeSmallList(Integer pkTypeBigId);
	
}