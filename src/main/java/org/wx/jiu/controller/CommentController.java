package org.wx.jiu.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.common.JsonResult;
import org.wx.jiu.domain.Comment;
import org.wx.jiu.domain.Good;
import org.wx.jiu.domain.User;

@Controller
public class CommentController extends BaseController {
   /**
    * 跳转到前台评论页面
    * @return
    */
	@RequestMapping("/Wine/view/gocommernt")
	public String goComment(){
		return"view/shopCar/commernt";
	}
   
	@RequestMapping("/Wine/view/addcommernt")
	@ResponseBody
   public String addCommernt( Comment model,HttpSession sion){
		JsonResult<Good> jsonResult = new JsonResult<>(500, "服务器异常");	
		/*User user = (User) sion.getAttribute("user");
		model.setFkUserId(user.getPkUserId());*/
		System.out.println(model.toString());
		CommentService.saveNoNull(model);
		if(CommentService.saveNoNull(model)>0){
			jsonResult.setCode(200);
			jsonResult.setMsg("添加成功");
		}
		return  responseAPI.getJsonString(jsonResult);
   }
// 上传多图片
	@RequestMapping(value = "/Wine/GoodUploadImgs", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadImgs(@RequestParam("file") MultipartFile files[], HttpServletRequest request) {
		System.out.println("------进入多文件上传-------");
		InputStream in = null;
		OutputStream out = null;
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<>();
		if (files != null) {
			// 获得需要上传文件的路径
			String uploadPath = request.getServletContext().getRealPath("/lib/common/img/commernt/");
			File uploadFile = new File(uploadPath);
			if (!uploadFile.exists()) {
				uploadFile.mkdirs();// 如果不存，创建新的文件目录
			}
			System.out.println("上传的路径为：----" + uploadPath);
			// 根据上传文件创建新的文件名
			String newFileName = "";
			try {
				for (int i = 0; i < files.length; i++) {
					newFileName = getNewFileName(files[i].getOriginalFilename());
					System.out.println("新文件名为：---" + newFileName);
					FileOutputStream fos = new FileOutputStream(uploadPath + "/" + newFileName);
					in = files[i].getInputStream();
					int b = 0;
					while ((b = in.read()) != -1) {
						fos.write(b);
					}
					map.put("code", 200);
					map.put("msg", "文件上传成功");
					Map<String, Object> data = new HashMap<>();
					data.put("src", "lib/common/img/commernt/" + newFileName);
					map.put("data", data);
					fos.close();
					in.close();
					System.out.println("上传图片到:" + uploadPath + "/" + newFileName);
					list.add(uploadPath + newFileName);
				}
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	// 根据文件名生成新的文件
	private static String getNewFileName(String fileName) {
		String newFileName = "";
		if (fileName != null) {
			String extion = fileName.substring(fileName.lastIndexOf("."));
			newFileName = UUID.randomUUID().toString() + extion;
		}
		return newFileName;
	}
}
