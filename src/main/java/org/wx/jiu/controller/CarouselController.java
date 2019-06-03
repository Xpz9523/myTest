package org.wx.jiu.controller;

import java.util.Date;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.domain.Address;
import org.wx.jiu.domain.Carousel;
import org.wx.jiu.domain.Good;
import org.wx.jiu.service.CarouselService;
import org.wx.jiu.util.Split;
import org.wx.jiu.util.UploadUtil;

import com.github.pagehelper.PageInfo;

/**
 * PL 轮播
 * 
 * @author Administrator
 *
 */

@Controller
@RequestMapping("Carousel/")
public class CarouselController extends BaseController {
	Logger logger = Logger.getLogger(CarouselController.class);

	private static String newFood = null;

	/******************
	 * 进入轮播页面 作者:pl
	 * 
	 * @return
	 */
	@RequestMapping("/admin/selectGoodCarousel")
	public String selectGoodCarousel(HttpServletRequest Request) {
		
		Good good = new Good();
		good.setIsDelete(1);
		List<Good> goodList = goodService.queryParamList(good);
		Request.setAttribute("goodList", goodList);
		return "admin/good/Carousel";
	}

	// 显示轮播列表
	@ResponseBody
	@RequestMapping("/admin/selectCarouselAll")
	public PageInfo<Carousel> selectCarouselAll(Integer pageNum,
			@RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
			HttpServletRequest request) {
		logger.info("====selectCarouselAll===");

		PageInfo<Carousel> page = carouselService.findAllCarouselForPage(pageNum, pageSize);
		logger.info("=======" + page.toString());
		return page;
	}

	/**
	 * 删除
	 */

	@ResponseBody
	@RequestMapping("/admin/delCarousel")
	public Integer delCarousel(Integer pkCarouselId) {
		logger.info("=====delCarousel======" + pkCarouselId);
		Carousel carousel = carouselService.queryById(pkCarouselId);
		carousel.setIsDelete(1);
		Integer temp = carouselService.update(carousel);
		logger.info("=====delCarousel结束======" );
		return temp;
	}

	// 上传轮播图片
	@ResponseBody
	@RequestMapping("/admin/upload")
	public Map<String, Object> image(MultipartFile file, HttpServletRequest request, String type) {
		logger.info("====image=====");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String path = request.getSession().getServletContext().getRealPath("/lib/common/img/carouselimg/" + type + "\\");
			String image = UploadUtil.uploadFile(file, path);
			System.out.println("==========" + path + "\\" + image);
			newFood = image;

			map.put("code", 0);
			map.put("image", image);

		} catch (Exception e) {
			map.put("code", 1);
			e.printStackTrace();
		}
		return map;
	}

	// 添加轮播
	@ResponseBody
	@RequestMapping("/admin/postCarousel")
	public Integer postCarousel(HttpServletRequest request, Carousel carousel, MultipartFile file, String carouselImgs) {
		
		
		if(carouselImgs != null){
			logger.info("=====进入1======" );
			carousel.setCarouselImg(carouselImgs);
			carousel.setCarouselRemark(carousel.getCarouselRemark());
			carousel.setCreateTime(new Date());
			carousel.setUpdateTime(new Date());
			carousel.setIsDelete(0);
			Integer temp1 = carouselService.save(carousel);
			return temp1;
		}
		logger.info("=====进入2======" );
			String img = Split.splitFood(newFood);
			logger.info("美食分割：" + img);
			carousel.setCarouselImg(img);
			carousel.setCreateTime(new Date());
			carousel.setUpdateTime(new Date());
			carousel.setIsDelete(0);
			logger.info("=====postCarousel======" + carousel.toString());
			Integer temp = carouselService.save(carousel);
			
		
		
		return temp;
	}

	/**
	 * 修改
	 */

	@ResponseBody
	@RequestMapping("/admin/updateCarousel")
	public Integer postUpdateCarousel(HttpServletRequest request, Carousel carousel, MultipartFile file) {
		logger.info("===========*******************-----------+++++++++++++++++++++++==========");
		logger.info("修改之前：" + carousel.toString());

		Carousel Carousel2 = carouselService.queryById(carousel.getPkCarouselId());// 获取数据库原有对象
		logger.info("数据库原有对象：" + Carousel2.toString());
		String img = Split.splitFood(newFood);
		logger.info("美食分割：" + img);
		Carousel2.setCarouselImg(img);
		Carousel2.setCarouselRemark(carousel.getCarouselRemark());
		Carousel2.setUpdateTime(new Date());

		logger.info("=====修改之前======" + Carousel2.toString());
		Integer temp = carouselService.update(Carousel2);
		return temp;
	}
	
	
}
