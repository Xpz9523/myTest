package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties
@Table(name = "carousel")
public class Carousel {
    /**
     * 编号
     */
    @Id
    @Column(name = "pk_carousel_id")
    private Integer pkCarouselId;

    /**
     * 点击轮播图跳转的商品详情id
     */
    @Column(name = "fk_good_id")
    private Integer fkGoodId;

    /**
     * 图片地址
     */
    @Column(name = "carousel_img")
    private String carouselImg;

    /**
     * 轮播描述
     */
    @Column(name = "carousel_remark")
    private String carouselRemark;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    @JsonFormat(timezone= "GMT+8",pattern = "yyyy/MM/dd HH:mm:ss")
    private Date createTime;

    /**
     * 更新时间
     */
    @Column(name = "update_time")
    @JsonFormat(timezone= "GMT+8",pattern = "yyyy/MM/dd HH:mm:ss")
    private Date updateTime;

    /**
     * 0 删除 1未删除
     */
    @Column(name = "is_delete")
    private Integer isDelete;

   /* private String goodName;
    
 

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}*/

	/**
     * 获取编号
     *
     * @return pk_carousel_id - 编号
     */
    public Integer getPkCarouselId() {
        return pkCarouselId;
    }

    /**
     * 设置编号
     *
     * @param pkCarouselId 编号
     */
    public void setPkCarouselId(Integer pkCarouselId) {
        this.pkCarouselId = pkCarouselId;
    }

    /**
     * 获取点击轮播图跳转的商品详情id
     *
     * @return fk_good_id - 点击轮播图跳转的商品详情id
     */
    public Integer getFkGoodId() {
        return fkGoodId;
    }

    /**
     * 设置点击轮播图跳转的商品详情id
     *
     * @param fkGoodId 点击轮播图跳转的商品详情id
     */
    public void setFkGoodId(Integer fkGoodId) {
        this.fkGoodId = fkGoodId;
    }

    /**
     * 获取图片地址
     *
     * @return carousel_img - 图片地址
     */
    public String getCarouselImg() {
        return carouselImg;
    }

    /**
     * 设置图片地址
     *
     * @param carouselImg 图片地址
     */
    public void setCarouselImg(String carouselImg) {
        this.carouselImg = carouselImg;
    }

    /**
     * 获取轮播描述
     *
     * @return carousel_remark - 轮播描述
     */
    public String getCarouselRemark() {
        return carouselRemark;
    }

    /**
     * 设置轮播描述
     *
     * @param carouselRemark 轮播描述
     */
    public void setCarouselRemark(String carouselRemark) {
        this.carouselRemark = carouselRemark;
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
     * @param createTime 创建时间
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
     * @param updateTime 更新时间
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
     * @param isDelete 0 删除 1未删除
     */
    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}