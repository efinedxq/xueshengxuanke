package cn.edu.qtech.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.qtech.service.TeaInfoService;
@WebServlet("/AllTeasServlet.do")
public class AllTeasServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       //处理中文
	   
	   TeaInfoService mgrService = new TeaInfoService();
	   List<Map<String,String>> list= mgrService.findAll();
	   System.out.println(list);
	   req.setAttribute("teas", list);
	   req.getRequestDispatcher("mgr/teas.jsp").forward(req, resp);
 	}
}