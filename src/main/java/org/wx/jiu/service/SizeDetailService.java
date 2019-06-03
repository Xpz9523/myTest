package org.wx.jiu.service;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.SizeDetail;

import com.github.pagehelper.PageInfo;

public interface SizeDetailService extends BaseService<SizeDetail> {
	public PageInfo<SizeDetail> selectAllSize(Integer pageNum, Integer pageSize);
	public SizeDetail getSizeDetailById(Integer fkSizeId );
	public int getSizeDetailByName(String sizeDetailName);
	
}
