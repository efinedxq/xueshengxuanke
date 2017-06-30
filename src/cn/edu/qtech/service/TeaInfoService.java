package cn.edu.qtech.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.qtech.dao.TeaInfoDao;
import cn.edu.qtech.util.Converter;
import cn.edu.qtech.util.Md5Utils;

public class TeaInfoService {
	private TeaInfoDao teaInfoDao;

	public TeaInfoService() {
		teaInfoDao = new TeaInfoDao();
	}

	/**
	 * 添加成功则返回 1,否则返回 0;
	 * 
	 * @param map
	 * @return boolean
	 */
	public boolean doSave(Map<String, String[]> map) {
		boolean flag = false;
		Map<String, String> param = Converter.convertMap(map);
		System.out.println(param);
		// 获取原始的密码数据
		String pass = param.get("t_pass");
		// 密码加密
		String new_pass = Md5Utils.md5(pass);
		// 替换原来的密码
		param.put("t_pass", new_pass);
		try {
			int row = teaInfoDao.insert(param);
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
	 * 
	 * @return list<map<String,String>> list
	 */
	public List<Map<String, String>> findAll() {
		List<Map<String, String>> list = teaInfoDao.select(null);
		return list;
	}

	/**
	 * 删除教师 删除成功是 true
	 * 
	 * @param map
	 * @return
	 */
	public boolean doDelete(Map<String, String[]> map) {
		boolean flag = false;
		// 构建sql语句的条件部分
		Map<String, String> where = Converter.convertMap(map);
		// 构建修改的列 和其对应的值，把状态列的值 由 1 修改为 0
		Map<String, String> param = new HashMap<String, String>();
		param.put("t_status", "0");
		try {
			int row = teaInfoDao.update(param, where);
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
	 * 修改教师信息后更新
	 * 
	 * @param map
	 * @return
	 */
	public boolean update(Map<String, String[]> map) {
		boolean flag = false;
		Map<String, String> param = Converter.convertMap(map);
		Map<String, String> where = new HashMap<String, String>();
		where.put("t_id", param.get("t_id"));
		try {
			int row = teaInfoDao.update(param, where);
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
	 * 教师登录 根据用户名 密码登录。
	 * 
	 * @param map
	 * @return
	 */
	public Map<String, String> login(Map<String, String[]> map) {
		Map<String, String> login = new HashMap<String, String>();

		Map<String, String> param = Converter.convertMap(map);
		// 获取原始的密码数据
		String pass = param.get("t_pass");
		// 密码加密
		String new_pass = Md5Utils.md5(pass);
		// 替换原来的密码
		param.put("t_pass", new_pass);
		System.out.println(param);
		try {
			List<Map<String, String>> list = teaInfoDao.select(param);
			System.out.println(list);
			if (list != null || list.size() > 0) {
				login = list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return login;
	}

	/**
	 * 获取一个 教师 信息
	 * 
	 * @param map
	 * @return
	 */
	public Map<String, String> oneTea(Map<String, String[]> map) {
		Map<String, String> stu = new HashMap<String, String>();
		Map<String, String> param = Converter.convertMap(map);
		try {
			List<Map<String, String>> list = teaInfoDao.select(param);
			if (list != null || list.size() > 0) {
				stu = list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stu;
	}

}
