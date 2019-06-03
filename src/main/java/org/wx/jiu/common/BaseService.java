/**
 * 代号:隐无为 2017：厚溥
 * 文件名：BaseService.java
 * 创建人：柯栋
 * 日期：2017年10月11日
 * 修改人：
 * 描述：
 */
package org.wx.jiu.common;

import java.util.List;

import com.github.pagehelper.PageInfo;


/**
 * 用途：基类接口
 */
public interface BaseService<T> {

	/**
	 * @功能:分页查询
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @return
	 */
	public PageInfo<T> queryPageList(Integer pageNum, Integer pageSize);

	/**
	 * @功能:分页查询（默认pageSize）
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @return
	 */
	public PageInfo<T> queryPageList(Integer pageNum);

	/**
	 * @功能:条件参数分页查询
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @return
	 */
	public PageInfo<T> queryPageListByParam(Integer pageNum, Integer pageSize,T model);

	/**
	 * @功能:条件参数分页查询（默认pageSize）
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @return
	 */
	public PageInfo<T> queryPageListByParam(Integer pageNum,T model);

	/**
	 * @功能:查询所有
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @return
	 */
	public List<T> queryAllList();

	/**
	 * @功能:带有条件参数的查询
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param model
	 * @return
	 */
	public List<T> queryParamList(T model);

	/**
	 * @功能:查询单个实体类
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @return
	 */
	public T queryById(Object id);

	/**
	 * @功能:带有条件参数单个实体类的查询
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @return
	 */
	public T queryByParam(T model);

	/**
	 * @功能:根据实体中的属性查询总数
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param model
	 * @return
	 */
	public Integer queryCount(T model);

	/**
	 * @功能:保存 null的属性也会保存，不会使用数据库默认值
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param model
	 * @return
	 */
	public Integer save(T model);

	/**
	 * @功能:保存一个实体，null的属性不会保存，会使用数据库默认值
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param model
	 * @return
	 */
	public Integer saveNoNull(T model);

	/**
	 * @功能:根据实体属性作为条件进行删除
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param model
	 * @return
	 */
	public Integer deleteByParam(T model);

	/**
	 * @功能:根据主键字段进行删除
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param key
	 * @return
	 */
	public Integer delete(Object id);

	/**
	 * @功能:根据主键更新实体全部字段，null值会被更新
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param model
	 * @return
	 */
	public Integer update(T model);

	/**
	 * @功能:根据主键更新属性不为null的值
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param model
	 * @return
	 */
	public Integer updateNoNull(T model);

	///////////////////////////////////////////////////////
	//
	// 批量
	//
	///////////////////////////////////////////////////////

	/**
	 * @功能:批量添加
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param list
	 * @return
	 */
	public Integer insertList(List<T> list);

	/**
	 * @功能:根据主键字符串进行批量删除，类中只有存在一个带有@Id注解的字段
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param ids
	 * @return
	 */
	public Integer deleteByIds(String ids);

	/**
	 * @功能:ids批量查询，类中只有存在一个带有@Id注解的字段
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param ids
	 * @return
	 */
	public List<T> queryByIds(String ids);

	/**
	 * @功能:批量更新
	 * @作者:柯栋 @代号:隐无为
	 * @时间:2017年10月11日
	 * @param list
	 * @return
	 */
	public Integer updateList(List<T> list);

	///////////////////////////////////////////////////////
	//
	// 扩展
	//
	///////////////////////////////////////////////////////

	/**
	 *  @功能:逻辑删除 
	 *  @作者:柯栋 @代号:隐无为
	 *  @时间:2017年10月11日
	 *  @param model
	 *  @return  
	 */
	public Integer updateDelete(T model);
	
	
	
}
