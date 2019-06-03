package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.GoodTypeBig;
import org.wx.jiu.domain.Size;
@Mapper
public interface SizeMapper extends BaseMapper<Size> {
	/**
	 * 查询所有规格且状态是未删除状态的
	 * 作者:Xpz
	 */
	List<Size> selectSizeAll();
	
	/**
	 * 根据id查询一个商品大类型
	 * 作者：Xpz
	 */
	Size getSizeById(Integer pkSizeId );
	
	int getSizeByName(String sizeName);

}