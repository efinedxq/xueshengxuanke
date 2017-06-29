package cn.edu.qtech.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.qtech.service.KcInfoService;
import cn.edu.qtech.service.StuInfoService;
@WebServlet("/OneKCServlet.do")
public class OneKCServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       //处理中文
		Map<String, String[]> map = req.getParameterMap();
		KcInfoService kcService = new KcInfoService();
		Map<String, String> kc = kcService.oneKc(map);
		System.out.println(kc);
		req.setAttribute("kc", kc);
		req.getRequestDispatcher("mgr/updateKC.jsp").forward(req, resp);
 	}
}