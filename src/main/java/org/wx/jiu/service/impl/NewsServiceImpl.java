package org.wx.jiu.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.News;
import org.wx.jiu.service.NewsService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService{

	@Override
	public PageInfo<News> selectAllByMohu(int pageNum, int pageSize, String title) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<News> page = new PageInfo<>(newsMapper.selectAllNewsMohu(title));
		return page;
	}

	@Override
	public Integer deleteByIsdelete(Integer newsid) {
		return newsMapper.deleteByIsdelete(newsid);
	}

	@Override
	public PageInfo<News> selectAllNews(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<News>  page = new PageInfo<>(newsMapper.selectAllNews());
		return page;
	}

	@Override
	public PageInfo<News> selectNewsByDelete(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<News>  page = new PageInfo<>(newsMapper.selectNewsByDelete());
		return page;
	}

	@Override
	public Integer updateByIsdeleteToHuiFu(Integer newsid) {
		return newsMapper.updateByIsdeleteToHuiFu(newsid);
	}

	@Override
	public List<News> selectAllNews() {
		// TODO Auto-generated method stub
		return newsMapper.selectAllNews();
	}

}
