package org.wx.jiu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.Address;
import org.wx.jiu.domain.ShopCar;
import org.wx.jiu.mapper.AddressMapper;
import org.wx.jiu.mapper.ShopCarMapper;
import org.wx.jiu.service.ShopCarService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ShopCarServiceImpl extends BaseServiceImpl<ShopCar> implements ShopCarService{
	@Autowired
 private ShopCarMapper shopCarMapper;	
	
	@Override
	public PageInfo<ShopCar> findAllAddressForPage(Integer pageNum, Integer limit) {
		PageHelper.startPage(pageNum, limit);
		List<ShopCar> list = shopCarMapper.selectShopCarAll();
		PageInfo<ShopCar> page = new PageInfo<>(list);
		return page;
	}

	@Override
	public List<ShopCar> getAllCarByUserId(Integer id) {
		return shopCarMapper.listViewCarAll(id);
	}

	@Override
	public ShopCar getShopCarById(Integer pkShopCarId) {
		// TODO Auto-generated method stub
		return shopCarMapper.getShopCarById(pkShopCarId);
	} 
}
