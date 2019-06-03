package org.wx.jiu.service;

import java.util.List;

import org.wx.jiu.common.BaseService;
import org.wx.jiu.domain.GoodTypeBig;

import com.github.pagehelper.PageInfo;

public interface GoodTypeBigService extends BaseService<GoodTypeBig> {
	public PageInfo<GoodTypeBig> selectAllGoodTypeBig(Integer pageNum, Integer pageSize);

	public void deleteBigGoodType(Integer pkTypeBigId);

	public GoodTypeBig getGoodTypeBigById(Integer pkTypeBigId);

	public int getGoodTypeBigByName(String typeSmallName);
	public List<GoodTypeBig> getAllBigGoodType();
	
	
	
}
