package org.wx.jiu.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.Good;
import org.wx.jiu.service.GoodService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class GoodServiceImpl extends BaseServiceImpl<Good> implements GoodService {

	@Override
	public PageInfo<Good> selectGoodAndType(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<Good> page = new PageInfo<>(goodMapper.selectGoodAndType());
		return page;
	}

	@Override
	public PageInfo<Good> selectGoodAndTypeIsDelete(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<Good> page = new PageInfo<>(goodMapper.selectGoodAndTypeIsDelete());
		return page;
	}

	@Override
	public PageInfo<Good> selectGoodByGoodSaleNum(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<Good> page = new PageInfo<>(goodMapper.selectGoodByGoodSaleNum());
		return page;
	}

	@Override
	public PageInfo<Good> selectGoodByGoodConllectionNum(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<Good> page = new PageInfo<>(goodMapper.selectGoodByGoodConllectionNum());
		return page;
	}

	/*
	 * @Override public int delGoodBypKGoodId(int pkGoodId) { // TODO
	 * Auto-generated method stub return goodMapper.delGoodByPKGoodId(pkGoodId);
	 * }
	 */
	
	@Override
	public List<Good> selectcoverImgBysaleNum() {
		// TODO Auto-generated method stub
		return  goodMapper.selectGoodByGoodSaleNum();
	}

	@Override
	public List<Good> selectGoodByGoodConllectionNum() {
		// TODO Auto-generated method stub
		return goodMapper.selectGoodByGoodConllectionNum();
	}

	@Override
	public List<Good> selectGoodByrefresh(String keyword) {
		List<Good> list = goodMapper.selectGoodByrefresh(keyword);
		return list;
	}


}
