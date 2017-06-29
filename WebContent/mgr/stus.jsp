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
   	   f.submit = "<%=path%>/UpdateStuServlet.do";
   }
   function del(i){
	   f = document.forms[i];
	   f.submit = "<%=path%>/DelStuServlet.do";
   }
</script>
</head>
<body bgcolor="#b8d2e8">
 显示所有学生信息
<table border="1px" bordercolor="ffffff">
    <tr>
        <td>序号</td>
        <td>编号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>性别</td>
        <td>联系方式</td>
        <td>住址</td>
        <td>状态</td>
        <td></td>
    </tr>
   
    <c:forEach items="${requestScope.stus}" var="item" varStatus="vs">
      <form method="post">
    <tr>
        <input type="hidden" name="s_no" value="${item.get('s_no')}">
        <td>${vs.index+1}</td>
        <td>${item.get("s_no") }</td>
        <td><input type="text" name="s_name" size="4" value="${item.s_name}"/></td>
        <td><input type="text" name="s_pass" value="${item.s_pass }"/></td>
        <td>
            <c:if test="${item.s_sex.equals('男')}">
              <input type="radio" name="s_sex" id="boy" value="男" checked="checked">男
		      <input type="radio" name="s_sex" id="girl" value="女">女
		    </c:if>
		    <c:if test="${item.s_sex.equals('女')}">
              <input type="radio" name="s_sex" id="boy" value="男">男
		      <input type="radio" name="s_sex" id="girl" value="女" checked="checked">女
		    </c:if>
		    <c:if test="${item.s_sex.equals('')}">
              <input type="radio" name="s_sex" id="boy" value="男">男
		      <input type="radio" name="s_sex" id="girl" value="女">女
		    </c:if>
        </td>
        <td><input type="text" name="s_tel" value="${item.s_tel }"/></td>
        <td><input type="text" name="s_address" value="${item.s_address }"/></td>
        <td>${item.s_status}</td>
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