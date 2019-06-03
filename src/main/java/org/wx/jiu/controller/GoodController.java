package org.wx.jiu.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

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

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.common.JsonResult;
import org.wx.jiu.common.ResponseAPI;
import org.wx.jiu.domain.Good;
import org.wx.jiu.domain.GoodTypeSmall;

import com.github.pagehelper.PageInfo;

/**
 * @time 2018年3月12日 10:15:31
 * @author GG
 * @作用 商品的基本操作
 *
 */
@Controller
public class GoodController extends BaseController {

	/**
	 * @time 2018年3月12日 10:38:32
	 * @author GG
	 * @return 跳转到商品管理的界面
	 */
	@RequestMapping("/admin/Good/listGood")
	public String toGood() {
		return "admin/good/listGood";
	}

	/**
	 * @time 2018年3月12日 16:17:06
	 * @author GG
	 * @return 分页显示所有商品信息
	 */
	@RequestMapping("/admin/Good/goodLimit")
	@ResponseBody
	public PageInfo<Good> selectGoodLimit(int pageNum, int pageSize) {
		return goodService.selectGoodAndType(pageNum, pageSize);
	}

	/**
	 * @time 2018年3月12日 16:17:06
	 * @author GG
	 * @return 跳转到添加商品的界面
	 */
	@RequestMapping("/admin/Good/addGood")
	public String toAddGood(HttpServletRequest request) {
		request.setAttribute("goodTypeSmall", goodTypeSmallService.selectSmallAll());
		return "admin/good/addGood";
	}

	/**
	 * @time 2018年3月12日 17:21:53
	 * @author GG
	 * @return 添加数据
	 */
	@RequestMapping("/admin/Good/addGoods")
	@ResponseBody
	public String addGoods(HttpServletRequest request, Good good) {
		JsonResult<Good> jsonResult = new JsonResult<>(500, "添加失败");
		good.setGoodCollectionNum(0);
		good.setGoodSaleNum(0);
		if (goodService.saveNoNull(good) > 0) {
			jsonResult.setCode(200);
			jsonResult.setMsg("添加成功");
		}
		return responseAPI.getJsonString(jsonResult);
	}

	/**
	 * @time 2018年3月13日 14:16:40
	 * @author GG
	 * @return 跳转到修改商品的界面
	 */
	@RequestMapping("/admin/upGood/{pkGoodId}")
	public String toUpGood(@PathVariable(value = "pkGoodId", required = false) Integer pkGoodId,
			HttpServletRequest request) {
		System.err.println(pkGoodId);
		request.setAttribute("good", goodService.queryById(pkGoodId));
		System.out.println(goodService.queryById(pkGoodId));
		request.setAttribute("goodTypeSmall", goodTypeSmallService.queryAllList());
		return "admin/good/upGood";
	}

	/**
	 * @time 2018年3月12日 17:21:53
	 * @author GG
	 * @return 修改数据
	 */
	@RequestMapping("/admin/Good/upGoods")
	@ResponseBody
	public String upGoods(HttpServletRequest request, Good good) {
		JsonResult<Good> jsonResult = new JsonResult<>(500, "修改失败");
		System.err.println(good);
		if (goodService.updateNoNull(good) > 0) {
			jsonResult.setCode(200);
			jsonResult.setMsg("修改成功");
		}
		return responseAPI.getJsonString(jsonResult);
	}

	/**
	 * @time 2018年3月13日 11:40:28
	 * @author GG
	 * @return 删除数据（逻辑删除）
	 */
	@RequestMapping("/admin/Good/delGood")
	@ResponseBody
	public String delGood(HttpServletRequest request, Integer pkGoodId) {
		System.err.println("你要删除的ID为：" + pkGoodId);
		JsonResult<Good> jsonResult = new JsonResult<>(500, "删除失败");
		Good good = new Good();
		good.setPkGoodId(pkGoodId);
		good.setIsDelete(0);
		if (goodService.updateDelete(good) > 0) {
			jsonResult.setCode(200);
			jsonResult.setMsg("删除成功");
		}
		return responseAPI.getJsonString(jsonResult);
	}

