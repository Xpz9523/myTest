package org.wx.jiu.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.domain.GoodTypeBig;
import org.wx.jiu.domain.Size;
import org.wx.jiu.domain.SizeDetail;

import com.github.pagehelper.PageInfo;
@Controller
public class SizeDetailController extends BaseController {
	@RequestMapping("/admin/samll/listsize")
	public String listGoodTypes(){
		return "admin/size/listsizedetail";
		
	}
	/**
	 * 显示所有未删除的规格
	 * 作者：Xpz
	 */
	@RequestMapping("/admin/Big/selectAllSizedetail")
	@ResponseBody
	public PageInfo<SizeDetail> selectAllGoodTypes(Integer pageNum,@RequestParam(value="pageSize",required=false,defaultValue="5")Integer pageSize){
		System.out.println("进入规格");
		
		PageInfo<SizeDetail> page =sizeDetailService.selectAllSize(pageNum, pageSize);
		List<SizeDetail> list = page.getList();
		for (SizeDetail sizeDetail : list) {
			System.out.println(sizeDetail.getSizeDetailName());
		}
		return page;
		
	}
	
	/**
	 * 添加小规格文件图片
	 * @param file
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uplodImg (@RequestParam("file") MultipartFile file,HttpServletRequest req){
		
		System.out.println("图片上传");
		InputStream in = null;
		OutputStream out = null;
		
		Map<String, Object> map = new HashMap<>();
		Map<String,Object> map2 = new HashMap<String,Object>();
		if( file!=null){
			String uploadPath = req.getServletContext().getRealPath("/lib/common/img/samllgoodty/");
			File uploadFile = new File(uploadPath);
			if(!uploadFile.exists()){
				
				uploadFile.mkdirs();
			}
		
			String newFileName = getNewFileName(file.getOriginalFilename());
			try {
				in = file.getInputStream();
				out= new FileOutputStream(new File(uploadPath,newFileName));
				IOUtils.copy(in, out);
				
				map.put("code", 200);
				map.put("msg", "文件上传成功");
				Map<String, Object> data = new HashMap<>();
				data.put("src", "lib/common/img/samllgoodty/" +newFileName );
				map.put("data", data);
				in.close();
				out.close();
			} catch (Exception e) {
			
			}
			
		}
		
		
		return map;
		
	}	
		
	private static String getNewFileName(String fileName){
		String newFileName="";
		if(fileName!=null){
			String extion= fileName.substring(fileName.lastIndexOf("."));
			newFileName = UUID.randomUUID().toString()+extion;
		}
	
		return newFileName;
	}
	
	/**
	 * 逻辑删除小规格
	 * 作者：Xpz
	 */
	@RequestMapping("/admin/Big/deleteSizeDetail")
	@ResponseBody
	public Map<String, Object> deleteSizeDetail(Integer bid){
		
		Map<String, Object> jsonMap = new HashMap<>();
		SizeDetail si = new SizeDetail();
		si.setIsDelete(0);
		si.setPkSizeDetailId(bid);
		try {
			sizeDetailService.updateNoNull(si);
			jsonMap.put("status", 200);
			jsonMap.put("message", "删除成功");
		} catch (Exception e) {
			jsonMap.put("status", 500);
			jsonMap.put("message", e.getMessage());
		}
		return jsonMap;
		
	}
	/**
	 * 得到所有规格父类
	 * @return
	 */
	@RequestMapping("/admin/Deteail/getAllSize")
	@ResponseBody
	public Map<String, Object> getAllSize(){
		Map<String, Object> jsonMap = new HashMap<>();
		List<Size> list = 	sizeService.queryAllList();
		jsonMap.put("Size", list);
		return jsonMap;
		
	}
	/**
	 * 添加小规格
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/Deteail/AddSizeDeteail")
	@ResponseBody
	public Map<String,  Object> addBigGoodTypes(SizeDetail model){
		Map<String, Object> jsonMap = new HashMap<>();
		System.out.println("添加");
		System.out.println(model.toString());
		int i = sizeDetailService.getSizeDetailByName(model.getSizeDetailName());
		if(i>0){
				jsonMap.put("status", 500);
				jsonMap.put("message","该类型已存在" );
				
			}else{
				System.out.println("=============");
				sizeDetailService.saveNoNull(model);
				jsonMap.put("status", 200);
				jsonMap.put("message", "添加成功");
			}
			
			
			
		return jsonMap;
		
	}
}
