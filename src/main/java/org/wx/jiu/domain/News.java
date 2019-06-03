package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

@Table(name = "news")
public class News {
    /**
     * 新闻编号
     */
    @Id
    @Column(name = "pk_news_id")
    private Integer pkNewsId;

    /**
     * 标题
     */
    @Column(name = "news_title")
    private String newsTitle;

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
     * 内容
     */
    @Column(name = "news_content")
    private String newsContent;

    /**
     * 获取新闻编号
     *
     * @return pk_news_id - 新闻编号
     */
    public Integer getPkNewsId() {
        return pkNewsId;
    }

    /**
     * 设置新闻编号
     *
     * @param pkNewsId 新闻编号
     */
    public void setPkNewsId(Integer pkNewsId) {
        this.pkNewsId = pkNewsId;
    }

    /**
     * 获取标题
     *
     * @return news_title - 标题
     */
    public String getNewsTitle() {
        return newsTitle;
    }

    /**
     * 设置标题
     *
     * @param newsTitle 标题
     */
    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
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

    /**
     * 获取内容
     *
     * @return news_content - 内容
     */
    public String getNewsContent() {
        return newsContent;
    }

    /**
     * 设置内容
     *
     * @param newsContent 内容
     */
    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }
}