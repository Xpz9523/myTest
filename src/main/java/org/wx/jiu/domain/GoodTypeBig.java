package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;

@Table(name = "good_type_big")
public class GoodTypeBig {
    /**
     * 商品类型编号
     */
    @Id
    @Column(name = "pk_type_big_id")
    private Integer pkTypeBigId;

    /**
     * 商品类型名称
     */
    @Column(name = "type_big_name")
    private String typeBigName;

    /**
     * 描述
     */
    @Column(name = "type_big_remark")
    private String typeBigRemark;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 更新时间
     */
    @Column(name = "update_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    /**
     * 0 删除 1未删除
     */
    @Column(name = "is_delete")
    private Integer isDelete;

    /**
     * 获取商品类型编号
     *
     * @return pk_type_big_id - 商品类型编号
     */
    public Integer getPkTypeBigId() {
        return pkTypeBigId;
    }

    /**
     * 设置商品类型编号
     *
     * @param pkTypeBigId 商品类型编号
     */
    public void setPkTypeBigId(Integer pkTypeBigId) {
        this.pkTypeBigId = pkTypeBigId;
    }

    /**
     * 获取商品类型名称
     *
     * @return type_big_name - 商品类型名称
     */
    public String getTypeBigName() {
        return typeBigName;
    }

    /**
     * 设置商品类型名称
     *
     * @param typeBigName 商品类型名称
     */
    public void setTypeBigName(String typeBigName) {
        this.typeBigName = typeBigName;
    }

    /**
     * 获取描述
     *
     * @return type_big_remark - 描述
     */
    public String getTypeBigRemark() {
        return typeBigRemark;
    }

    /**
     * 设置描述
     *
     * @param typeBigRemark 描述
     */
    public void setTypeBigRemark(String typeBigRemark) {
        this.typeBigRemark = typeBigRemark;
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

	@Override
	public String toString() {
		return "GoodTypeBig [pkTypeBigId=" + pkTypeBigId + ", typeBigName=" + typeBigName + ", typeBigRemark="
				+ typeBigRemark + ", createTime=" + createTime + ", updateTime=" + updateTime + ", isDelete=" + isDelete
				+ "]";
	}
    
}