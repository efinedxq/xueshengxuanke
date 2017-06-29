package cn.edu.qtech.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.qtech.service.KcInfoService;
import cn.edu.qtech.service.TeaInfoService;
import cn.edu.qtech.util.Converter;
@WebServlet("/UpdateTeaServlet.do")
public class UpdateTeaServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 处理中文
		req.setCharacterEncoding("utf-8");
		Map<String, String[]> map = req.getParameterMap();
		
		Map<String,String> param = Converter.convertMap(map);
		   System.out.println(param);
		
		TeaInfoService teaService = new TeaInfoService();
	    boolean flag = teaService.update(map);
	    if(flag){
			   //如果flag 位 true 表示 操作成功，把成功页面
			   resp.sendRedirect("success.jsp");
		   }else{
			 //如果flag 位 false表示 操作失败，把失败页面
			   resp.sendRedirect("fail.jsp");
		   }
	}

}
