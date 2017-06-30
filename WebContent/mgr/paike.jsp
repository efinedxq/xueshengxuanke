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
<title>添加课程</title>
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
    .error{
      color: red;
      border:1px solid red;
      width:200px;
    }
    .success{
      color: green;
      border: 1px solid green;
      width: 200px;
    }
</style>
</head>
<body bgcolor="#b8d2e8">
<div id="top"> </div>
<form action="<%=path %>/AddRKServlet.do" method="post">
<table >
    <tr>
			<td class="td">教师名:</td>
			<td><select name="rk_t_id" id="rk_t_id">
                      <c:forEach items="${teas}" var="tea" >
                          <option value="${tea.t_id}">${tea.t_name}</option>
                      </c:forEach>
                </select>
            </td>
			<td>
			   <div id=""></div>
			</td>
		</tr>
		<tr>
			<td class="td">课程名称:</td>
			<td>
			    <select name="rk_kc_id" id="rk_kc_id">
                    <c:forEach items="${kcs}" var="kc" >
                        <option value="${kc.kc_id}">${kc.kc_name}</option>
                   </c:forEach>
             </select>
			</td>
			<td>
			   <div id=""></div>
			</td>
		</tr>
		<tr>
			<td class="td">最大人数:</td>
			<td><input type="number" name="rk_maxNum" id="rk_maxname" onblur="check('rk_maxNum','maxNum_msg')" onfocus="focu('rk_maxNum','maxNum_msg')"> </td>
			<td>
			   <div id="maxNum_msg"></div>
			</td>
		</tr>
		<tr>
 		    <td class="td">开始时间:</td>
		    <td><input type="date" name="rk_start" id="rk_start" onblur="check('rk_start','start_msg')" onfocus="focu('rk_start','start_msg')"></td>
		    <td>
			   <div id="start_msg"></div>
			</td>
		</tr>
		<tr>
 		    <td class="td">结束时间:</td>
		    <td><input type="date" name="rk_end" id="rk_end" onblur="check('rk_end','end_msg')" onfocus="focu('rk_end','end_msg')"></td>
		    <td>
			   <div id="end_msg"></div>
			</td>
		</tr>
		<tr>
		   <td></td>
		   <td>
		      <input class="btn" type="submit"   value="保存">
		      <input class="btn" type="reset" value="重置">
		   </td>
		   <td></td>
		</tr>
</table>
</form>
</body>
<script type="text/javascript">
  var msg_text = {
	  maxNum_msg : "必须是数字",
	  start_msg:"不为空",
	  end_msg : "在开始日期之后"
   };
   var name_id = [
			'rk_maxNum',
			'rk_start',
			'rk_end' ];
   var msg_id = [
	   'maxNum_msg','start_msg',
	   'end_msg' ];
   
   function check(text_id,msg_id){
	   var name = document.getElementById(text_id);
	   var v = name.value;
	   var msg = document.getElementById(msg_id);
       var flag = false;
	   switch(text_id){
	   case "rk_maxNum":
		   var reg = /^[0-9]$/;
		   if(v!=null&&v.match(reg)) flag = true;
		   break;
	   case "rk_start":
		   if(v!=null&&v!="") flag = true;
		   break;
	   case "rk_end":
		   var start = document.getElementById("rk_start");
		   var vs = start.value;
		   if(v > vs) flag = true;
		   break;
	   }
	   
	   if(flag){
		   msg.innerHTML = "正确";
		   msg.className = "success";
		   return true;
	   }else{
		  msg.innerHTML = "错误";  
		  msg.className = "error";
		  return false;
	   }
   }
   function focu(text_id,msg_id){
	   var name = document.getElementById(text_id);
	    console.log(msg_text[msg_id]);
	   //选中控件中的内容，高亮显示
	   var msg = document.getElementById(msg_id)
	   msg.innerHTML = msg_text[msg_id];
	   msg.className = "";
   }
   function checkForm(){
	   var flag = true;
       for(i=0;i<name_id.length;i++){
    	   if(!check(name_id[i],msg_id[i]))   {
    		   flag = false; break;
    		}
       }
       return flag;
   }
</script>
</html>