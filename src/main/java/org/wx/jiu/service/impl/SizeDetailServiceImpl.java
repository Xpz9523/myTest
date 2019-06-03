package org.wx.jiu.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.Size;
import org.wx.jiu.domain.SizeDetail;
import org.wx.jiu.service.SizeDetailService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SizeDetailServiceImpl extends BaseServiceImpl<SizeDetail> implements SizeDetailService{

	@Override
	public PageInfo<SizeDetail> selectAllSize(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		List<SizeDetail> list =sizeDetailMapper.selectDetailAll();
		PageInfo<SizeDetail> page = new PageInfo<>(list);
		return page;
	}

	@Override
	public SizeDetail getSizeDetailById(Integer fkSizeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getSizeDetailByName(String sizeDetailName) {
		// TODO Auto-generated method stub
		return 0;
	}

}
