package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

@Table(name = "size")
public class Size {
    /**
     * 规格种类编号
     */
    @Id
    @Column(name = "pk_size_id")
    private Integer pkSizeId;

    /**
     * 规格种类名称
     */
    @Column(name = "size_name")
    private String sizeName;

    /**
     * 描述
     */
    @Column(name = "size_remark")
    private String sizeRemark;

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
     * 获取规格种类编号
     *
     * @return pk_size_id - 规格种类编号
     */
    public Integer getPkSizeId() {
        return pkSizeId;
    }

    /**
     * 设置规格种类编号
     *
     * @param pkSizeId 规格种类编号
     */
    public void setPkSizeId(Integer pkSizeId) {
        this.pkSizeId = pkSizeId;
    }

    /**
     * 获取规格种类名称
     *
     * @return size_name - 规格种类名称
     */
    public String getSizeName() {
        return sizeName;
    }

    /**
     * 设置规格种类名称
     *
     * @param sizeName 规格种类名称
     */
    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }

    /**
     * 获取描述
     *
     * @return size_remark - 描述
     */
    public String getSizeRemark() {
        return sizeRemark;
    }

    /**
     * 设置描述
     *
     * @param sizeRemark 描述
     */
    public void setSizeRemark(String sizeRemark) {
        this.sizeRemark = sizeRemark;
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