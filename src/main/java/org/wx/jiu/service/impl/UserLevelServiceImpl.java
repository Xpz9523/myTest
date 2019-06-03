package org.wx.jiu.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.UserLevel;
import org.wx.jiu.service.UserLevelService;

import com.github.pagehelper.PageInfo;

@Service
public class UserLevelServiceImpl  extends BaseServiceImpl<UserLevel> implements UserLevelService{

	@Override
    public List<UserLevel> selectAllUserLevel(Integer pageNum,Integer pageSize) {
		// TODO Auto-generated method stub
		return userLevelMapper.selectAllUserLevel(pageNum, pageSize);
	}

	@Override
	public void delUserLevelById(Integer pkUserLevelId) {
		// TODO Auto-generated method stub
		userLevelMapper.delUserLevelById(pkUserLevelId);
	}
}

