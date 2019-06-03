package org.wx.jiu.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.domain.News;
import org.wx.jiu.domain.OrderInfo;

import com.github.pagehelper.PageInfo;

@Controller
public class NewsController extends BaseController {
	
	
	/**
	 * @author GG
	 * @time 2018年3月19日 16:24:45
	 * @return 跳转到前台显示所有新闻
	 */
	@RequestMapping("/Wine/news")
	public String toNews(HttpServletRequest request){
		request.setAttribute("news", newsService.queryAllList());
		return "view/user/news-list";
	}
	
	/**
	 * @author GG
	 * @time 2018年3月19日 16:24:45
	 * @return 前台根据新闻ID查询新闻详细信息
	 */
	@RequestMapping("/Wine/toNews/{pkNewsId}")
	public String selectNews(HttpServletRequest request,@PathVariable(value = "pkNewsId", required = false) Integer pkNewsId){
		request.setAttribute("news", newsService.queryById(pkNewsId));
		return "view/user/news-info";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/******************
	 * 跳转到新闻管理页面
	 * 
	 * @作者:Ht
	 * @return
	 */
	@RequestMapping("/admin/News/toNewsAdmin")
	public String toOrderadmin() {
		return "admin/news/news";
	}

	/*****************
	 * 新闻分页显示所有 Ht
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/admin/News/selectAllNews")
	@ResponseBody
	public PageInfo<News> selectAllNewsForPage(Integer pageNum,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") Integer pageSize) {
		return newsService.selectAllNews(pageNum, pageSize);
	}

	/****************
	 * 新闻标题模糊查询并分页显示 Ht
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param orderid
	 * @return
	 */
	@RequestMapping("/admin/News/selectAllNewsMohu")
	@ResponseBody
	public PageInfo<News> selectAllNewsMohu(Integer pageNum,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") Integer pageSize, String title) {
		return newsService.selectAllByMohu(pageNum, pageSize, title);
	}

	/************
	 * 新闻逻辑删除 Ht
	 * 
	 * @return
	 */
	@RequestMapping("/admin/News/News_delete")
	@ResponseBody
	public Integer updateNewsByNewsIdToDelete(Integer newsid) {
		Integer a = newsService.deleteByIsdelete(newsid);
		return a;
	}

	/**********
	 * 查询已经删除的新闻，并分页显示，做恢复查询
	 * 
	 * @作者:Ht
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/admin/News/newsSelecrtHuifu")
	@ResponseBody
	public PageInfo<News> newsSelecrtHuifu(Integer pageNum,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") Integer pageSize) {
		return newsService.selectNewsByDelete(pageNum, pageSize);
	}

	/**********
	 * 恢复已经删除的新闻
	 * 
	 * @作者:Ht
	 * @param orderid
	 * @return
	 */
	@RequestMapping("/admin/News/NewsDoHuifuController")
	@ResponseBody
	public Integer NewsDoHuifuController(Integer newsid) {
		Integer a = newsService.updateByIsdeleteToHuiFu(newsid);
		return a;
	}

	/***********
	 * 跳转到新闻添加界面 Ht
	 */
	@RequestMapping("/admin/News/toAddNews")
	public String toAddNews() {
		return "admin/news/addnews";
	}

	/*************
	 * 新闻图片上传 Ht
	 * 
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping("/admin/News/imguploading")
	@ResponseBody
	public Map<String, Object> imguploading(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		System.out.println("------进入文件上传-------");
		InputStream in = null;
		OutputStream out = null;
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();
		if (file != null) {
			String uploadPath = request.getServletContext().getRealPath("/lib/common/img/news/");
			File uploadfile = new File(uploadPath);
			if (!uploadfile.exists()) {
				uploadfile.mkdirs();// 如果不存在就创建新的文件目录
			}
			System.out.println("文件路径为:--------" + uploadPath);
			String newfileName = getNewFileName(file.getOriginalFilename());
			try {
				// 获得文件输入流
				in = file.getInputStream();
				// 根据上传文件路径与新文件名创建输入流
				out = new FileOutputStream(new File(uploadfile, newfileName));
				IOUtils.copy(in, out);// IO操作
				map.put("code", 0);
				map.put("msg", "文件上传成功");
				map.put("data", map2);
				map2.put("src", "../../lib/common/img/news/" + newfileName);
				map2.put("title", "图片丢失");
				in.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	/************
	 * 获取新的文件名 Ht
	 * 
	 * @param fileName
	 * @return
	 */
	private static String getNewFileName(String fileName) {
		String newfileName = "";
		if (fileName != null) {
			String extion = fileName.substring(fileName.lastIndexOf("."));
			newfileName = UUID.randomUUID().toString() + extion;
		}
		return newfileName;
	}

	/***********
	 * 添加新闻及内容 Ht
	 * 
	 * @return
	 */
	@RequestMapping("/admin/News/addNewsAndImg")
	public String addNewsAndImg(String title, String content, Integer pkNewsId) {
		if (pkNewsId != null) {
			News n = new News();
			n.setPkNewsId(pkNewsId);
			n.setNewsTitle(title);
			n.setNewsContent(content);
			newsService.updateNoNull(n);
		} else {
			News n = new News();
			n.setNewsTitle(title);
			n.setNewsContent(content);
			newsService.saveNoNull(n);
		}
		return "admin/news/news";
	}

	/***********
	 * 新闻修改 Ht
	 * 
	 * @param model
	 * @param newsid
	 * @return
	 */
	@RequestMapping("/admin/News/NewsDoUpdateController")
	public String NewsDoUpdateController(Model model, Integer newsid) {
		News n = newsService.queryById(newsid);
		model.addAttribute("n", n);
		return "admin/news/addnews";
	}

}
