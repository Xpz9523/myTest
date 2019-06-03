package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

@Table(name = "user_level")
public class UserLevel {
    @Id
    @Column(name = "pk_user_level_id")
    private Integer pkUserLevelId;

    @Column(name = "user_level_name")
    private String userLevelName;

    /**
     * 描述
     */
    @Column(name = "user_level_remark")
    private String userLevelRemark;

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
     * @return pk_user_level_id
     */
    public Integer getPkUserLevelId() {
        return pkUserLevelId;
    }

    /**
     * @param pkUserLevelId
     */
    public void setPkUserLevelId(Integer pkUserLevelId) {
        this.pkUserLevelId = pkUserLevelId;
    }

    /**
     * @return user_level_name
     */
    public String getUserLevelName() {
        return userLevelName;
    }

    /**
     * @param userLevelName
     */
    public void setUserLevelName(String userLevelName) {
        this.userLevelName = userLevelName;
    }

    /**
     * 获取描述
     *
     * @return user_level_remark - 描述
     */
    public String getUserLevelRemark() {
        return userLevelRemark;
    }

    /**
     * 设置描述
     *
     * @param userLevelRemark 描述
     */
    public void setUserLevelRemark(String userLevelRemark) {
        this.userLevelRemark = userLevelRemark;
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