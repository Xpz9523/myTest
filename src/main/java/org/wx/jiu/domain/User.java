package org.wx.jiu.domain;

import java.util.Date;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "user")
public class User {
	/**
	 * 用户编号
	 */
	@Id
	@Column(name = "pk_user_id")
	private Integer pkUserId;

	/**
	 * 用户等级表 id
	 */
	@Column(name = "fk_user_level_id")
	private Integer fkUserLevelId;

	/**
	 * 关联用户等级表
	 */
	private UserLevel userLevel;

	/**
	 * 登录名
	 */
	@Column(name = "login_name")
	private String loginName;

	/**
	 * 登录密码 md5
	 */
	@Column(name = "login_pwd")
	private String loginPwd;

	/**
	 * 用户名称
	 */
	@Column(name = "user_name")
	private String userName;

	/**
	 * 电话
	 */
	@Column(name = "user_phone")
	private String userPhone;

	/**
	 * 邮箱
	 */
	@Column(name = "user_email")
	private String userEmail;

	/**
	 * 出生日期
	 */
	@Column(name = "user_birthday")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date userBirthday;

	/**
	 * 头像
	 */
	@Column(name = "user_headImg")
	private String userHeadimg;

	/**
	 * 性别 0 女 1 男
	 */
	@Column(name = "user_sex")
	private Integer userSex;

	/**
	 * 年龄
	 */
	@Column(name = "user_age")
	private Integer userAge;

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
	 * 是否是管理员 0 不是 1是
	 */
	@Column(name = "is_admin")
	private Integer isAdmin;

	/**
	 * 0 删除 1未删除
	 */
	@Column(name = "is_delete")
	private Integer isDelete;

	/**
	 * 0 未注册 1注册
	 */
	@Column(name = "is_register")
	private Integer isRegister;

	/**
	 * 获取用户编号
	 *
	 * @return pk_user_id - 用户编号
	 */
	public Integer getPkUserId() {
		return pkUserId;
	}

	/**
	 * 设置用户编号
	 *
	 * @param pkUserId
	 *            用户编号
	 */
	public void setPkUserId(Integer pkUserId) {
		this.pkUserId = pkUserId;
	}

	/**
	 * 获取用户等级表 id
	 *
	 * @return fk_user_level_id - 用户等级表 id
	 */
	public Integer getFkUserLevelId() {
		return fkUserLevelId;
	}

	/**
	 * 设置用户等级表 id
	 *
	 * @param fkUserLevelId
	 *            用户等级表 id
	 */
	public void setFkUserLevelId(Integer fkUserLevelId) {
		this.fkUserLevelId = fkUserLevelId;
	}

	/**
	 * 获取登录名
	 *
	 * @return loginName - 登录名
	 */
	public String getLoginName() {
		return loginName;
	}

	/**
	 * 设置登录名
	 *
	 * @param loginname
	 *            登录名
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	/**
	 * 获取登录密码 md5
	 *
	 * @return loginPwd - 登录密码 md5
	 */
	public String getLoginPwd() {
		return loginPwd;
	}

	/**
	 * 设置登录密码 md5
	 *
	 * @param loginpwd
	 *            登录密码 md5
	 */
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	/**
	 * 获取用户名称
	 *
	 * @return user_name - 用户名称
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 设置用户名称
	 *
	 * @param userName
	 *            用户名称
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 获取电话
	 *
	 * @return user_phone - 电话
	 */
	public String getUserPhone() {
		return userPhone;
	}

	/**
	 * 设置电话
	 *
	 * @param userPhone
	 *            电话
	 */
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	/**
	 * 获取邮箱
	 *
	 * @return user_email - 邮箱
	 */
	public String getUserEmail() {
		return userEmail;
	}

	/**
	 * 设置邮箱
	 *
	 * @param userEmail
	 *            邮箱
	 */
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	/**
	 * 获取出生日期
	 *
	 * @return user_birthday - 出生日期
	 */
	public Date getUserBirthday() {
		return userBirthday;
	}

	/**
	 * 设置出生日期
	 *
	 * @param userBirthday
	 *            出生日期
	 */
	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	/**
	 * 获取头像
	 *
	 * @return user_headImg - 头像
	 */
	public String getUserHeadimg() {
		return userHeadimg;
	}

	/**
	 * 设置头像
	 *
	 * @param userHeadimg
	 *            头像
	 */
	public void setUserHeadimg(String userHeadimg) {
		this.userHeadimg = userHeadimg;
	}

	/**
	 * 获取性别 0 女 1 男
	 *
	 * @return user_sex - 性别 0 女 1 男
	 */
	public Integer getUserSex() {
		return userSex;
	}

	/**
	 * 设置性别 0 女 1 男
	 *
	 * @param userSex
	 *            性别 0 女 1 男
	 */
	public void setUserSex(Integer userSex) {
		this.userSex = userSex;
	}

	/**
	 * 获取年龄
	 *
	 * @return user_age - 年龄
	 */
	public Integer getUserAge() {
		return userAge;
	}

	/**
	 * 设置年龄
	 *
	 * @param userAge
	 *            年龄
	 */
	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
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
	 * @param createTime
	 *            创建时间
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
	 * @param updateTime
	 *            更新时间
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 获取是否是管理员 0 不是 1是
	 *
	 * @return is_admin - 是否是管理员 0 不是 1是
	 */
	public Integer getIsAdmin() {
		return isAdmin;
	}

	/**
	 * 设置是否是管理员 0 不是 1是
	 *
	 * @param isAdmin
	 *            是否是管理员 0 不是 1是
	 */
	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
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
	 * @param isDelete
	 *            0 删除 1未删除
	 */
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	/**
	 * 获取0 未注册 1注册
	 *
	 * @return is_register - 0 未注册 1注册
	 */
	public Integer getIsRegister() {
		return isRegister;
	}

	/**
	 * 设置0 未注册 1注册
	 *
	 * @param isRegister
	 *            0 未注册 1注册
	 */
	public void setIsRegister(Integer isRegister) {
		this.isRegister = isRegister;
	}

	public UserLevel getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(UserLevel userLevel) {
		this.userLevel = userLevel;
	}

	@Override
	public String toString() {
		return "User [pkUserId=" + pkUserId + ", fkUserLevelId=" + fkUserLevelId + ", loginName=" + loginName
				+ ", loginPwd=" + loginPwd + ", userName=" + userName + ", userPhone=" + userPhone + ", userEmail="
				+ userEmail + ", userBirthday=" + userBirthday + ", userHeadimg=" + userHeadimg + ", userSex=" + userSex
				+ ", userAge=" + userAge + ", createTime=" + createTime + ", updateTime=" + updateTime + ", isAdmin="
				+ isAdmin + ", isDelete=" + isDelete + ", isRegister=" + isRegister + "]";
	}

}