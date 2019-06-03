package org.wx.jiu.service;

import java.util.List;

import org.wx.jiu.common.BaseService;

import org.wx.jiu.domain.Carousel;

import com.github.pagehelper.PageInfo;

public interface CarouselService  extends BaseService<Carousel> {

	/*分頁显示所有轮播*/
	public PageInfo<Carousel> findAllCarouselForPage(Integer pageNum, Integer pageSize);
	
	public Carousel selectByCarouselId(Integer pkCarouselId);
	//查询轮播图带上IsDelete = 0
		public List<Carousel> queryCarouselAllList();
}
