package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.User;

@Mapper
public interface UserMapper extends BaseMapper<User> {

	User getHeadImg(String loginName);

	/**
	 * @author GG
	 * @return 用帐号和密码判断用户名是否存在
	 * 
	 */
	int selectByLoginNameAndLoginPwd(String loginName, String loginPwd);

	int selectByLoginNameAndLoginPwdByisAdmin(String loginName, String loginPwd);
	
	public List<User> selectAllUser(Integer pageNum, Integer pageSize);

	public void delUserById(Integer pkUserId);
	
	/**
	 * 
	 * 根据用户查询信息并且查出等级
	 * @author GG
	 */
	public User selectUserAndLevel(String loginName);
}
