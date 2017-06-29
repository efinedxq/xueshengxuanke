<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<style type="text/css">
   *{
      font-size: 14px;
   }
   .input{
       width: 150px;
       border: 1px solid gray;
   }
   .btn{
     height: 30px;
     width: 70px;
     margin-right: 10px;
     color: red;
   }
   #main{
      position:absolute;
      width:300px;
      height:200px;
      background-color: #8899FF;
      top: 50%;
      left: 50%;
      margin-top: -140px;
      margin-left: -150px; 
   }
   #log_text{
      font-size: 20px;
      color: #1a16bf;
      padding:20px 0px;
   }
</style>
<!--     <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"> -->
<!--     <script type="text/javascript" src="../bootstrap/js/jquery.js"></script> -->
<!--     <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script> -->
</head>
<body bgcolor="#b8d2e8">
<div  id="main">
<form   action="" method="post">
  <div id="log_text" align="center">教师登录</div>
  <table >
    <tr>
      <td width="30"></td>
      <td>账号：</td>
      <td>
        <input class="input" type="text" name="t_no" id="t_no">
      </td>
      <td>
      </td>
    </tr>
    <tr>
       <td height="10">
           <div id="no_msg"></div>
       </td>
    </tr>
     <tr>
       <td width="30"></td>
       <td>密码：</td>
       <td>
         <input class="input" type="password" name="t_pass" id="t_pass">
       </td>
       <td>
       </td>
    </tr>
    <tr>
       <td height="10"><div id="pass_msg"></div>
       </td>
    </tr>
    <tr>
		  <td></td>
		  <td></td>
		  <td>
		    <!--  如果该控件的值 不需要保存到数据库中
		          那么该控件不需要提供 name属性  -->
		    <input class="btn" type="submit" value="添加">
		    <input class="btn" type="reset" value="重置">
		  </td>
		  <td></td>
		</tr>
  </table>
</form>
</div>
</body>
</html>