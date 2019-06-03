package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.Good;

@Mapper
public interface GoodMapper extends BaseMapper<Good> {

	/**
	 * @time 2018年3月12日 11:57:06
	 * @author GG
	 * @作用 查询商品对应的类型
	 */
	List<Good> selectGoodAndType();

	/**
	 * @time 2018年3月15日 15:14:22
	 * @author GG
	 * @作用 查询已被删除的商品
	 */
	List<Good> selectGoodAndTypeIsDelete();
	
	/**
	 * @time 2018年3月13日 11:35:18
	 * @author GG
	 * @作用 根据主键删除商品信息（逻辑删除）
	 */
	//int delGoodByPKGoodId(int pkGoodId);
	
	/**
	 * @time 2018年3月13日 14:57:50
	 * @author GG
	 * @作用 根据销量排行
	 */
	List<Good> selectGoodByGoodSaleNum();
	
	/**
	 * @time 2018年3月13日 14:57:50
	 * @author GG
	 * @作用 根据收藏数量排行
	 */
	List<Good> selectGoodByGoodConllectionNum();
	
	
	
	/**
	 * @time 2018年3月13日 14:57:50
	 * @author 
	 * @作用百度无刷新
	 */
	List<Good> selectGoodByrefresh( String keyword);
 }