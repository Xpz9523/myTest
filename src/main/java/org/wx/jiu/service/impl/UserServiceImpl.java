package org.wx.jiu.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.User;
import org.wx.jiu.mapper.UserMapper;
import org.wx.jiu.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
	
	@Override
	public User getHeadImg(String loginName) {
		// TODO Auto-generated method stub
		return  userMapper.getHeadImg(loginName);
	}
	@Override
	public User login(String loginName, String loginPwd) {
		// TODO Auto-generated method stub
		if(userMapper.selectByLoginNameAndLoginPwd(loginName, loginPwd)>0){
			return userMapper.getHeadImg(loginName);
		}else{
			return null;
		}
	}
	@Override
	public List<User> selectAllUser(Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		return userMapper.selectAllUser(pageNum,pageSize);
	}
	@Override
	public void delUserById(Integer pkUserId) {
		// TODO Auto-generated method stub
		userMapper.delUserById(pkUserId);
	}
	@Override
	public User selectUserAndLevel(String loginName) {
		// TODO Auto-generated method stub
		return userMapper.selectUserAndLevel(loginName);
	}
	@Override
	public User viewLogin(String loginName, String loginPwd) {
		if(userMapper.selectByLoginNameAndLoginPwdByisAdmin(loginName, loginPwd)>0){
			return userMapper.getHeadImg(loginName);
		}else{
			return null;
		}
	}
}
