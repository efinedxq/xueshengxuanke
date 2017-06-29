<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
* {
	font-size: 14px;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
	text-align: center;
}
</style>
<script type="text/javascript">
   function update(i){
	   alert(i);
	   f = document.forms[i];
   	   f.action = "<%=path%>/UpdateKcServlet.do";
   }
   function del(i){
	   alert(i);
	   f = document.forms[i];
	   f.action = "<%=path%>/DeleKcServlet.do";
   }
</script>
</head>
<body bgcolor="#b8d2e8">
 显示所有课程信息
<table border="1px" bordercolor="ffffff">
    <tr>
        <td>序号</td>
        <td>编号</td>
        <td>课程名</td>
        <td>学分</td>
        <td>状态</td>
        <td></td>
    </tr>
   
    <c:forEach items="${requestScope.kcs}" var="item" varStatus="vs">
      <form method="post">
    <tr>
        <input type="hidden" name="kc_no" value="${item.get('kc_no')}">
        <td>${vs.index+1}</td>
        <td>${item.get("kc_no") }</td>
        <td><input type="text" name="kc_name" value="${item.kc_name}"/></td>
        <td><input type="text" name="kc_score" size="4" value="${item.kc_score }"/></td>
        <td>${item.kc_status}</td>
        <td>
           <input type="submit" onclick="update(${vs.index})" value="修改"/>
           <input type="submit" onclick="del(${vs.index})" value="删除"/>
        </td>
        
    </tr>
    </form>
    </c:forEach>
</table>
</body>
</html>