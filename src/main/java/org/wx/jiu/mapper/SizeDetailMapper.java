package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.Size;
import org.wx.jiu.domain.SizeDetail;
@Mapper
public interface SizeDetailMapper extends BaseMapper<SizeDetail> {
	/**
	 * 查询所有规格且状态是未删除状态的
	 * 作者:Xpz
	 */
	List<SizeDetail> selectDetailAll();
	
	/**
	 * 根据id查询一个商品大类型
	 * 作者：Xpz
	 */
	Size getSizeDetailById(Integer fkSizeId );
	
	int getSizeDetailByName(String sizeDetailName);
}