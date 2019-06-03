package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;

@Table(name = "address")
public class Address {
    /**
     * 地址编号
     */
    @Id
    @Column(name = "pk_address_id")
    private Integer pkAddressId;

    /**
     * 用户表id
     */
    @Column(name = "fk_user_id")
    private Integer fkUserId;

    /**
     * 收货人姓名
     */
    @Column(name = "person_name")
    private String personName;

    /**
     * 收货人电话
     */
    @Column(name = "person_phone")
    private String personPhone;

    /**
     * 省
     */
    private String sheng;

    /**
     * 省编码
     */
    @Column(name = "sheng_code")
    private String shengCode;

    /**
     * 市
     */
    private String city;

    /**
     * 市编码
     */
    @Column(name = "city_code")
    private String cityCode;

    /**
     * 区域
     */
    private String area;

    /**
     * 区域编码
     */
    @Column(name = "area_code")
    private String areaCode;

    /**
     * 详细地址
     */
    @Column(name = "detail_address")
    private String detailAddress;

    /**
     * 是否默认地址  0不是 1是
     */
    @Column(name = "is_default")
    private Integer isDefault;

    /**
     * 创建时间
     */
    @Column(name = "createTime")
    @JsonFormat(timezone= "GMT+8",pattern = "yyyy/MM/dd HH:mm:ss")
    private Date createtime;

    /**
     * 更新时间
     */
    @Column(name = "updateTime")
    @JsonFormat(timezone= "GMT+8",pattern = "yyyy/MM/dd HH:mm:ss")
    private Date updatetime;

    /**
     * 0 删除 1未删除
     */
    @Column(name = "is_delete")
    private Integer isDelete;

    /**
     * 获取地址编号
     *
     * @return pk_address_id - 地址编号
     */
    public Integer getPkAddressId() {
        return pkAddressId;
    }

    /**
     * 设置地址编号
     *
     * @param pkAddressId 地址编号
     */
    public void setPkAddressId(Integer pkAddressId) {
        this.pkAddressId = pkAddressId;
    }

    /**
     * 获取用户表id
     *
     * @return fk_user_id - 用户表id
     */
    public Integer getFkUserId() {
        return fkUserId;
    }

    /**
     * 设置用户表id
     *
     * @param fkUserId 用户表id
     */
    public void setFkUserId(Integer fkUserId) {
        this.fkUserId = fkUserId;
    }

    /**
     * 获取收货人姓名
     *
     * @return person_name - 收货人姓名
     */
    public String getPersonName() {
        return personName;
    }

    /**
     * 设置收货人姓名
     *
     * @param personName 收货人姓名
     */
    public void setPersonName(String personName) {
        this.personName = personName;
    }

    /**
     * 获取收货人电话
     *
     * @return person_phone - 收货人电话
     */
    public String getPersonPhone() {
        return personPhone;
    }

    /**
     * 设置收货人电话
     *
     * @param personPhone 收货人电话
     */
    public void setPersonPhone(String personPhone) {
        this.personPhone = personPhone;
    }

    /**
     * 获取省
     *
     * @return sheng - 省
     */
    public String getSheng() {
        return sheng;
    }

    /**
     * 设置省
     *
     * @param sheng 省
     */
    public void setSheng(String sheng) {
        this.sheng = sheng;
    }

    /**
     * 获取省编码
     *
     * @return sheng_code - 省编码
     */
    public String getShengCode() {
        return shengCode;
    }

    /**
     * 设置省编码
     *
     * @param shengCode 省编码
     */
    public void setShengCode(String shengCode) {
        this.shengCode = shengCode;
    }

    /**
     * 获取市
     *
     * @return city - 市
     */
    public String getCity() {
        return city;
    }

    /**
     * 设置市
     *
     * @param city 市
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * 获取市编码
     *
     * @return city_code - 市编码
     */
    public String getCityCode() {
        return cityCode;
    }

    /**
     * 设置市编码
     *
     * @param cityCode 市编码
     */
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    /**
     * 获取区域
     *
     * @return area - 区域
     */
    public String getArea() {
        return area;
    }

    /**
     * 设置区域
     *
     * @param area 区域
     */
    public void setArea(String area) {
        this.area = area;
    }

    /**
     * 获取区域编码
     *
     * @return area_code - 区域编码
     */
    public String getAreaCode() {
        return areaCode;
    }

    /**
     * 设置区域编码
     *
     * @param areaCode 区域编码
     */
    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    /**
     * 获取详细地址
     *
     * @return detail_address - 详细地址
     */
    public String getDetailAddress() {
        return detailAddress;
    }

    /**
     * 设置详细地址
     *
     * @param detailAddress 详细地址
     */
    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    /**
     * 获取是否默认地址  0不是 1是
     *
     * @return is_default - 是否默认地址  0不是 1是
     */
    public Integer getIsDefault() {
        return isDefault;
    }

    /**
     * 设置是否默认地址  0不是 1是
     *
     * @param isDefault 是否默认地址  0不是 1是
     */
    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    /**
     * 获取创建时间
     *
     * @return createTime - 创建时间
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * 设置创建时间
     *
     * @param createtime 创建时间
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * 获取更新时间
     *
     * @return updateTime - 更新时间
     */
    public Date getUpdatetime() {
        return updatetime;
    }

    /**
     * 设置更新时间
     *
     * @param updatetime 更新时间
     */
    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
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
		return "Address [pkAddressId=" + pkAddressId + ", fkUserId=" + fkUserId + ", personName=" + personName
				+ ", personPhone=" + personPhone + ", sheng=" + sheng + ", shengCode=" + shengCode + ", city=" + city
				+ ", cityCode=" + cityCode + ", area=" + area + ", areaCode=" + areaCode + ", detailAddress="
				+ detailAddress + ", isDefault=" + isDefault + ", createtime=" + createtime + ", updatetime="
				+ updatetime + ", isDelete=" + isDelete + "]";
	}
    
}