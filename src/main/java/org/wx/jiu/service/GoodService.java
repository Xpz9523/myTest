package org.wx.jiu.service;

import java.util.List;
import java.util.Map;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.Good;

import com.github.pagehelper.PageInfo;


public interface GoodService extends BaseService<Good> {
	/**
	 * @time 2018年3月12日 11:57:06
	 * @author GG
	 * @作用 查询商品对应的类型
	 */
	PageInfo<Good> selectGoodAndType(int pageNum, int pageSize);
	/**
	 * @time 2018年3月12日 11:57:06
	 * @author GG
	 * @作用 查询已被删除的商品
	 */
	PageInfo<Good> selectGoodAndTypeIsDelete(int pageNum, int pageSize);

	/**
	 * @time 2018年3月13日 11:35:18
	 * @author GG
	 * @作用 根据主键删除商品信息（逻辑删除）
	 */
	//int delGoodBypKGoodId(int pkGoodId);
	/**
	 * @time 2018年3月13日 14:57:50
	 * @author GG
	 * @作用 根据销量排行
	 */
	PageInfo<Good> selectGoodByGoodSaleNum(int pageNum, int pageSize);
	
	/**
	 * @time 2018年3月13日 14:57:50
	 * @author GG
	 * @作用 根据收藏数量排行
	 */
	PageInfo<Good> selectGoodByGoodConllectionNum(int pageNum, int pageSize);
	
	
	
	   /**
  * 
  *  @功能:前台销量卖出
  *  @作者:pl
  *  @时间:2017年4月17日
  *  @return
  */
	 List<Good> selectcoverImgBysaleNum();
	 
	 
	 /**
	  * pl
		 * @time 2018年3月13日 14:57:50
		 * @author
		 * @作用 前台根据收藏数量排行
		 */
		List<Good> selectGoodByGoodConllectionNum();
		
		
		 /**
		  * pl
			 * @time 2018年3月13日 14:57:50
			 * @author 
			 * @作用 前台页面无刷新搜索
			 */
			List<Good> selectGoodByrefresh( String keyword);

}
