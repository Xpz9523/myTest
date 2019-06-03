package org.wx.jiu.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.Carousel;

@Mapper
public interface CarouselMapper extends BaseMapper<Carousel> {
	
	//查询所有
	List<Carousel> selectCarouselAll();
	
	//根据ID 拿数据
	Carousel selectCarouselByID(Integer pkCarouselId);
	
}