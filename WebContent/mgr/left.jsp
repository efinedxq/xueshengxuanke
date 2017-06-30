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
<title>Insert title here</title>
<style type="text/css">
    
    .menu{
        font-size: 15px;
        width: 120px;
        height: 30px;
        line-height: 30px;
        padding-left: 20px;
        letter-spacing: 3px;
    }
    .item{
        font-size: 12px;
        height:20px;
        line-height: 20px;
        padding-left: 35px;
        letter-spacing: 1px;
    }
    a{
      text-decoration: none;
      cursor: pointer;
    }
    /*鼠标悬停效果*/
    a:hover{
       font-style: italic; 
    }
</style>
</head>
<body bgcolor="#b8d2e8">
    <div class="menu">教师维护</div>
    <div>
       <table>
            <tr>
                <td class="item"><a href="addTea.jsp" target="main">添加教师</a></td>
            </tr>
            <tr>
                <td class="item"><a href="<%=path%>/AllTeasServlet.do" target="main">查询教师</a></td>
            </tr>
       </table>
    </div>
     <div class="menu">课程维护</div>
    <div>
       <table>
            <tr>
                <td class="item"><a href="addKC.jsp" target="main">添加课程</a></td>
            </tr>
            <tr>
                <td class="item"><a href="<%=path%>/AllKcsServlet.do" target="main">查询课程</a></td>
            </tr>
       </table>
    </div>
    <div class="menu">教师排课</div>
    <div>
       <table>
            <tr>
                <td class="item"><a href="<%=path%>/AllKTServlet.do" target="main">添加排课</a></td>
            </tr>
            <tr>
                <td class="item"><a href="<%=path %>/AllRKServlet.do" target="main">查询排课</a></td>
            </tr>
       </table>
    </div>
    <div class="menu">学生维护</div>
    <div>
       <table>
            <tr>
                <td class="item"><a href="addStu.jsp" target="main">添加学生</a></td>
            </tr>
            <tr>
                <td class="item"><a href="<%=path%>/AllStusServlet.do" target="main">查询学生</a></td>
            </tr>
       </table>
    </div>
     <div class="menu">管理员维护</div>
    <div>
       <table>
            <tr>
                <td class="item"><a href="addMgr.jsp" target="main">添加管理员</a></td>
            </tr>
            <tr>
                <td class="item"><a href="<%=path%>/AllMgrsServlet.do" target="main">查询管理员</a></td>
            </tr>
       </table>
    </div>
</body>
</html>