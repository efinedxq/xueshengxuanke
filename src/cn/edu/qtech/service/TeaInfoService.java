package cn.edu.qtech.service;

import java.util.List;
import java.util.Map;

import cn.edu.qtech.dao.TeaInfoDao;
import cn.edu.qtech.util.Converter;

public class TeaInfoService {
    private TeaInfoDao teaInfoDao;
	public TeaInfoService() {
		teaInfoDao = new TeaInfoDao();
	}
	/**
	 * 添加成功则返回 1,否则返回 0;
	 * @param map
	 * @return boolean
	 */
	public boolean doSave(Map<String, String[]> map){
		boolean flag=false;
		Map<String,String> param = Converter.convertMap(map);
		System.out.println(param);
		try {
			int row=teaInfoDao.insert(param);
			if(row>0){
				flag=true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	/**
	 * 选取全部的管理员
	 * @return list<map<String,String>> list
	 */
	public List<Map<String,String>> findAll(){
		List<Map<String,String>> list=
				teaInfoDao.select(null);
		return list;
	}
}
