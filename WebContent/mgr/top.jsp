<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{
    margin:0px;
  }
  #top{
     font-size:  50px;
     text-align: center;
     font-style: italic;
     letter-spacing:  2px;
/*      background-color: #AABBFF; */
     background-color:#b8d2e8;
     line-height: 60px;
     padding-top: 20px;
  }
  #logout{
     text-align: right;
     letter-spacing: 8px;
     padding-right:80px;
     padding-bottom:8px;
     background-color:#b8d2e8;
     line-height: 12px;
  }
  a{
     text-decoration: none;
     cursor: pointer;
  }
  a:HOVER {
	font-style: italic;
  }
</style>
</head>
<body >
<div id="top">
    学生选课系统
</div>
<div id="logout">
<a href="<%=path %>/OutMgrServlet.do" target="_top">注销</a>
</div>
</body>
</html>