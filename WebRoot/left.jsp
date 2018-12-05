<%@ page language="java" import="java.util.*,com.java.model.*" pageEncoding="utf-8"%>

<%
	String path_left = request.getContextPath();
	String basePath_left = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path_left + "/";
	pageContext.setAttribute("basePath_left", basePath_left);
	request.setAttribute("thingtype2", request.getSession().getAttribute("thingtype2"));
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="leftborder">
     <div class="lefttop"><b>用户信息</b></div>
     <span>
     	<%if(session.getAttribute("client")==null){ %>
     	<form class="layui-form" id="sqlform" method="post">
         <div>用户：<input id="Text1" name="login" lay-verify="required" type="text" style="width:120px" /></div>
         <div>密码：<input id="Text2" name="pwd" lay-verify="required" type="password" style="width:120px" /></div>
         <div><input id="Button1" type="submit" value="登陆" lay-submit  lay-filter="loginbtn"  type="submit" /><input id="Button2" type="button" value="注册" onclick="location.href='<%=basePath_left%>client/reg.do'" /></div>
         </form>
         <%}else{
	   		Client c=(Client)session.getAttribute("client");
		 %>
		 <div>用户：<%=c.getLogin() %></div>
		 <div>电话：<%=c.getTel() %></div>
		 
		 
		 <div><a href="<%=basePath_left %>buy/my_list.do">购买记录</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=basePath_left %>pinglun/my_list.do">评价管理</a></div>
		 <div><a href="<%=basePath_left %>client/editform.do">修改资料</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=basePath_left %>client/pwd.do">修改密码</a></div>
		 <div><a href="<%=basePath_left %>buy/getbuying.do">购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id="exit" href="<%=basePath_left %>client/exit.do">安全退出</a></div>
		 <%} %>
     </span>
 </div>
  <div class="leftborder">
                    <div class="lefttop"><b>地域分类</b></div>
                    <ul class="typeul">
                    	<c:forEach var="list"  items="${left_thingtype2}">
                        <li><a href="<%=basePath_left %>thing/web_list.do?thingtype2Id=${list.id}">${list.type }</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <script type="text/javascript">
//Demo
layui.use(['form', 'layedit', 'laydate','layer'], function(){
     var form = layui.form
     ,layedit = layui.layedit
     ,laydate = layui.laydate
     ,layer=layui.layer;
   
   //监听提交
     form.on('submit(loginbtn)', function(data){
	       $("#sqlform").form("submit",{
				url : "${basePath_left}client/login.do",
				onSubmit : function() { },
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
							$.messager.alert("系统提示", result.mgf, "info", function () {
								location.href='${basePath}index.do';
					        }); 
						} else {
							$.messager.alert("系统提示", result.mgf);
						}
				}
			});  
    		 return false;
    	}) 
});

$("#exit").click(function(){
    $.messager.confirm("系统提示", "确认要退出吗？", function(r) {
		if (r) {
			 $.post("${basePath}client/exit.do", function(result) {
				if (result.success) {
						 $.messager.alert("系统提示", result.mgf, "info", function () {
							location.href='${basePath}index.do';
				        }); 
				} else {
					$.messager.alert("系统提示", result.mgf);
				}
			}, "json"); 
		}
	});
    return false; // 阻止表单自动提交事件
});
 
</script>
  