package org.wx.jiu.service;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.Size;

import com.github.pagehelper.PageInfo;

public interface SizeService  extends BaseService<Size>{
	public PageInfo<Size> selectAllSize(Integer pageNum, Integer pageSize);
	public Size getSizeById(Integer pkSizeId );
	public int getSizeByName(String sizeName);
}
