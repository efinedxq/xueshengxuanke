package cn.edu.qtech.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.qtech.service.KcInfoService;
import cn.edu.qtech.service.MgrInfoService;

@WebServlet("/AllKcsServlet.do")
public class AllKcsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       //处理中文
	   
	   KcInfoService kcService = new KcInfoService();
	   List<Map<String,String>> list= kcService.findAll();
	   System.out.println(list);
	   req.setAttribute("kcs", list);
	   req.getRequestDispatcher("mgr/kcs.jsp").forward(req, resp);
 	}


}
