package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.Address;
import org.wx.jiu.domain.ShopCar;
@Mapper
public interface ShopCarMapper extends BaseMapper<ShopCar> {
	
	//后台查询所有
			List<ShopCar> selectShopCarAll();
//前台查询所有
			List<ShopCar> listViewCarAll(Integer id);
			//根据ID查询一个购物车
			ShopCar  getShopCarById(Integer pkShopCarId);
}