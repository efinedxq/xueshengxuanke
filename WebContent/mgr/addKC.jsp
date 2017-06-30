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
<form action="<%=path %>/AddKcServlet.do" method="post" onsubmit="return checkForm()">
      <table >
		<tr>
			<td class="td">课程名:</td>
			<td><input class="input" type="text" name="kc_name" id="kc_name"  onblur="check('kc_name','name_msg')" onfocus="focu('kc_name','name_msg')"></td>
			<td>
			   <div id="name_msg"></div>
			</td>
		</tr>
		<tr>
			<td class="td">学分:</td>
		    <td><input class="input" type="text" name="kc_score" id="kc_score" onblur="check('kc_score','score_msg')" onfocus="focu('kc_score','score_msg')"></td>
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
<script type="text/javascript">
  var msg_text = {
	  name_msg : "课程名不为空",
	  score_msg : "必须是数字"
   };
   var name_id = [
			'kc_name',
			'kc_score' ];
   var msg_id = [
	   'name_msg',
	   'score_msg' ];
   
   function check(text_id,msg_id){
	   var name = document.getElementById(text_id);
	   var v = name.value;
	   var msg = document.getElementById(msg_id);
       var flag = false;
	   switch(text_id){
	   case "kc_name":
		   if(v.length>0) flag = true;
		   break;
	   case "kc_score":
		   var reg = /^[0-9]{2}$/;
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