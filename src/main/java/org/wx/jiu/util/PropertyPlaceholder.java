/**
 * 代号:隐无为 2017：厚溥
 * 文件名：PropertyPlaceholder.java
 * 创建人：柯栋
 * 日期：2017年2月28日
 * 修改人：
 * 描述：
 */
package org.wx.jiu.util;

import java.util.Properties;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * 用途：业务名称
 */
public class PropertyPlaceholder extends PropertyPlaceholderConfigurer {
	private static Properties properties;  
	@Override
	protected void processProperties(ConfigurableListableBeanFactory beanFactory, Properties props)
			throws BeansException {
		super.processProperties(beanFactory, props);
		properties = props;
	}

	public static String getValue(String key) {
		return properties.getProperty(key);
	}

	public static int getIntValue(String key) {
		return Integer.parseInt(properties.getProperty(key));
	}

	public static boolean getBooleanValue(String key) {
		return Boolean.parseBoolean(properties.getProperty(key));
	}
	//用法 http://blog.csdn.net/heboblog/article/details/49337279
	//PropertyPlaceholder.getValue("Cache-Control")  
}
