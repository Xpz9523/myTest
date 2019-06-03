package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;



@Table(name = "order_info")
public class OrderInfo {
    /**
     * uuid 字符串唯一   不自增
     */
    @Id
    @Column(name = "pk_order_info_id")
    private String pkOrderInfoId;

    /**
     * 用户id
     */
    @Column(name = "fk_user_id")
    private Integer fkUserId;
    
    private User user;

    /**
     * 收货地址表id
     */
    @Column(name = "fk_address_id")
    private Integer fkAddressId;
    
    private Address address;
    /**
     * 订单号 格式:当前时间+流水号
     */
    @Column(name = "order_info_no")
    private String orderInfoNo;

    /**
     * 运费
     */
    @Column(name = "order_info_freight")
    private Double orderInfoFreight;

    /**
     * 订单金额
     */
    @Column(name = "order_info_money")
    private Double orderInfoMoney;

    /**
     * 状态 0 未付款 1 已付款 2 未发货 3已发货 4 已签收
     */
    @Column(name = "order_info_state")
    private Integer orderInfoState;

    /**
     * 支付方式 1 微信 2支付宝
     */
    @Column(name = "pay_method")
    private Integer payMethod;

    /**
     * 付款时间
     */
    @Column(name = "pay_time")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy/MM/dd HH:mm:ss")
    private Date payTime;

    /**
     * 发货时间
     */
    @Column(name = "delivery_time")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy/MM/dd HH:mm:ss")
    private Date deliveryTime;

    /**
     * 收货时间(签收的时间)
     */
    @Column(name = "receiving_time")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy/MM/dd HH:mm:ss")
    private Date receivingTime;

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
     * 是否评价 0 未评价 1已评价
     */
    @Column(name = "is_comment")
    private Integer isComment;

    /**
     * 获取uuid 字符串唯一   不自增
     *
     * @return pk_order_info_id - uuid 字符串唯一   不自增
     */
    public String getPkOrderInfoId() {
        return pkOrderInfoId;
    }

    /**
     * 设置uuid 字符串唯一   不自增
     *
     * @param pkOrderInfoId uuid 字符串唯一   不自增
     */
    public void setPkOrderInfoId(String pkOrderInfoId) {
        this.pkOrderInfoId = pkOrderInfoId;
    }

    /**
     * 获取用户id
     *
     * @return fk_user_id - 用户id
     */
    public Integer getFkUserId() {
        return fkUserId;
    }

    /**
     * 设置用户id
     *
     * @param fkUserId 用户id
     */
    public void setFkUserId(Integer fkUserId) {
        this.fkUserId = fkUserId;
    }

    /**
     * 获取收货地址表id
     *
     * @return fk_address_id - 收货地址表id
     */
    public Integer getFkAddressId() {
        return fkAddressId;
    }

    /**
     * 设置收货地址表id
     *
     * @param fkAddressId 收货地址表id
     */
    public void setFkAddressId(Integer fkAddressId) {
        this.fkAddressId = fkAddressId;
    }

    /**
     * 获取订单号 格式:当前时间+流水号
     *
     * @return order_info_no - 订单号 格式:当前时间+流水号
     */
    public String getOrderInfoNo() {
        return orderInfoNo;
    }

    /**
     * 设置订单号 格式:当前时间+流水号
     *
     * @param orderInfoNo 订单号 格式:当前时间+流水号
     */
    public void setOrderInfoNo(String orderInfoNo) {
        this.orderInfoNo = orderInfoNo;
    }

    /**
     * 获取运费
     *
     * @return order_info_freight - 运费
     */
    public Double getOrderInfoFreight() {
        return orderInfoFreight;
    }

    /**
     * 设置运费
     *
     * @param orderInfoFreight 运费
     */
    public void setOrderInfoFreight(Double orderInfoFreight) {
        this.orderInfoFreight = orderInfoFreight;
    }

    /**
     * 获取订单金额
     *
     * @return order_info_money - 订单金额
     */
    public Double getOrderInfoMoney() {
        return orderInfoMoney;
    }

    /**
     * 设置订单金额
     *
     * @param orderInfoMoney 订单金额
     */
    public void setOrderInfoMoney(Double orderInfoMoney) {
        this.orderInfoMoney = orderInfoMoney;
    }

    /**
     * 获取状态 0 未付款 1 已付款 2 未发货 3已发货 4 已签收
     *
     * @return order_info_state - 状态 0 未付款 1 已付款 2 未发货 3已发货 4 已签收
     */
    public Integer getOrderInfoState() {
        return orderInfoState;
    }

    /**
     * 设置状态 0 未付款 1 已付款 2 未发货 3已发货 4 已签收
     *
     * @param orderInfoState 状态 0 未付款 1 已付款 2 未发货 3已发货 4 已签收
     */
    public void setOrderInfoState(Integer orderInfoState) {
        this.orderInfoState = orderInfoState;
    }

    /**
     * 获取支付方式 1 微信 2支付宝
     *
     * @return pay_method - 支付方式 1 微信 2支付宝
     */
    public Integer getPayMethod() {
        return payMethod;
    }

    /**
     * 设置支付方式 1 微信 2支付宝
     *
     * @param payMethod 支付方式 1 微信 2支付宝
     */
    public void setPayMethod(Integer payMethod) {
        this.payMethod = payMethod;
    }

    /**
     * 获取付款时间
     *
     * @return pay_time - 付款时间
     */
    public Date getPayTime() {
        return payTime;
    }

    /**
     * 设置付款时间
     *
     * @param payTime 付款时间
     */
    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    /**
     * 获取发货时间
     *
     * @return delivery_time - 发货时间
     */
    public Date getDeliveryTime() {
        return deliveryTime;
    }

    /**
     * 设置发货时间
     *
     * @param deliveryTime 发货时间
     */
    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    /**
     * 获取收货时间(签收的时间)
     *
     * @return receiving_time - 收货时间(签收的时间)
     */
    public Date getReceivingTime() {
        return receivingTime;
    }

    /**
     * 设置收货时间(签收的时间)
     *
     * @param receivingTime 收货时间(签收的时间)
     */
    public void setReceivingTime(Date receivingTime) {
        this.receivingTime = receivingTime;
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

    /**
     * 获取是否评价 0 未评价 1已评价
     *
     * @return is_comment - 是否评价 0 未评价 1已评价
     */
    public Integer getIsComment() {
        return isComment;
    }

    /**
     * 设置是否评价 0 未评价 1已评价
     *
     * @param isComment 是否评价 0 未评价 1已评价
     */
    public void setIsComment(Integer isComment) {
        this.isComment = isComment;
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
    
}