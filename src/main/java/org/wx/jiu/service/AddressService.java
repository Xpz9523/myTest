package org.wx.jiu.service;

import java.util.List;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.Address;
import org.wx.jiu.domain.Carousel;

import com.github.pagehelper.PageInfo;

public interface AddressService extends BaseService<Address> {
	/* 分頁显示所有 */
	public PageInfo<Address> findAllAddressForPage(Integer pageNum, Integer limit);

	// 根据fkUserId修改默认地址 GG
	int updateIsDefaultByfkUserId(int fkUserId);

	// 查询所有按默认地址排序 GG
	List<Address> selectAddressAllByIsDefault(Integer fkUserId);

	// 查询该用户是否有默认地址GG
	int selectByIsDefault(int fkUserId);

	// 查询用户是否存在地址GG
	int selectByfkUserId(int fkUserId);
}
