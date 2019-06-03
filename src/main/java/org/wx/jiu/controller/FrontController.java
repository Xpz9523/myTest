package org.wx.jiu.controller;

import java.net.URLEncoder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.domain.Carousel;
import org.wx.jiu.domain.Good;
import org.wx.jiu.domain.GoodTypeBig;
import org.wx.jiu.domain.GoodTypeSmall;
import org.wx.jiu.domain.News;
import org.wx.jiu.util.JsonReturnData;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;

/**
 * pl 前台首页管理
 * 
 * @author Administrator
 *
 */
@Controller
public class FrontController extends BaseController {
	Logger logger = Logger.getLogger(FrontController.class);

	// 去前台首页
	@RequestMapping("/view/index")
	public String toIndex(HttpServletRequest request, ModelMap modelMap) {
		return "view/index/main";
	}

	/**
	 * 显示前台轮播图 pl
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/view/Front")
	public List<Carousel> selectFront(HttpServletRequest request) {

		return carouselService.queryCarouselAllList();

	}

	/**
	 * 显示前台新闻轮播 pl
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/view/news")
	public List<News> selectFrontNews(HttpServletRequest request) {
		logger.info("******+selectFrontNews+**********");
		return newsService.selectAllNews();

	}

	/**
	 * 显示前台销量卖出轮播 pl
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/view/goodSaleNum")
	public List<Good> goodSaleNum(HttpServletRequest request) {
		logger.info("******+goodSaleNum+**********");

		List<Good> list = goodService.selectcoverImgBysaleNum();
		logger.info("========goodSaleNum===========" + list.toString());
		return list;
	}

	/**
	 * 显示前台收藏轮播 pl
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/view/goodConllectionNum")
	public List<Good> goodConllectionNum(HttpServletRequest request) {
		logger.info("******+goodConllectionNum+**********");

		List<Good> list = goodService.selectGoodByGoodConllectionNum();
		logger.info("========goodConllectionNum===========" + list.toString());
		return list;
	}

	// 百度无刷新
	@ResponseBody
	@RequestMapping("/view/shuaxin")
	public List<String> shuaxin(HttpServletRequest request, String keyword) {
		List<Good> listRefresh = goodService.selectGoodByrefresh(keyword);
		List<String> list = listRefresh == null ? new ArrayList<String>() : getDatas(keyword, listRefresh);
		return list;
	}

	public List<String> getDatas(String keyWord, List<Good> listRefresh) {
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < listRefresh.size(); i++) {
			if (listRefresh.get(i).getGoodName().contains(keyWord)) {
				// list.add(keyWordList.get(i));
				list.add(listRefresh.get(i).getGoodName());
			}
		}
		return list;
	}

	
	
	/**
	 * 
	 * @功能: 流式加载
	 * @作者:pl
	 * 
	 * @param pageNum
	 * @return
	 */
	@RequestMapping("/view/getpageAll")
	@ResponseBody
	public String getpageAll(Integer pageNum) {
		logger.info("************进入getpageAll***************");
		// 实例化一个map对象
		Map<String, Object> map = new HashMap<String, Object>();
		// 接收页面传过来的数据
		//map.put("pageNum", pageNum);
		// 开始分页
		PageInfo<Good> pageinfo = goodService.queryPageList(pageNum);
		logger.info("=======流式："+pageinfo.getList().get(0).toString());
		// 拿到一个json对象
		JsonReturnData<PageInfo<Good>> jsonReturnData = new JsonReturnData<PageInfo<Good>>();
		jsonReturnData.setCode(200);
		jsonReturnData.setMsg("success");
		jsonReturnData.setData(pageinfo);
		return responseAPI.getJsonString(jsonReturnData);
	}
	
	/**
	 * 跳转到分类显示页面 pl
	 * 
	 * @param request
	 * @return：
	 */
	@RequestMapping("/view/classify")
	public String toclassify(HttpServletRequest request) {

		return "view/index/classify";
	}

	// 查询所有大类
	@RequestMapping("/view/allGoodType")
	@ResponseBody
	public String allGoodType() {

		List<GoodTypeBig> list = goodTypeBigService.getAllBigGoodType();
		JsonReturnData<List<GoodTypeBig>> jsonReturnData = new JsonReturnData<List<GoodTypeBig>>();
		jsonReturnData.setData(list);
		return responseAPI.getJsonString(jsonReturnData);
	}

	//
	/**
	 * 根据大类的ID查询小类 pl
	 * 
	 * @param pkTypeBigId：大類型ID
	 * @return 小類型對象List
	 */
	@RequestMapping("/view/allGoodTypeById")
	@ResponseBody
	public String allGoodTypeById(Integer pkTypeBigId) {
		List<GoodTypeSmall> list = goodTypeSmallService.selectGoodTypeSmallList(pkTypeBigId);
		logger.info("==================根據大類型ID拿到小類型ID" + list);
		JsonReturnData<List<GoodTypeSmall>> jsonReturnData = new JsonReturnData<List<GoodTypeSmall>>();
		jsonReturnData.setData(list);
		return responseAPI.getJsonString(jsonReturnData);
	}

}
