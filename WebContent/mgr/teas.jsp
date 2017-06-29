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
	   f = document.forms[i];
   	   f.submit = "<%=path%>/UpdateTeaServlet.do";
   }
   function del(i){
	   f = document.forms[i];
	   f.submit = "<%=path%>/DelTeaServlet.do";
   }
</script>
</head>
<body bgcolor="#b8d2e8">
 显示所有教师信息
<table border="1px" bordercolor="ffffff">
    <tr>
        <td>序号</td>
        <td>编号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>性别</td>
        <td>联系方式</td>
        <td>生日</td>
        <td>住址</td>
        <td>状态</td>
        <td></td>
    </tr>
   
    <c:forEach items="${requestScope.teas}" var="item" varStatus="vs">
    <form method="post">
    <tr>
        
        <input type="hidden" name="t_no" value="${item.get('t_no')}">
        <td>${vs.index+1}</td>
        <td>${item.get("t_no") }</td>
        <td><input type="text" name="t_name" size="4" value="${item.t_name}"/></td>
        <td><input type="text" name="t_pass" value="${item.t_pass }"/></td>
        <td >
            <c:if test="${item.t_sex.equals('男')}">
              <input type="radio" name="t_sex" id="boy" value="男" checked="checked">男
		      <input type="radio" name="t_sex" id="girl" value="女">女
		    </c:if>
		    <c:if test="${item.t_sex.equals('女')}">
              <input type="radio" name="t_sex" id="boy" value="男">男
		      <input type="radio" name="t_sex" id="girl" value="女" checked="checked">女
		    </c:if>
		    <c:if test="${item.t_sex.equals('')||item.t_sex==null}">
              <input type="radio" name="t_sex" id="boy" value="男">男
		      <input type="radio" name="t_sex" id="girl" value="女">女
		    </c:if>
        </td>
        <td><input type="text" name="t_tel" value="${item.t_tel }"/></td>
         <td><input type="text" name="t_birth" value="${item.t_birth }"/></td>
        <td><input type="text" name="t_address" value="${item.t_address }"/></td>
        <td>${item.t_status}</td>
        <td>
           <input type="button" onclick="update(${vs.index})" value="修改"/>
           <input type="button" onclick="del(${vs.index})" value="删除"/>
        </td>
       
    </tr>
     </form>
    </c:forEach>
    
</table>
</body>
</html>