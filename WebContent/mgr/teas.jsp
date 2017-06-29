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
function update(id){
	   var f = confirm("你是否要修改该记录？");
	   if(f){
			  window.location.href="<%=path%>/OneTeaServlet.do?t_id="+id;
	   } 
 }
function del(id){
	  var f = confirm("你是否要删除该记录？");
	  if(f){
		  window.location.href="<%=path%>/DeleTeaServlet.do?t_id="+id;
	  } 
}
</script>
</head>
<body bgcolor="#b8d2e8">
 显示所有教师信息
<form action="<%=path %>/DeleTeaServlet.do" method="post" onsubmit="checkIds()">
<table border="1px" bordercolor="ffffff">
    <tr>
         <td><input type="checkbox"
					onchange="selectCheckBox(this.checked)">
	    </td>
        <td>编号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>性别</td>
        <td>联系方式</td>
        <td>生日</td>
        <td>住址</td>
        <td>状态</td>
        <td>操作</td>
    </tr>
   
    <c:forEach items="${requestScope.teas}" var="item" varStatus="vs">
    <tr>
        
       <td><input type="checkbox" name="t_id" value="${item.t_id}"></td>
        <td>${item.get("t_no") }</td>
        <td>${item.t_name}</td>
        <td>${item.t_pass }</td>
        <td >
            ${item.t_sex}
        </td>
        <td>${item.t_tel }</td>
         <td>${item.t_birth }</td>
        <td>${item.t_address }</td>
        <td>${item.t_status}</td>
        <td>
           <input type="button" onclick="update(${item.t_id})" value="修改"/>
           <input type="button" onclick="del(${item.t_id})" value="删除"/>
        </td>
       
    </tr>
    </c:forEach>
     <tr>
		<td colspan="10"><input type="submit"  value="批量删除"></td>
    </tr>
</table>
</form>
</body>
<script type="text/javascript">
  function selectCheckBox(flag){
	  var chs = document.getElementsByName("t_id");
	  for(var i = 0; i < chs.length; i ++){
		  chs[i].checked = flag;
	  }
  }
  function checkIds(){
	  var chs = document.getElementsByName("t_id");
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