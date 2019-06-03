package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;

@Table(name = "good")
public class Good {
	/**
	 * 商品编号
	 */
	@Id
	@Column(name = "pk_good_id")
	private Integer pkGoodId;

	/**
	 * @author GG
	 * @time 2018年3月12日 11:36:08
	 * @作用 通过商品类型id来关联类型
	 */
	private GoodTypeSmall goodTypeSmall;
	/**
	 * 商品类型id
	 */
	@Column(name = "fk_good_type_small_id")
	private Integer fkGoodTypeSmallId;

	/**
	 * 商品名称
	 */
	@Column(name = "good_name")
	private String goodName;

	/**
	 * 商品标题
	 */
	@Column(name = "good_title")
	private String goodTitle;

	/**
	 * 商品子标题
	 */
	@Column(name = "good_sub_title")
	private String goodSubTitle;

	/**
	 * 商品价格
	 */
	@Column(name = "good_price")
	private Double goodPrice;

	/**
	 * 商品封面图
	 */
	@Column(name = "good_cover_img")
	private String goodCoverImg;

	/**
	 * 商品轮播图 (最少1张 最多10张)
	 */
	@Column(name = "good_carousel_imgs")
	private String goodCarouselImgs;

	/**
	 * 运费
	 */
	@Column(name = "good_freight")
	private Double goodFreight;

	/**
	 * 库存数量
	 */
	@Column(name = "good_num")
	private Integer goodNum;

	/**
	 * 收藏数量
	 */
	@Column(name = "good_collection_num")
	private Integer goodCollectionNum;

	/**
	 * 销量卖出
	 */
	@Column(name = "good_sale_num")
	private Integer goodSaleNum;

	/**
	 * 0:准备上架１:上架２:下架
	 */
	@Column(name = "good_state")
	private Integer goodState;

	/**
	 * 0:准备上架１:上架２:下架
	 */
	@Transient
	private String goodStateName;

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

	/**
	 * 商品详情
	 */
	@Column(name = "good_detail")
	private String goodDetail;

	/**
	 * 获取商品编号
	 *
	 * @return pk_good_id - 商品编号
	 */
	public Integer getPkGoodId() {
		return pkGoodId;
	}

	/**
	 * 设置商品编号
	 *
	 * @param pkGoodId
	 *            商品编号
	 */
	public void setPkGoodId(Integer pkGoodId) {
		this.pkGoodId = pkGoodId;
	}

	/**
	 * 获取商品类型id
	 *
	 * @return fk_good_type_small_id - 商品类型id
	 */
	public Integer getFkGoodTypeSmallId() {
		return fkGoodTypeSmallId;
	}

	/**
	 * 设置商品类型id
	 *
	 * @param fkGoodTypeSmallId
	 *            商品类型id
	 */
	public void setFkGoodTypeSmallId(Integer fkGoodTypeSmallId) {
		this.fkGoodTypeSmallId = fkGoodTypeSmallId;
	}

	/**
	 * 获取商品名称
	 *
	 * @return good_name - 商品名称
	 */
	public String getGoodName() {
		return goodName;
	}

	/**
	 * 设置商品名称
	 *
	 * @param goodName
	 *            商品名称
	 */
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	/**
	 * 获取商品标题
	 *
	 * @return good_title - 商品标题
	 */
	public String getGoodTitle() {
		return goodTitle;
	}

	/**
	 * 设置商品标题
	 *
	 * @param goodTitle
	 *            商品标题
	 */
	public void setGoodTitle(String goodTitle) {
		this.goodTitle = goodTitle;
	}

	/**
	 * 获取商品子标题
	 *
	 * @return good_sub_title - 商品子标题
	 */
	public String getGoodSubTitle() {
		return goodSubTitle;
	}

	/**
	 * 设置商品子标题
	 *
	 * @param goodSubTitle
	 *            商品子标题
	 */
	public void setGoodSubTitle(String goodSubTitle) {
		this.goodSubTitle = goodSubTitle;
	}

	/**
	 * 获取商品价格
	 *
	 * @return good_price - 商品价格
	 */
	public Double getGoodPrice() {
		return goodPrice;
	}

	/**
	 * 设置商品价格
	 *
	 * @param goodPrice
	 *            商品价格
	 */
	public void setGoodPrice(Double goodPrice) {
		this.goodPrice = goodPrice;
	}

	/**
	 * 获取商品封面图
	 *
	 * @return good_cover_img - 商品封面图
	 */
	public String getGoodCoverImg() {
		return goodCoverImg;
	}

