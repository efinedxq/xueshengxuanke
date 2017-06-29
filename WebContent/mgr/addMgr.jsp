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
<title>添加管理员</title>
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
<form action="<%=path %>/AddMgrServlet.do" method="post" onsubmit="return checkForm()">
      <table >
		<tr>
			<td class="td">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
			<td><input class="input" type="text" name="m_name" id="m_name" onblur="check('m_name','name_msg')" onfocus="focu('m_name','name_msg')"></td>
			<td>
			   <div id="name_msg">用户名不少于两个字符</div>
			</td>
		</tr>
		<tr>
			<td class="td">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
			<td><input class="input" type="password" name="m_pass" id="m_pass" onblur="check('m_pass','pass_msg')" onfocus="focu('m_pass','pass_msg')"></td>
			<td>
			   <div id="pass_msg">密码在6-12位之间的数字字母组合</div>
			</td>
		</tr>
		<tr>
			<td class="td">确认密码:</td>
			<td><input class="input" type="password"  id="m_rpass" onblur="check('m_rpass','rpass_msg')" onfocus="focu('m_rpass','rpass_msg')"></td>
			<td>
			   <div id="rpass_msg">必须与密码相同</div>
			</td>
		</tr>
		<tr>
 		    <td class="td">手机号码:</td>
		    <td><input class="input" type="text" name="m_tel" id="m_tel" onblur="check('m_tel','tel_msg')" onfocus="focu('m_tel','tel_msg')"></td>
		    <td>
			   <div id="tel_msg">手机号码必须是 11 位的数字</div>
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
//########################  方法一  ##############################
   var msg_text = {
	  name_msg : "用户名不少于两个字符",
	  pass_msg : "密码在6-12位之间的数字字母组合",
	  rpass_msg : "必须与密码相同",
	  tel_msg : "手机号码必须是 11 位的数字"
   };
   var name_id = [
			'm_name',
			'm_pass' ,
			'm_rpass',
			'm_tel' ];
   var msg_id = [
	   'name_msg',
	   'pass_msg',
	   'rpass_msg',
	   'tel_msg' ];
   
   function check(text_id,msg_id){
	   var name = document.getElementById(text_id);
	   var v = name.value;
	   var msg = document.getElementById(msg_id);
       var flag = false;
	   switch(text_id){
	   case "m_name":
		   if(v.length>=2) flag = true;
		   break;
	   case "m_pass":
		   var reg = /^[A-Za-z0-9]{6,12}$/;
		   if(v.match(reg)) flag = true;
		   break;
	   case "m_rpass":
		   var nam = document.getElementById("m_pass");
		   var rv = nam.value;
		   if(v==rv&&rv!="") flag = true;
		   break;
	   case "m_tel":
		   var reg = /^1[34578][0-9]{9}$/;
		   if(v.match(reg)) flag = true;
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
	   name.select();
	   var msg = document.getElementById(msg_id)
	   msg.innerHTML = msg_text[msg_id];
	   msg.className = "";
   }
   function checkForm(){
	   var flag = true;
       for(i=0;i<name_id.length;i++){
    	   if(!check(name_id[1],msg_id[i]))   {
    		   flag = false; break;
    		}
       }
       return flag;
   }
   //########################  方法二   ##############################
   function checkName(){
	   //区分大小写 
	   var name = document.getElementById("m_name");
	   var v = name.value;
	   var msg = document.getElementById("name_msg");
	   if(v.length>=2){
		   msg.innerHTML = "用户名正确";
		   msg.className = "success";
		   return true;
	   }else{
		  msg.innerHTML = "用户名错误";  
		  msg.className = "error";
		  return false;
	   }
   }
   function focusName(){
	   var name = document.getElementById("m_name");
	   //选中控件中的内容，高亮显示
	   name.select();
	   var msg = document.getElementById("name_msg");
	   msg.innerHTML = "用户名不少于两个字符";
	   msg.className = "";
   }
   
   function checkPass(){
	   var reg = /^[A-Za-z0-9]{6,12}$/;
	   //区分大小写 
	   var name = document.getElementById("m_pass");
	   var v = name.value;
	   var msg = document.getElementById("pass_msg");
	   if(v.match(reg)){
		   msg.innerHTML = "密码正确";
		   msg.className = "success";
		   return true;
	   }else{
		  msg.innerHTML = "密码错误";  
		  msg.className = "error";
		  return false;
	   }
   }
   function focusPass(){
	   var name = document.getElementById("m_pass");
	   //选中控件中的内容，高亮显示
	   name.select();
	   var msg = document.getElementById("pass_msg");
	   msg.innerHTML = "密码在6-12位之间的数字字母组合";
	   msg.className = "";
   }
   
   function checkRPass(){
	   //区分大小写 
	   var name = document.getElementById("m_pass");
	   var rname = document.getElementById("m_rpass");
	   var v = name.value;
	   var rv = rname.value;
	   var msg = document.getElementById("rpass_msg");
	   if(v==rv&&rv!=""){
		   msg.innerHTML = "输入正确";
		   msg.className = "success";
		   return true;
	   }else{
		  msg.innerHTML = "输入错误";  
		  msg.className = "error";
		  return false;
	   }
   }
   function focusRPass(){
	   var name = document.getElementById("m_rpass");
	   //选中控件中的内容，高亮显示
	   name.select();
	   var msg = document.getElementById("rpass_msg");
	   msg.innerHTML = "必须与密码相同";
	   msg.className = "";
   }
   
   function checkTel(){
	   //区分大小写 
	   var name = document.getElementById("m_tel");
	   var v = name.value;
	   var msg = document.getElementById("tel_msg");
	   if(v.length==11){
		   msg.innerHTML = "联系方式正确";
		   msg.className = "success";
		   return true;
	   }else{
		  msg.innerHTML = "联系方式错误";  
		  msg.className = "error";
		  return false;
	   }
   }
   function focusTel(){
	   var name = document.getElementById("m_tel");
	   //选中控件中的内容，高亮显示
	   name.select();
	   var msg = document.getElementById("tel_msg");
	   msg.innerHTML = "手机号码必须是 11 位的数字";
	   msg.className = "";
   }
</script>
</html>