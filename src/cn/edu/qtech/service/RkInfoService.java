package cn.edu.qtech.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.qtech.dao.RkInfoDao;
import cn.edu.qtech.dao.RkViewDao;
import cn.edu.qtech.util.Converter;
import cn.edu.qtech.util.Md5Utils;

public class RkInfoService {
    private RkInfoDao rkInfoDao;
	public RkInfoService() {
		rkInfoDao = new RkInfoDao();
	}
    
	/**
	 * 添加成功则返回 1,否则返回 0;
	 * @param map
	 * @return boolean
	 */
	public boolean doSave(Map<String, String[]> map) {
		boolean flag = false;
		Map<String, String> param = Converter.convertMap(map);
		System.out.println(param);
		try {
			int row = rkInfoDao.insert(param);
			if (row > 0) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public List<Map<String,String>> findAll(){
		RkViewDao rkViewDao = new RkViewDao();
		List<Map<String,String>> list=
				rkViewDao.select(null);
		return list;
	}
	/**
	 * 删除任课  删除成功是 true
	 * 
	 * @param map
	 * @return
	 */
	public boolean doDelete(Map<String, String[]> map) {
		boolean flag = false;
		// 构建sql语句的条件部分
		Map<String, String> where = Converter.convertMap(map);
		
		try {
			int row = rkInfoDao.delete(where);
			if (row > 0) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}
