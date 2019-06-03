package org.wx.jiu.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.wx.jiu.domain.Address;
import org.wx.jiu.domain.Carousel;
import org.wx.jiu.domain.Good;
import org.wx.jiu.domain.User;
import org.wx.jiu.service.AddressService;
import org.wx.jiu.util.Split;
import org.wx.jiu.common.BaseController;
import org.wx.jiu.common.JsonResult;

import com.github.pagehelper.PageInfo;

/**
 * pl 收货地址
 * 
 * @author Administrator
 *
 */
@Controller
public class AddressController extends BaseController {

	Logger logger = Logger.getLogger(AddressController.class);

	/**
	 * 跳转到查看收获地址
	 * 
	 * @author GG
	 */
	@RequestMapping("/Wine/toAddress/{pkUserId}")
	public String toAddress(HttpServletRequest request,
			@PathVariable(value = "pkUserId", required = false) Integer pkUserId) {
		Address address = new Address();
		address.setFkUserId(pkUserId);
		request.setAttribute("address", addressService.selectAddressAllByIsDefault(pkUserId));
		request.setAttribute("fkUserId", pkUserId);
		return "view/user/address";
	}

	/**
	 * 添加地址的界面
	 * 
	 * @author GG
	 */
	@RequestMapping("/Wine/addAddress/{fkUserId}")
	public String addAddress(HttpServletRequest request,
			@PathVariable(value = "fkUserId", required = false) Integer fkUserId) {
		request.setAttribute("pkUserId", fkUserId);
		return "view/user/address-edit";
	}

	/**
	 * 接受添加地址的数据
	 * 
	 * @author GG
	 */
	@RequestMapping("/Wine/addAddressInfo")
	@ResponseBody
	public String addAddressInfo(HttpServletRequest request, Address address, String isDefaults) {
		JsonResult<Good> jsonResult = new JsonResult<>(500, "操作失败");
		System.out.println(isDefaults + "+:" + address);
		if (address.getPkAddressId() == null) {// 当主键为空时 执行添加
			if (address.getSheng() == null || address.getSheng().equals("") || address.getSheng().equals(null)) {
				address.setSheng("湖北省");
				address.setShengCode("420000");
				address.setCity("武汉市");
				address.setCityCode("420100");
				address.setArea("武昌区");
				address.setAreaCode("420106");
			}
			System.out.println(isDefaults + "+:" + address);
			if (isDefaults != null) {// 判断是否设置为默认地址
				if (addressService.selectByIsDefault(address.getFkUserId()) > 0) {// 如果是否存在默认地址，
					System.out.println("存在默认地址");
					if (addressService.updateIsDefaultByfkUserId(address.getFkUserId()) > 0) {// 则删除默认地址
						System.out.println("删除默认地址");
						address.setIsDefault(1);
						if (addressService.saveNoNull(address) > 0) {// 保存新加的地址
							System.out.println("新增地址");
							jsonResult.setCode(200);
							jsonResult.setMsg("添加成功");
						}
					}
				} else {// 直接添加为默认地址
					address.setIsDefault(1);
					addressService.saveNoNull(address);
					jsonResult.setCode(200);
					jsonResult.setMsg("添加成功");
				}
			} else {
				System.out.println(address);
				if (addressService.selectByfkUserId(address.getFkUserId()) > 0) {// 如果有默认地址
					System.out.println("修改时有默认地址");
					address.setIsDefault(0);
					if (addressService.saveNoNull(address) > 0) {

						jsonResult.setCode(200);
						jsonResult.setMsg("添加成功");
					}
				} else {
					address.setIsDefault(1);
					if (addressService.saveNoNull(address) > 0) {
						jsonResult.setCode(200);
						jsonResult.setMsg("添加成功");
					}
				}

			}
		} else {
			if (isDefaults != null) {// 判断是否设置为默认地址
				if (addressService.updateIsDefaultByfkUserId(address.getFkUserId()) > 0) {// 则删除默认地址
					address.setIsDefault(1);
					if (addressService.updateNoNull(address) > 0) {// 保存新加的地址
						jsonResult.setCode(200);
						jsonResult.setMsg("修改成功");
					}
				}
			} else {// 直接添加为默认地址
				address.setIsDefault(0);
				addressService.updateNoNull(address);
				jsonResult.setCode(200);
				jsonResult.setMsg("修改成功");
			}
		}
		return responseAPI.getJsonString(jsonResult);
	}

	/**
	 * GG 根据主键查询该条收获地址
	 */
	@RequestMapping("/Wine/addressId/{pkAddressId}")
	public String selectAdressById(HttpServletRequest request,
			@PathVariable(value = "pkAddressId", required = false) Integer pkAddressId) {
		request.setAttribute("addressId", addressService.queryById(pkAddressId));
		request.setAttribute("fkUserId", addressService.queryById(pkAddressId).getFkUserId());
		return "view/user/address-edit";
	}

	/******************
	 * 进入收货页面 作者:pl
	 * 
	 * 
	 * @return
	 */
	@RequestMapping("/address/admin/selectAllAddressList")
	public String selectAllAddressList(HttpServletRequest Request) {
		return "admin/address/addressList";
	}

	// 显示所有
	@RequestMapping("/address/admin/selectAddress")
	@ResponseBody
	public Map<String, Object> selectAddress(Address model, Integer page, Integer limit) {
		logger.info("=======进入selectAddress=======");
		Map<String, Object> map = new HashMap<String, Object>();
		PageInfo<Address> pageInfo = addressService.findAllAddressForPage(page, limit);
		// queryPageList(page, limit);
		map.put("code", 0);
		map.put("msg", "success");
		map.put("count", pageInfo.getTotal());
		map.put("data", pageInfo.getList());
		return map;
	}

	/**
	 * 删除
	 */

	@ResponseBody
	@RequestMapping("/address/admin/delAddress")
	public Integer delAddress(Integer pkAddressId) {
		logger.info("=====delAddress======" + pkAddressId);
		Address address = addressService.queryById(pkAddressId);

		address.setIsDelete(1);
		Integer temp = addressService.update(address);
		return temp;
	}

	/**
	 * 恢复
	 */
	@ResponseBody
	@RequestMapping("/address/admin/recoverAddress")
	public Integer recoverAddress(Integer pkAddressId) {
		logger.info("=====delAddress======" + pkAddressId);
		Address address = addressService.queryById(pkAddressId);
		address.setIsDelete(0);
		Integer temp = addressService.update(address);
		return temp;
	}

	/**
	 * 修改
	 */

	@ResponseBody
	@RequestMapping("/address/admin/updateAdreess")
	public Integer postUpdateCarousel(HttpServletRequest request, Address address, MultipartFile file) {
		logger.info("===========*******************-----------+++++++++++++++++++++++==========");
		logger.info("修改之前：" + address.toString());

		Address address1 = addressService.queryById(address.getPkAddressId());// 获取数据库原有对象
		logger.info("数据库原有对象：" + address1.toString());
		address1.setPersonName(address.getPersonName());
		address1.setPersonPhone(address.getPersonPhone());
		address1.setSheng(address.getSheng());
		address1.setShengCode(address.getShengCode());
		address1.setCity(address.getCity());
		address1.setCityCode(address.getCityCode());
		address1.setArea(address.getArea());
		address1.setAreaCode(address.getAreaCode());
		address1.setDetailAddress(address.getDetailAddress());
		/* address1.setUpdatetime(address.getUpdatetime()); */

		logger.info("=====修改之前======" + address1.toString());
		Integer temp = addressService.updateNoNull(address1);
		/* Integer temp = addressService.update(address1); */
		return temp;
	}

}
