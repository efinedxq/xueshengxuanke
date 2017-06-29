package cn.edu.qtech.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.qtech.service.MgrInfoService;
import cn.edu.qtech.util.Converter;
@WebServlet("/DeleMgrServlet.do")
public class DeleMgrServlet extends HttpServlet {
	   
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doPost(req, resp);
		}

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	       //处理中文
		   Map<String,String[]> map = req.getParameterMap();

		   MgrInfoService mgrService = new MgrInfoService();
		   
		   boolean flag = mgrService.doDelete(map);
		   
		   if(flag){
			   resp.sendRedirect("success.jsp");
		   }else {
			   resp.sendRedirect("fail.jsp"); 
		   }
	 	}
	}
