package cn.edu.qtech.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import cn.edu.qtech.dao.KcInfoDao;
import cn.edu.qtech.util.Converter;

public class KcInfoService {
	private KcInfoDao kcInfoDao;

	public KcInfoService() {
		kcInfoDao = new KcInfoDao();
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
			int row = kcInfoDao.insert(param);
			if (row > 0) {
				flag = true;
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
	public List<Map<String, String>> findAll() {
		List<Map<String, String>> list = kcInfoDao.select(null);
		return list;
	}
	/**
	 * 更新课程信息
	 * @param map
	 * @return
	 */
	public boolean update(Map<String, String[]> map) {
		boolean flag = false;
		Map<String, String> param = Converter.convertMap(map);
		Map<String, String> set = new HashMap<String, String>();
		Map<String, String> where = new HashMap<String, String>();
		set.put("kc_name", param.get("kc_name"));
		set.put("kc_score", param.get("kc_score"));
		where.put("kc_no", param.get("kc_no"));
		try {
			int row = kcInfoDao.update(set, where);
			if (row > 0) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
    /**
     * 并非真正删除，而是只把状态改了
     * @param map
     * @return
     */
	public boolean delet(Map<String, String[]> map) {
		boolean flag = false;
		Map<String, String> param = Converter.convertMap(map);
		Map<String, String> set = new HashMap<String, String>();
		Map<String, String> where = new HashMap<String, String>();
		set.put("kc_status", "0");
		where.put("kc_no", param.get("kc_no"));
		try {
			int row = kcInfoDao.update(set, where);
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
