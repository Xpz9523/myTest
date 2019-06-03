package org.wx.jiu.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;


/***********
 * 发送手机短信
 * 
 * @author Ht
 *
 */
public class SendSms {
	
/*	public static void main(String[] args) {
		new SendSms().sendSms("yangchao_713@163.com", "123456", "13592605881", "下午好【杨超】");
	}
	*/
	public String sendSms(String mobies,String content){
/*		StringBuffer sb = new StringBuffer("http://www.lx198.com/sdk/send?");*/
		StringBuffer sb = new StringBuffer("http://www.lx198.com/sdk/send?");
		try {
			sb.append("&accName="+"13135693526"); 
			sb.append("&accPwd="+MD5.getMd5String("13636767951")); 
			sb.append("&aimcodes="+mobies);
			sb.append("&content="+URLEncoder.encode(content,"UTF-8"));
			sb.append("&dataType=string");
			URL url = new URL(sb.toString());
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			return in.readLine();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
