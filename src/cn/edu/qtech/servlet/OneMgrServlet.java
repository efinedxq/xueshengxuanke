package cn.edu.qtech.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.qtech.service.MgrInfoService;

@WebServlet("/OneMgrServlet.do")
public class OneMgrServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 处理中文
		Map<String, String[]> map = req.getParameterMap();
		MgrInfoService mgrService = new MgrInfoService();
		Map<String, String> mgr = mgrService.oneMgr(map);
		System.out.println(mgr);
		req.setAttribute("mgr", mgr);
		req.getRequestDispatcher("mgr/updateMgr.jsp").forward(req, resp);
	}
}