	/**
	 * @time 2018年3月15日 15:02:02
	 * @author GG
	 * @return 批量删除数据（逻辑删除）
	 */
	@RequestMapping("/admin/Good/delGoods")
	@ResponseBody
	public String delGoods(HttpServletRequest request, Integer[] pkGoodId) {
		JsonResult<Good> jsonResult = new JsonResult<>(500, "删除失败");
		Good good = new Good();
		for (int i = 0; i < pkGoodId.length; i++) {
			good.setPkGoodId(pkGoodId[i]);
			good.setIsDelete(0);
			if (goodService.updateDelete(good) > 0) {
				jsonResult.setCode(200);
				jsonResult.setMsg("删除成功");
			}
		}
		return responseAPI.getJsonString(jsonResult);
	}

	
	/**
	 * @time 2018年3月15日 15:12:39
	 * @author GG
	 * @return 点击恢复界面跳转到已被删除的界面
	 */
	@RequestMapping("/admin/Good/toRecover")
	@ResponseBody
	public PageInfo<Good> toRecover(int pageNum, int pageSize) {
		return goodService.selectGoodAndTypeIsDelete(pageNum, pageSize);
	}
	
	/**
	 * @time 2018年3月15日 15:12:39
	 * @author GG
	 * @return 恢复已删除的数据
	 */
	@RequestMapping("/admin/Good/recover")
	@ResponseBody
	public String recover(int pkGoodId) {
		JsonResult<Good> jsonResult = new JsonResult<>(500, "恢复失败");
		Good good=new Good();
		good.setPkGoodId(pkGoodId);
		good.setIsDelete(1);
		if(goodService.updateNoNull(good)>0){
			jsonResult.setCode(200);
			jsonResult.setMsg("恢复成功");
		}
		return responseAPI.getJsonString(jsonResult);
	}
	
	/**
	 * @time 2018年3月13日 14:41:06
	 * @author GG
	 * @return 跳转到人气销量界面
	 */
	@RequestMapping("/admin/Good/toHot")
	public String toHot() {
		return "admin/good/hot";
	}

	/**
	 * @time 2018年3月13日 15:01:07
	 * @author GG
	 * @return 按照销量排行
	 */
	@RequestMapping("/admin/Good/sale")
	@ResponseBody
	public PageInfo<Good> sale(Integer pageNum, Integer pageSize) {
		return goodService.selectGoodByGoodSaleNum(pageNum, pageSize);
	}

	/**
	 * @time 2018年3月13日 14:41:06
	 * @author GG
	 * @return 跳转到人气销量界面
	 */
	@RequestMapping("/admin/Good/conllection")
	@ResponseBody
	public PageInfo<Good> conllection(Integer pageNum, Integer pageSize) {
		return goodService.selectGoodByGoodConllectionNum(pageNum, pageSize);
	}

	/**
	 * @time 2018年3月13日 09:29:38
	 * @author GG
	 * @return 上传单图片
	 */
	@RequestMapping(value = "/admin/GoodUploadImg", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadImg(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		System.out.println("------进入单文件上传-------");
		InputStream in = null;
		OutputStream out = null;
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		if (file != null) {
			// 获得需要上传文件的路径
			String uploadPath = request.getServletContext().getRealPath("/lib/common/img/good/");
			File uploadFile = new File(uploadPath);
			if (!uploadFile.exists()) {
				uploadFile.mkdirs();// 如果不存，创建新的文件目录
			}
			System.out.println("上传的路径为：----" + uploadPath);
			// 根据上传文件创建新的文件名
			String newFileName = getNewFileName(file.getOriginalFilename());
			try {
				// 获得文件输入流
				in = file.getInputStream();
				// 根据上传路径与新的文件名创建输出流
				out = new FileOutputStream(new File(uploadPath, newFileName));
				IOUtils.copy(in, out); // IO/操作
				System.out.println("上传的文件名为：-----" + newFileName);
				// 以json的方式响应到客户端
				/*
				 * map.put("code", 0); map.put("msg", "封面图上传成功"); Map<String,
				 * Object> data = new HashMap<>(); data.put("src",
				 * "lib/common/img/good/" + newFileName); map.put("data", data);
				 */
				map.put("code", 0);// 0表示成功，1失败
				map.put("msg", "上传成功");// 提示消息
				map.put("data", map2);
				map2.put("src", "../../lib/common/img/good/" + newFileName);// 图片url
				// map2.put("src","lib/common/img/good/" + newFileName);//图片url
				map2.put("title", "图片丢失");// 图片名称，这个会显示在输入框里
				in.close();
				out.close();
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	// 上传多图片
	@RequestMapping(value = "/admin/GoodUploadImgs", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadImgs(@RequestParam("file") MultipartFile files[], HttpServletRequest request) {
		System.out.println("------进入多文件上传-------");
		InputStream in = null;
		OutputStream out = null;
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<>();
		if (files != null) {
			// 获得需要上传文件的路径
			String uploadPath = request.getServletContext().getRealPath("/lib/common/img/good/");
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
					data.put("src", "lib/common/img/good/" + newFileName);
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
