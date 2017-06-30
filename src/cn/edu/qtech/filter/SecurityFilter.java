package cn.edu.qtech.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter({"*.jsp","*.do"})
public class SecurityFilter implements Filter {

	public SecurityFilter() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String  uri  = req.getRequestURI() ;
		System.out.println("Log Filter已经截获到用户的请求的地址:"+req.getServletPath());
		if(null == req.getSession().getAttribute("mgr") && null != uri){
			System.out.println("mgr");
        	if( "/xueshengxuanke/".equals(uri) ||"/xueshengxuanke/LoginMgrServlet.do".equals(uri)){
        		System.out.println(req.getServletPath());
        		chain.doFilter(req, res);
        		return ;
        	}
        	else{
        		
        		 System.out.println("ContextPath:"+req.getContextPath());
        		 res.sendRedirect(req.getContextPath());
        		 return ;
        	}
        }
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
