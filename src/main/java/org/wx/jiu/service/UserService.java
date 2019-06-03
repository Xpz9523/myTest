package org.wx.jiu.service;

import java.util.List;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.User;
import org.wx.jiu.domain.UserLevel;

public interface UserService extends BaseService<User> {
	/**
	 * @功能:登录时加载头像
	 * @作者:汪应德
	 * @时间:2018年03月13日
	 * @return
	 */
	User getHeadImg(String loginName);

	/**
	 * @author GG
	 * @return 判断登录
	 * 
	 */
	User login(String loginName, String loginPwd);
	
	User viewLogin(String loginName, String loginPwd);
	
	public List<User> selectAllUser(Integer pageNum, Integer pageSize);

	public void delUserById(Integer pkUserId);
	
	/**
	 * 
	 * 根据用户查询信息并且查出等级
	 * @author GG
	 */
	User selectUserAndLevel(String loginName);
}
