package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

@Table(name = "good_type_small")
public class GoodTypeSmall {
    /**
     * 子类型主键ID
     */
    @Id
    @Column(name = "pk_type_small_id")
    private Integer pkTypeSmallId;

  
	 /**
	  *   @author GG
	 * @time 2018年3月12日 11:36:08
	 * @作用 通过大類型类型id来关联小類型對象类型
	  */
    private  GoodTypeBig goodTypeBig;
    
   

	/**
     * 父ID的商品类型
     */
    @Column(name = "fk_type_big_id")
    private Integer fkTypeBigId;

    /**
     * 小类名称
     */
    @Column(name = "type_small_name")
    private String typeSmallName;

    /**
     * 图片
     */
    @Column(name = "type_small_img")
    private String typeSmallImg;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @Column(name = "update_time")
    private Date updateTime;

    /**
     * 0 删除 1未删除
     */
    @Column(name = "is_delete")
    private Integer isDelete;

    /**
     * 获取子类型主键ID
     *
     * @return pk_type_small_id - 子类型主键ID
     */
    public Integer getPkTypeSmallId() {
        return pkTypeSmallId;
    }

    /**
     * 设置子类型主键ID
     *
     * @param pkTypeSmallId 子类型主键ID
     */
    public void setPkTypeSmallId(Integer pkTypeSmallId) {
        this.pkTypeSmallId = pkTypeSmallId;
    }

    /**
     * 获取父ID的商品类型
     *
     * @return fk_type_big_id - 父ID的商品类型
     */
    public Integer getFkTypeBigId() {
        return fkTypeBigId;
    }

    /**
     * 设置父ID的商品类型
     *
     * @param fkTypeBigId 父ID的商品类型
     */
    public void setFkTypeBigId(Integer fkTypeBigId) {
        this.fkTypeBigId = fkTypeBigId;
    }

    /**
     * 获取小类名称
     *
     * @return type_small_name - 小类名称
     */
    public String getTypeSmallName() {
        return typeSmallName;
    }

    /**
     * 设置小类名称
     *
     * @param typeSmallName 小类名称
     */
    public void setTypeSmallName(String typeSmallName) {
        this.typeSmallName = typeSmallName;
    }

    /**
     * 获取图片
     *
     * @return type_small_img - 图片
     */
    public String getTypeSmallImg() {
        return typeSmallImg;
    }

    /**
     * 设置图片
     *
     * @param typeSmallImg 图片
     */
    public void setTypeSmallImg(String typeSmallImg) {
        this.typeSmallImg = typeSmallImg;
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

    
    public GoodTypeBig getGoodTypeBig() {
		return goodTypeBig;
	}

	public void setGoodTypeBig(GoodTypeBig goodTypeBig) {
		this.goodTypeBig = goodTypeBig;
	}
	@Override
	public String toString() {
		return "GoodTypeSmall [pkTypeSmallId=" + pkTypeSmallId + ", fkTypeBigId=" + fkTypeBigId + ", typeSmallName="
				+ typeSmallName + ", typeSmallImg=" + typeSmallImg + ", createTime=" + createTime + ", updateTime="
				+ updateTime + ", isDelete=" + isDelete + "]";
	}
    
    
}