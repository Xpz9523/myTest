package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;

@Table(name = "order_info_detail")
public class OrderInfoDetail {
    /**
     * 订单明细uuid
     */
    @Id
    @Column(name = "pk_order_info_detail_id")
    private String pkOrderInfoDetailId;

    /**
     * 商品表id
     */
    @Column(name = "fk_good_id")
    private Integer fkGoodId;

    /**
     * 订单表id
     */
    @Column(name = "fk_order_info_id")
    private String fkOrderInfoId;

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
    @Column(name = "specifications_info")
    private String specificationsInfo;

    /**
     * 创建时间(也是订单创建的时间)
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
     * 获取订单明细uuid
     *
     * @return pk_order_info_detail_id - 订单明细uuid
     */
    public String getPkOrderInfoDetailId() {
        return pkOrderInfoDetailId;
    }

    /**
     * 设置订单明细uuid
     *
     * @param pkOrderInfoDetailId 订单明细uuid
     */
    public void setPkOrderInfoDetailId(String pkOrderInfoDetailId) {
        this.pkOrderInfoDetailId = pkOrderInfoDetailId;
    }

    /**
     * 获取商品表id
     *
     * @return fk_good_id - 商品表id
     */
    public Integer getFkGoodId() {
        return fkGoodId;
    }

    /**
     * 设置商品表id
     *
     * @param fkGoodId 商品表id
     */
    public void setFkGoodId(Integer fkGoodId) {
        this.fkGoodId = fkGoodId;
    }

    /**
     * 获取订单表id
     *
     * @return fk_order_info_id - 订单表id
     */
    public String getFkOrderInfoId() {
        return fkOrderInfoId;
    }

    /**
     * 设置订单表id
     *
     * @param fkOrderInfoId 订单表id
     */
    public void setFkOrderInfoId(String fkOrderInfoId) {
        this.fkOrderInfoId = fkOrderInfoId;
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
     * @param num 订购数量
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
     * @param title 商品标题
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
     * @param price 商品单价
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
     * @param countMoney 总价格
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
     * @param goodImg 商品封面
     */
    public void setGoodImg(String goodImg) {
        this.goodImg = goodImg;
    }

    /**
     * 获取商品规格信息
     *
     * @return specifications_info - 商品规格信息
     */
    public String getSpecificationsInfo() {
        return specificationsInfo;
    }

    /**
     * 设置商品规格信息
     *
     * @param specificationsInfo 商品规格信息
     */
    public void setSpecificationsInfo(String specificationsInfo) {
        this.specificationsInfo = specificationsInfo;
    }

    /**
     * 获取创建时间(也是订单创建的时间)
     *
     * @return create_time - 创建时间(也是订单创建的时间)
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间(也是订单创建的时间)
     *
     * @param createTime 创建时间(也是订单创建的时间)
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