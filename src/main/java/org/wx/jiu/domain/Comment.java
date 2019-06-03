package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

@Table(name = "comment")
public class Comment {
    /**
     * 评论编号
     */
    @Id
    @Column(name = "pk_comment_id")
    private Integer pkCommentId;

    /**
     * 用户ID
     */
    @Column(name = "fk_user_id")
    private Integer fkUserId;

    /**
     * 商品id
     */
    @Column(name = "fk_good_id")
    private Integer fkGoodId;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 评价等级 1~5 颗星星
     */
    @Column(name = "comment_level")
    private Integer commentLevel;

    /**
     * 是否匿名 0 匿名 1 显示用户名
     */
    @Column(name = "is_show_name")
    private Integer isShowName;

    /**
     * 晒图 url
     */
    @Column(name = "show_imgs")
    private String showImgs;

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
     * 获取评论编号
     *
     * @return pk_comment_id - 评论编号
     */
    public Integer getPkCommentId() {
        return pkCommentId;
    }

    /**
     * 设置评论编号
     *
     * @param pkCommentId 评论编号
     */
    public void setPkCommentId(Integer pkCommentId) {
        this.pkCommentId = pkCommentId;
    }

    /**
     * 获取用户ID
     *
     * @return fk_user_id - 用户ID
     */
    public Integer getFkUserId() {
        return fkUserId;
    }

    /**
     * 设置用户ID
     *
     * @param fkUserId 用户ID
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
     * @param fkGoodId 商品id
     */
    public void setFkGoodId(Integer fkGoodId) {
        this.fkGoodId = fkGoodId;
    }

    /**
     * 获取评论内容
     *
     * @return content - 评论内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置评论内容
     *
     * @param content 评论内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取评价等级 1~5 颗星星
     *
     * @return comment_level - 评价等级 1~5 颗星星
     */
    public Integer getCommentLevel() {
        return commentLevel;
    }

    /**
     * 设置评价等级 1~5 颗星星
     *
     * @param commentLevel 评价等级 1~5 颗星星
     */
    public void setCommentLevel(Integer commentLevel) {
        this.commentLevel = commentLevel;
    }

    /**
     * 获取是否匿名 0 匿名 1 显示用户名
     *
     * @return is_show_name - 是否匿名 0 匿名 1 显示用户名
     */
    public Integer getIsShowName() {
        return isShowName;
    }

    /**
     * 设置是否匿名 0 匿名 1 显示用户名
     *
     * @param isShowName 是否匿名 0 匿名 1 显示用户名
     */
    public void setIsShowName(Integer isShowName) {
        this.isShowName = isShowName;
    }

    /**
     * 获取晒图 url
     *
     * @return show_imgs - 晒图 url
     */
    public String getShowImgs() {
        return showImgs;
    }

    /**
     * 设置晒图 url
     *
     * @param showImgs 晒图 url
     */
    public void setShowImgs(String showImgs) {
        this.showImgs = showImgs;
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