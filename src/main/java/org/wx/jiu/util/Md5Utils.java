/**
 * 代号:隐无为 2017：厚溥
 * 文件名：MD5.java
 * 创建人：柯栋
 * 日期：2017年2月28日
 * 修改人：
 * 描述：
 */
package org.wx.jiu.util;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.util.StringUtils;

/**
 * 用途：md5 加密
 */
public class Md5Utils {

	/**
	 * @功能: 获取MD5摘要
	 * @作者: 柯栋 @代号:隐无为
	 * @时间: 2017年2月28日
	 * @param key:秘钥
	 * @param str:需要加密的字符串
	 * @return
	 */
	public static String getMd5(String key, String str) {
		if (StringUtils.isEmpty(str)) {
			return "";
		}
		return DigestUtils.md5Hex(key + str);
	}

	/**
	 * @功能: 获取MD5摘要
	 * @作者: 柯栋 @代号:隐无为
	 * @时间: 2017年2月28日
	 * @param key:秘钥
	 * @param str:需要加密的字符串
	 * @return
	 */
	public static String getMd5(String str) {
		if (StringUtils.isEmpty(str)) {
			return "";
		}
		return DigestUtils.md5Hex(WebConstant.MD5KEY + str);
	}

}
