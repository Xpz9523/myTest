package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.Address;
import org.wx.jiu.domain.Carousel;

@Mapper
public interface AddressMapper extends BaseMapper<Address> {

	// 查询所有
	List<Address> selectAddressAll();

	// 根据fkUserId修改默认地址 GG
	int updateIsDefaultByfkUserId(int fkUserId);

	// 查询所有按默认地址排序 GG
	List<Address> selectAddressAllByIsDefault(Integer fkUserId);
	
	//查询该用户是否有默认地址GG
	int selectByIsDefault(int fkUserId);
	
	//查询用户是否存在地址GG
	int selectByfkUserId(int fkUserId);
}