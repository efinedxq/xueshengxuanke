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
<title>添加学生</title>
<style type="text/css">
    *{
       font-size: 10px;
    }
    .input{
     width:150px;
    }
    .td{
      text-align: right;
    }
    .btn{
       width:60px;
       height:25px;
       margin-right: 10px;
       margin-top: 10px;
    }
    #top{
       height:50px;
    }
</style>
</head>
<body bgcolor="#b8d2e8">
<div id="top"> </div>
<form action="<%=path %>/AddKcServlet.do" method="post">
      <table >
		<tr>
			<td class="td">课程名:</td>
			<td><input class="input" type="text" name="kc_name" id="kc_name"></td>
			<td>
			   <div id="name_msg"></div>
			</td>
		</tr>
		<tr>
			<td class="td">学分:</td>
		    <td><input class="input" type="text" name="kc_score" id="kc_score"></td>
			<td>
			   <div id="score_msg">必须是数字</div>
			</td>
		</tr>
		<tr>
		   <td></td>
		   <td>
		      <input class="btn" type="submit" value="保存">
		      <input class="btn" type="reset" value="重置">
		   </td>
		   <td></td>
		</tr>
	  </table>
	</form>
</body>
</html>