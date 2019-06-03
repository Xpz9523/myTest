package org.wx.jiu.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
/*****************
 * 手机短信配置
 * @author Ht
 *
 */
public class SmsUnit {

	private DefaultHttpClient httpclient;
	private String host = "";
	private HttpPost httppost;
	
	public String getHost() {
		return host;
	}


	public void setHost(String host) {
		this.host = host;
	}


	public SmsUnit(String host) {
		super();
		this.httpclient =  new DefaultHttpClient();
		this.host = "http://"+host;
	}


	private synchronized String doPost(List<NameValuePair> formparams) {
		HttpEntity httpEntity = null;
		try {
			UrlEncodedFormEntity initEntity = new UrlEncodedFormEntity(
					formparams, "UTF-8");
			httppost.setEntity(initEntity);
			HttpResponse response = httpclient.execute(httppost);
			httpEntity = response.getEntity();
			String string = EntityUtils.toString(httpEntity);
			//System.out.println(string);
			return string;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(httpEntity!=null){
				try {
					httpEntity.getContent().close();
					httpEntity=null;
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		return null;
	}

		
	// 检查Email
	public void sendSdk(String accId,String accPwd,String aimcodes,String content,String schTime,String bizId,String dataType,String msgId) {
		httppost = new HttpPost(host+"/send");
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("accId", accId));
		formparams.add(new BasicNameValuePair("accName", "13135693526"));//账户
		formparams.add(new BasicNameValuePair("accPwd", MD5.getMd5String("13636767951")));//密码
		formparams.add(new BasicNameValuePair("aimcodes", aimcodes));//手机号码
		formparams.add(new BasicNameValuePair("content", content));//内容
		formparams.add(new BasicNameValuePair("schTime", schTime));
		formparams.add(new BasicNameValuePair("bizId", bizId));
		formparams.add(new BasicNameValuePair("dataType", dataType));
		//formparams.add(new BasicNameValuePair("msgId", msgId));
		try {
			System.out.println(doPost(formparams));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 检查Email
	public void qryBlalance( String accName, String accPwd,String dataType) {
		httppost = new HttpPost(host+"/qryBalance");
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("accName", accName));
		formparams.add(new BasicNameValuePair("accPwd", accPwd));
		formparams.add(new BasicNameValuePair("dataType", dataType));
		try {
			System.out.println(doPost(formparams));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}



