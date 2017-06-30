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
    width:80%;
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
	text-align: center;
}
</style>
<script type="text/javascript">
 
  function del(id){
	  var f = confirm("你是否要删除该记录？");
	  if(f){
		  window.location.href="<%=path%>/DeleRKServlet.do?rk_id="+id;
	  } 
  }
</script>
</head>
<body bgcolor="#b8d2e8">
 显示所有学生信息
 <form action="<%=path %>/DeleRKServlet.do" method="post" onsubmit="checkIds()">
<table border="1px" bordercolor="ffffff">
    <tr>
        <td><input type="checkbox"
					onchange="selectCheckBox(this.checked)">
	    </td>
        <td>教师名</td>
        <td>课程名</td>
        <td>最大人数</td>
        <td>实际人数</td>
        <td>操作</td>
    </tr>
   
    <c:forEach items="${requestScope.rks}" var="item">
    <tr>
        <td><input type="checkbox" name="rk_id" value="${item.rk_id}"></td>
        <td>${item.t_name}</td>
        <td>${item.kc_name }</td>
        <td>${item.rk_maxNum}</td>
        <td>${item.rk_realNum }</td>
        <td>
           <input type="button" onclick="del(${item.rk_id})" value="删除"/>
        </td>
    </tr>
    </c:forEach>
    <tr>
		<td colspan="6"><input type="submit"  value="批量删除"></td>
    </tr>
</table>
</form>
</body>
<script type="text/javascript">
  function selectCheckBox(flag){
	  var chs = document.getElementsByName("rk_id");
	  for(var i = 0; i < chs.length; i ++){
		  chs[i].checked = flag;
	  }
  }
  function checkIds(){
	  var chs = document.getElementsByName("rk_id");
	  var flag = false;
	  for(var i = 0; i < chs.length; i ++){
		  if(chs[i].checked == true){
			  flag = true;
			  break;
		  }
	  }
	  if(flag){
		  return true;
	  }
	  alert("请选择要删除的数据！");
	  return false;
  }
</script>
</html>