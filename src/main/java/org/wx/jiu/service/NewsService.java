package org.wx.jiu.service;

import java.util.List;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.News;
import org.wx.jiu.domain.OrderInfo;
import org.wx.jiu.domain.OrderInfoDetail;

import com.github.pagehelper.PageInfo;

public interface NewsService extends BaseService<News>{
	/*************
	 * 新闻显示所有，并分页显示
	 * Ht
	 */
	PageInfo<News> selectAllNews(int pageNum,int pageSize);
	/***********
	 * 根据新闻标题模糊查询，并分页显示
	 * Ht
	 * @param pageNum
	 * @param pageSize
	 * @param orderid
	 * @return
	 */
	PageInfo<News> selectAllByMohu(int pageNum,int pageSize,String title);
	/**********
	 * 逻辑删除，并更新时间
	 * Ht
	 * @param orderid
	 * @param updateTime
	 * @return
	 */
	Integer deleteByIsdelete(Integer newsid);
	/*************
	 * 查询需要恢复的新闻，并分页显示
	 * Ht
	 * @return
	 */
	PageInfo<News> selectNewsByDelete(int pageNum,int pageSize);
	/*********
	 * 恢复操作
	 * Ht
	 * @param newsid
	 * @return
	 */
	Integer updateByIsdeleteToHuiFu(Integer newsid);
	
	
	/*************
	 * 前台新闻轮播标题
	 * pl
	 */
	List<News> selectAllNews();
}
