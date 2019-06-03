package org.wx.jiu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.wx.jiu.common.BaseMapper;
import org.wx.jiu.domain.News;
import org.wx.jiu.domain.OrderInfo;
@Mapper
public interface NewsMapper extends BaseMapper<News> {
	/************
	 * 新闻查询
	 * Ht
	 * @return
	 */
	public List<News> selectAllNews();
	/**************
	 * 新闻模糊查询
	 * Ht
	 * @return
	 */
	public List<News> selectAllNewsMohu(String title);
	/**********
	 * 逻辑删除
	 * Ht
	 * @param newsid
	 * @return
	 */
	public Integer deleteByIsdelete(Integer newsid);
	/*************
	 * 查询新闻恢复
	 * Ht
	 * @return
	 */
	public List<News> selectNewsByDelete();
	/***********
	 * 恢复操作
	 * Ht
	 * @param orderid
	 * @return
	 */
	public Integer updateByIsdeleteToHuiFu(Integer newsid);
}