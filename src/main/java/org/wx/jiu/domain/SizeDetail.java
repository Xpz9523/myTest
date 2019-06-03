package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

@Table(name = "size_detail")
public class SizeDetail {
    @Id
    @Column(name = "pk_size_detail_id")
    private Integer pkSizeDetailId;

    /**
     * hp_specifications 表 id
     */
    @Column(name = "fk_size_id")
    private Integer fkSizeId;

    /**
     * 规格种类明细名称
     */
    @Column(name = "size_detail_name")
    private String sizeDetailName;

    /**
     * 描述
     */
    @Column(name = "size_detail_remark")
    private String sizeDetailRemark;

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
     * @return pk_size_detail_id
     */
    public Integer getPkSizeDetailId() {
        return pkSizeDetailId;
    }

    /**
     * @param pkSizeDetailId
     */
    public void setPkSizeDetailId(Integer pkSizeDetailId) {
        this.pkSizeDetailId = pkSizeDetailId;
    }

    /**
     * 获取hp_specifications 表 id
     *
     * @return fk_size_id - hp_specifications 表 id
     */
    public Integer getFkSizeId() {
        return fkSizeId;
    }

    /**
     * 设置hp_specifications 表 id
     *
     * @param fkSizeId hp_specifications 表 id
     */
    public void setFkSizeId(Integer fkSizeId) {
        this.fkSizeId = fkSizeId;
    }

    /**
     * 获取规格种类明细名称
     *
     * @return size_detail_name - 规格种类明细名称
     */
    public String getSizeDetailName() {
        return sizeDetailName;
    }

    /**
     * 设置规格种类明细名称
     *
     * @param sizeDetailName 规格种类明细名称
     */
    public void setSizeDetailName(String sizeDetailName) {
        this.sizeDetailName = sizeDetailName;
    }

    /**
     * 获取描述
     *
     * @return size_detail_remark - 描述
     */
    public String getSizeDetailRemark() {
        return sizeDetailRemark;
    }

    /**
     * 设置描述
     *
     * @param sizeDetailRemark 描述
     */
    public void setSizeDetailRemark(String sizeDetailRemark) {
        this.sizeDetailRemark = sizeDetailRemark;
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
		return "SizeDetail [pkSizeDetailId=" + pkSizeDetailId + ", fkSizeId=" + fkSizeId + ", sizeDetailName="
				+ sizeDetailName + ", sizeDetailRemark=" + sizeDetailRemark + ", createTime=" + createTime
				+ ", updateTime=" + updateTime + ", isDelete=" + isDelete + "]";
	}
    
}