	/**
	 * 设置商品封面图
	 *
	 * @param goodCoverImg
	 *            商品封面图
	 */
	public void setGoodCoverImg(String goodCoverImg) {
		this.goodCoverImg = goodCoverImg;
	}

	/**
	 * 获取商品轮播图 (最少1张 最多10张)
	 *
	 * @return good_carousel_imgs - 商品轮播图 (最少1张 最多10张)
	 */
	public String getGoodCarouselImgs() {
		return goodCarouselImgs;
	}

	/**
	 * 设置商品轮播图 (最少1张 最多10张)
	 *
	 * @param goodCarouselImgs
	 *            商品轮播图 (最少1张 最多10张)
	 */
	public void setGoodCarouselImgs(String goodCarouselImgs) {
		this.goodCarouselImgs = goodCarouselImgs;
	}

	/**
	 * 获取运费
	 *
	 * @return good_freight - 运费
	 */
	public Double getGoodFreight() {
		return goodFreight;
	}

	/**
	 * 设置运费
	 *
	 * @param goodFreight
	 *            运费
	 */
	public void setGoodFreight(Double goodFreight) {
		this.goodFreight = goodFreight;
	}

	/**
	 * 获取库存数量
	 *
	 * @return good_num - 库存数量
	 */
	public Integer getGoodNum() {
		return goodNum;
	}

	/**
	 * 设置库存数量
	 *
	 * @param goodNum
	 *            库存数量
	 */
	public void setGoodNum(Integer goodNum) {
		this.goodNum = goodNum;
	}

	/**
	 * 获取收藏数量
	 *
	 * @return good_collection_num - 收藏数量
	 */
	public Integer getGoodCollectionNum() {
		return goodCollectionNum;
	}

	/**
	 * 设置收藏数量
	 *
	 * @param goodCollectionNum
	 *            收藏数量
	 */
	public void setGoodCollectionNum(Integer goodCollectionNum) {
		this.goodCollectionNum = goodCollectionNum;
	}

	/**
	 * 获取销量卖出
	 *
	 * @return good_sale_num - 销量卖出
	 */
	public Integer getGoodSaleNum() {
		return goodSaleNum;
	}

	/**
	 * 设置销量卖出
	 *
	 * @param goodSaleNum
	 *            销量卖出
	 */
	public void setGoodSaleNum(Integer goodSaleNum) {
		this.goodSaleNum = goodSaleNum;
	}

	/**
	 * 获取0:准备上架１:上架２:下架
	 *
	 * @return good_state - 0:准备上架１:上架２:下架
	 */
	public Integer getGoodState() {
		return goodState;
	}

	/**
	 * 设置0:准备上架１:上架２:下架
	 *
	 * @param goodState
	 *            0:准备上架１:上架２:下架
	 */
	public void setGoodState(Integer goodState) {
		this.goodState = goodState;
	}

	@Transient
	public String getGoodStateName() {
		if (goodState == 0) {
			return "准备上架";
		} else if (goodState == 1) {
			return "上架";
		} else if (goodState == 2) {
			return "下架";
		}
		return "未知";
	}

	public void setGoodStateName(String goodStateName) {
		this.goodStateName = goodStateName;
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

	/**
	 * 获取商品详情
	 *
	 * @return good_detail - 商品详情
	 */
	public String getGoodDetail() {
		return goodDetail;
	}

	/**
	 * 设置商品详情
	 *
	 * @param goodDetail
	 *            商品详情
	 */
	public void setGoodDetail(String goodDetail) {
		this.goodDetail = goodDetail;
	}

	public GoodTypeSmall getGoodTypeSmall() {
		return goodTypeSmall;
	}

	public void setGoodTypeSmall(GoodTypeSmall goodTypeSmall) {
		this.goodTypeSmall = goodTypeSmall;
	}

	@Override
	public String toString() {
		return "Good [pkGoodId=" + pkGoodId + ", fkGoodTypeSmallId=" + fkGoodTypeSmallId + ", goodName=" + goodName
				+ ", goodTitle=" + goodTitle + ", goodSubTitle=" + goodSubTitle + ", goodPrice=" + goodPrice
				+ ", goodCoverImg=" + goodCoverImg + ", goodCarouselImgs=" + goodCarouselImgs + ", goodFreight="
				+ goodFreight + ", goodNum=" + goodNum + ", goodCollectionNum=" + goodCollectionNum + ", goodSaleNum="
				+ goodSaleNum + ", goodState=" + goodState + ", createTime=" + createTime + ", updateTime=" + updateTime
				+ ", isDelete=" + isDelete + ", goodDetail=" + goodDetail + "]";
	}

	
}