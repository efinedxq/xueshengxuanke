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
<form action="<%=path %>/AddStuServlet.do" method="post" onsubmit="return checkForm()">
      <table >
		<tr>
			<td class="td">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
			<td><input class="input" type="text" name="s_name" id="s_name"  onblur="check('s_name','name_msg')" onfocus="focu('s_name','name_msg')"></td>
			<td>
			   <div id="name_msg">用户名不少于两个字符</div>
			</td>
		</tr>
		<tr>
			<td class="td">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
			<td><input class="input" type="password" name="s_pass" id="s_pass" onblur="check('s_pass','pass_msg')" onfocus="focu('s_pass','pass_msg')"></td>
			<td>
			   <div id="pass_msg">密码在6-12位之间的数字字母组合</div>
			</td>
		</tr>
		<tr>
			<td class="td">确认密码:</td>
			<td><input class="input" type="password"  id="s_rpass" onblur="check('s_rpass','rpass_msg')" onfocus="focu('s_rpass','rpass_msg')"></td>
			<td>
			   <div id="rpass_msg">必须与密码相同</div>
			</td>
		</tr>
		<tr>
		  <td class="td">性别:</td>
		  <td><input type="radio" name="s_sex" id="boy" value="男" checked="checked">男
			  <input type="radio" name="s_sex" id="girl" value="女">女<br></td>
		  <td>
		      <div id="sex_msg"></div>
		  </td>
		</tr>
		<tr>
 		    <td class="td">手机号码:</td>
		    <td><input class="input" type="text" name="s_tel" id="s_tel" onblur="check('s_tel','tel_msg')" onfocus="focu('s_tel','tel_msg')"></td>
		    <td>
			   <div id="tel_msg">手机号码必须是 11 位的数字</div>
			</td>
		</tr>
		<tr>
		  <td class="td">地址:</td>
		  <td><select name="s_address">
			    <option value="1">山东省</option>
			     <option value="2">江苏省</option>
		      </select>
		  </td>
		  <td><div></div></td>
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
<script type="text/javascript">
  var msg_text = {
	  name_msg : "用户名不少于两个字符",
	  pass_msg : "密码在6-12位之间的数字字母组合",
	  rpass_msg : "必须与密码相同",
	  tel_msg : "手机号码必须是 11 位的数字"
   };
   var name_id = [
			's_name',
			's_pass' ,
			's_rpass',
			's_tel' ];
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
    	   if(!check(name_id[i],msg_id[i]))   {
    		   flag = false; break;
    		}
       }
       return flag;
   }
</script>
</html>