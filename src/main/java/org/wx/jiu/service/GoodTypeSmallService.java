package org.wx.jiu.service;

import java.util.List;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.GoodTypeSmall;

import com.github.pagehelper.PageInfo;

public interface GoodTypeSmallService extends BaseService<GoodTypeSmall> {

	public PageInfo<GoodTypeSmall> selectAllGoodTypeSmall(Integer pageNum, Integer pageSize);

	public void deleteSmallGoodType(Integer pkTypeSmallId);

	public GoodTypeSmall getGoodTypeSmallByid(Integer pkTypeSmallId);

	// a添加时查询类型是否存在
	public int getGoodTypeSmallByName(String typeSmallName);

	/**
	 * @author GG
	 * @return 查询所有
	 */
	List<GoodTypeSmall> selectSmallAll();

	
	/****
	 * 根据大类型ID 获取小类型所有的商品对象
	 * pl
	 * @return ：list
	 */
	List<GoodTypeSmall> selectGoodTypeSmallList(Integer pkTypeBigId);

}
