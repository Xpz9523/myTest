package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.OrderInfo;
import org.wx.jiu.domain.User;
import org.wx.jiu.domain.UserLevel;

import com.github.pagehelper.PageInfo;

@Mapper
public interface UserLevelMapper extends BaseMapper<UserLevel> {
	/*********
	 * 分页显示等级及其相关信息 wyd
	 * 
	 * @return
	 */
	public List<UserLevel> selectAllUserLevel(Integer pageNum, Integer pageSize);

	/*********
	 * 用户等级逻辑删除 wyd
	 * 
	 * @return
	 */
	public void delUserLevelById(Integer pkUserLevelId);
	
	
}