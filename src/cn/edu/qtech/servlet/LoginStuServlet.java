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
@WebServlet("/LoginStuServlet.do")
public class LoginStuServlet  extends HttpServlet {
	   
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doPost(req, resp);
		}

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	       //处理中文
		   req.setCharacterEncoding("utf-8");
		   Map<String,String[]> map = req.getParameterMap();
		   Map<String,String> param = Converter.convertMap(map);
		   System.out.println(param);
		   MgrInfoService mgrService = new MgrInfoService();
		   Map<String,String> mgr = mgrService.login(map);
		   
		   if(mgr.get("m_name")!=null){
			   //如果flag 位 true 表示 操作成功，把成功页面
			   HttpSession session =  req.getSession();
			   session.setAttribute("mgr", mgr);
			   resp.sendRedirect("mgr/main.html");
		   }else{
			 //如果flag 位 false表示 操作失败，把失败页面
			   resp.sendRedirect("mgr/login.jsp");
		   }
	 	}
	}
