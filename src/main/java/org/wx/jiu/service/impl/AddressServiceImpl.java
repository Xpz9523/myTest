package org.wx.jiu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.Address;
import org.wx.jiu.domain.Carousel;
import org.wx.jiu.domain.User;
import org.wx.jiu.mapper.AddressMapper;
import org.wx.jiu.service.AddressService;
import org.wx.jiu.service.UserService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class AddressServiceImpl extends BaseServiceImpl<Address> implements AddressService  {

	
	@Override
	public PageInfo<Address> findAllAddressForPage(Integer pageNum, Integer limit) {
		PageHelper.startPage(pageNum, limit);
		List<Address> list = addressMapper.selectAddressAll();
		PageInfo<Address> page = new PageInfo<>(list);
		return page;
	}

	@Override
	public int updateIsDefaultByfkUserId(int fkUserId) {
		// TODO Auto-generated method stub
		return addressMapper.updateIsDefaultByfkUserId(fkUserId);
	}

	@Override
	public List<Address> selectAddressAllByIsDefault(Integer fkUserId) {
		// TODO Auto-generated method stub
		return addressMapper.selectAddressAllByIsDefault(fkUserId);
	}

	@Override
	public int selectByIsDefault(int fkUserId) {
		// TODO Auto-generated method stub
		return addressMapper.selectByIsDefault(fkUserId);
	}

	@Override
	public int selectByfkUserId(int fkUserId) {
		// TODO Auto-generated method stub
		return addressMapper.selectByfkUserId(fkUserId);
	}

}
