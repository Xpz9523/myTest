package org.wx.jiu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wx.jiu.common.impl.BaseServiceImpl;
import org.wx.jiu.domain.Carousel;
import org.wx.jiu.domain.User;
import org.wx.jiu.mapper.CarouselMapper;
import org.wx.jiu.service.CarouselService;
import org.wx.jiu.service.UserService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class CarouselServiceImpl  extends BaseServiceImpl<Carousel> implements CarouselService {
	@Autowired
	private  CarouselMapper carouselMapper;
	
	@Override
	public PageInfo<Carousel> findAllCarouselForPage(Integer pageNum, Integer pageSize) {

			PageHelper.startPage(pageNum, pageSize);
			List<Carousel> list = carouselMapper.selectCarouselAll();
			PageInfo<Carousel> page = new PageInfo<>(list);
			return page;
		}

	@Override
	public Carousel selectByCarouselId(Integer pkCarouselId) {
		
		return carouselMapper.selectCarouselByID(pkCarouselId);
	}
	
	
	@Override
	public List<Carousel> queryCarouselAllList() {
		// TODO Auto-generated method stub
		return carouselMapper.selectCarouselAll();
	}


	}


