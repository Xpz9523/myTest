package org.wx.jiu.service;

import java.util.List;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.Address;
import org.wx.jiu.domain.ShopCar;

import com.github.pagehelper.PageInfo;

public interface ShopCarService  extends BaseService<ShopCar>{
	/*分頁显示所有*/
	public PageInfo<ShopCar> findAllAddressForPage(Integer pageNum,  Integer limit);
	/*显示所有购物车*/
	public List<ShopCar> getAllCarByUserId(Integer id);
	/*根据ID查询一个购物车*/
	public ShopCar getShopCarById(Integer pkShopCarId);
}
