package org.wx.jiu.util;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

public class UploadUtil {

	public static  String uploadFile(MultipartFile file,String path) throws IOException{
		String name = file.getOriginalFilename();
		System.out.println("name"+name);
		String suffixName = name.substring(name.lastIndexOf("."));
		String hash = Integer.toHexString(new Random().nextInt());
		String fileName = hash+suffixName;
		System.out.println("+++**"+fileName);
		File  tempFile = new File(path,fileName);
		System.out.println("path："+path);
		if(!tempFile.getParentFile().exists()){
			tempFile.getParentFile().mkdirs();
		}
		if(tempFile.exists()){
			tempFile.delete();
		}
		tempFile.createNewFile();
		file.transferTo(tempFile);
		String  newPath =path+"\\"+ tempFile.getName();
		return newPath;
		
	}
	
}
