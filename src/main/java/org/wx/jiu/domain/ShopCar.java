package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;

@Table(name = "shop_car")
public class ShopCar {
	/**
	 * 购物车编号
	 */
	@Id
	@Column(name = "pk_shop_car_id")
	private Integer pkShopCarId;

	/**
	 * 用户id
	 */
	@Column(name = "fk_user_id")
	private Integer fkUserId;

	/**
	 * 商品id
	 */
	@Column(name = "fk_good_id")
	private Integer fkGoodId;

	/**
	 * 订购数量
	 */
	private Integer num;

	/**
	 * 商品标题
	 */
	private String title;

	/**
	 * 商品单价
	 */
	private Double price;

	/**
	 * 总价格
	 */
	@Column(name = "count_money")
	private Double countMoney;

	/**
	 * 商品封面
	 */
	@Column(name = "good_img")
	private String goodImg;

	/**
	 * 商品规格信息
	 */
	@Column(name = "size_info")
	private String sizeInfo;

	/**
	 * 创建时间
	 */
	@Column(name = "create_time")
	@JsonFormat(timezone = "GMT+8", pattern = "yyyy/MM/dd HH:mm:ss")
	private Date createTime;

	/**
	 * 更新时间
	 */
	@Column(name = "update_time")
	@JsonFormat(timezone = "GMT+8", pattern = "yyyy/MM/dd HH:mm:ss")
	private Date updateTime;

	/**
	 * 0 删除 1未删除
	 */
	@Column(name = "is_delete")
	private Integer isDelete;

/*	@Transient
	private String userLoginName;
	@Transient
	private String cartGoodName;

	public String getUserLoginName() {
		return userLoginName;
	}

	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}

	public String getCartGoodName() {
		return cartGoodName;
	}

	public void setCartGoodName(String cartGoodName) {
		this.cartGoodName = cartGoodName;
	}
*/
	/**
	 * 获取购物车编号
	 *
	 * @return pk_shop_car_id - 购物车编号
	 */
	public Integer getPkShopCarId() {
		return pkShopCarId;
	}

	/**
	 * 设置购物车编号
	 *
	 * @param pkShopCarId
	 *            购物车编号
	 */
	public void setPkShopCarId(Integer pkShopCarId) {
		this.pkShopCarId = pkShopCarId;
	}

	/**
	 * 获取用户id
	 *
	 * @return fk_user_id - 用户id
	 */
	public Integer getFkUserId() {
		return fkUserId;
	}

	/**
	 * 设置用户id
	 *
	 * @param fkUserId
	 *            用户id
	 */
	public void setFkUserId(Integer fkUserId) {
		this.fkUserId = fkUserId;
	}

	/**
	 * 获取商品id
	 *
	 * @return fk_good_id - 商品id
	 */
	public Integer getFkGoodId() {
		return fkGoodId;
	}

	/**
	 * 设置商品id
	 *
	 * @param fkGoodId
	 *            商品id
	 */
	public void setFkGoodId(Integer fkGoodId) {
		this.fkGoodId = fkGoodId;
	}

	/**
	 * 获取订购数量
	 *
	 * @return num - 订购数量
	 */
	public Integer getNum() {
		return num;
	}

	/**
	 * 设置订购数量
	 *
	 * @param num
	 *            订购数量
	 */
	public void setNum(Integer num) {
		this.num = num;
	}

	/**
	 * 获取商品标题
	 *
	 * @return title - 商品标题
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 设置商品标题
	 *
	 * @param title
	 *            商品标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 获取商品单价
	 *
	 * @return price - 商品单价
	 */
	public Double getPrice() {
		return price;
	}

	/**
	 * 设置商品单价
	 *
	 * @param price
	 *            商品单价
	 */
	public void setPrice(Double price) {
		this.price = price;
	}

	/**
	 * 获取总价格
	 *
	 * @return count_money - 总价格
	 */
	public Double getCountMoney() {
		return countMoney;
	}

	/**
	 * 设置总价格
	 *
	 * @param countMoney
	 *            总价格
	 */
	public void setCountMoney(Double countMoney) {
		this.countMoney = countMoney;
	}

	/**
	 * 获取商品封面
	 *
	 * @return good_img - 商品封面
	 */
	public String getGoodImg() {
		return goodImg;
	}

	/**
	 * 设置商品封面
	 *
	 * @param goodImg
	 *            商品封面
	 */
	public void setGoodImg(String goodImg) {
		this.goodImg = goodImg;
	}

	/**
	 * 获取商品规格信息
	 *
	 * @return size_info - 商品规格信息
	 */
	public String getSizeInfo() {
		return sizeInfo;
	}

	/**
	 * 设置商品规格信息
	 *
	 * @param sizeInfo
	 *            商品规格信息
	 */
	public void setSizeInfo(String sizeInfo) {
		this.sizeInfo = sizeInfo;
	}

	/**
	 * 获取创建时间
	 *
	 * @return create_time - 创建时间
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * 设置创建时间
	 *
	 * @param createTime
	 *            创建时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取更新时间
	 *
	 * @return update_time - 更新时间
	 */
	public Date getUpdateTime() {
		return updateTime;
	}

	/**
	 * 设置更新时间
	 *
	 * @param updateTime
	 *            更新时间
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 获取0 删除 1未删除
	 *
	 * @return is_delete - 0 删除 1未删除
	 */
	public Integer getIsDelete() {
		return isDelete;
	}

	/**
	 * 设置0 删除 1未删除
	 *
	 * @param isDelete
	 *            0 删除 1未删除
	 */
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	@Override
	public String toString() {
		return "ShopCar [pkShopCarId=" + pkShopCarId + ", fkUserId=" + fkUserId + ", fkGoodId=" + fkGoodId + ", num="
				+ num + ", title=" + title + ", price=" + price + ", countMoney=" + countMoney + ", goodImg=" + goodImg
				+ ", sizeInfo=" + sizeInfo + ", createTime=" + createTime + ", updateTime=" + updateTime + ", isDelete="
				+ isDelete + "]";
	}

	/*@Override
	public String toString() {
		return "ShopCar [pkShopCarId=" + pkShopCarId + ", fkUserId=" + fkUserId + ", fkGoodId=" + fkGoodId + ", num="
				+ num + ", title=" + title + ", price=" + price + ", countMoney=" + countMoney + ", goodImg=" + goodImg
				+ ", sizeInfo=" + sizeInfo + ", createTime=" + createTime + ", updateTime=" + updateTime + ", isDelete="
				+ isDelete + ", userLoginName=" + userLoginName + ", cartGoodName=" + cartGoodName + "]";
	}*/
	
	

}