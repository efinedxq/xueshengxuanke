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
<title>修改管理员</title>
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
<form action="<%=path %>/UpdateMgrServlet.do" method="post" onsubmit="return checkForm()">
      <input type="hidden" name="m_no" value="${mgr.m_no }">
      <table >
		<tr>
			<td class="td">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
			<td><input class="input" type="text" name="m_name" id="m_name" onblur="check('m_name','name_msg')" onfocus="focu('m_name','name_msg')" value="${mgr.m_name}"></td>
			<td>
			   <div id="name_msg">用户名不少于两个字符</div>
			</td>
		</tr>
		<tr>
 		    <td class="td">手机号码:</td>
		    <td><input class="input" type="text" name="m_tel" id="m_tel" onblur="check('m_tel','tel_msg')" onfocus="focu('m_tel','tel_msg')" value="${mgr.m_tel}"></td>
		    <td>
			   <div id="tel_msg">手机号码必须是 11 位的数字</div>
			</td>
		</tr>
		<tr>
 		    <td class="td">状态:</td>
		    <td><input class="input" type="text" name="m_status" id="m_status" onblur="check('m_status','status_msg')" onfocus="focu('m_status','status_msg')" value="${mgr.m_status}"></td>
		    <td>
			   <div id="status_msg">是否删除状态 0 删除 1 保存</div>
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
	  tel_msg : "手机号码必须是 11 位的数字",
	  status_msg:"必须是 0 或 1"
   };
   var name_id = [
			'm_name',
			'm_tel' ,
			'm_status' ];
   var msg_id = [
	   'name_msg',
	   'tel_msg',
	   'status_msg' ];
   
   function check(text_id,msg_id){
	   var name = document.getElementById(text_id);
	   var v = name.value;
	   var msg = document.getElementById(msg_id);
       var flag = false;
	   switch(text_id){
	   case "m_name":
		   if(v.length>=2) flag = true;
		   break;
	   case "m_tel":
		   var reg = /^1[34578][0-9]{9}$/;
		   if(v.match(reg)) flag = true;
		   break;
	   case "m_status":
		   var reg = /^[01]{1}$/;
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

</script>
</html>