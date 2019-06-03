package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.GoodTypeBig;
@Mapper
public interface GoodTypeBigMapper extends BaseMapper<GoodTypeBig> {
	/**
	 * 查询所有商品大类型且状态是未删除状态的
	 * 作者:Xpz
	 */
	List<GoodTypeBig> selectBigAll();
	
	/**
	 * 逻辑删除商品大类型
	 * 作者:Xpz
	 */
	void deleteBigGoodType(Integer pkTypeBigId);
	/**
	 * 根据id查询一个商品大类型
	 * 作者：Xpz
	 */
	GoodTypeBig getGoodTypeBigById(Integer pkTypeBigId );
	
	int getGoodTypeBigByName(String typeBigName);
}