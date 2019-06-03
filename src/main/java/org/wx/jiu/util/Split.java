package org.wx.jiu.util;

public class Split {

	public static String splitFood(String img) {
	/*	System.out.println("进入split"+img.length());
		String newImg = img.substring(33);
		String newImg1 = img.substring(51);
		return newImg;*/
		String[] newImg = img.split("\\\\");

		//System.out.println("我不知道：" + newImg.length);
		String newIngs = "\\" + newImg[6] + "\\" + newImg[7] + "\\" + newImg[8]+"\\"+newImg[9]+"\\"+newImg[10]+"\\"+newImg[11];
		System.out.println(newIngs);
		return newIngs;
	}

		
	
}
