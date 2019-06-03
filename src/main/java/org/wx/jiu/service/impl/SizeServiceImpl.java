package org.wx.jiu.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.GoodTypeBig;
import org.wx.jiu.domain.Size;
import org.wx.jiu.service.SizeService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SizeServiceImpl extends BaseServiceImpl<Size> implements SizeService{
	/**
	 * 显示状态未删除的规格
	 */
	@Override
	public PageInfo<Size> selectAllSize(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		List<Size> list = sizeMapper.selectSizeAll();
		PageInfo<Size> page = new PageInfo<>(list);
		return page;
	}
/**
 * 根据ID得到一个Size对象
 */
	@Override
	public Size getSizeById(Integer pkSizeId) {
		return sizeMapper.getSizeById(pkSizeId);
	}
/**
 * 根据名字查询是否重复
 */
	@Override
	public int getSizeByName(String sizeName) {
		// TODO Auto-generated method stub
		return sizeMapper.getSizeByName(sizeName);
	}

}
