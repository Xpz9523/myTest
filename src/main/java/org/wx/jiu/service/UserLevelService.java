package org.wx.jiu.service;

import java.util.List;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.UserLevel;

import com.github.pagehelper.PageInfo;

public interface UserLevelService extends BaseService<UserLevel>{
	public List<UserLevel> selectAllUserLevel(Integer pageNum,Integer pageSize);
	public void delUserLevelById(Integer pkUserLevelId);
}
