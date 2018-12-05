<%@page import="com.java.service.IntroduceService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>

  </head>
  
  <body>
    <%@ include file="top.jsp" %>
    <table class="big" cellpadding="0" cellspacing="0" style="margin-top:10px">
        <tr>
            <td style="width:200px">
                <%@ include file="left.jsp" %> 
            </td>
            
           <td style="width:20px"></td>
            <td style="width:800px">

            
            <div class="mainborder">
                <div class="map"><b>购物车</b></div>
                
               <div class="layui-form">
  <table class="layui-table">
    <thead>
      <tr>
      	<th>产品</th>
        <th>名称</th>
        <th>价格</th>
        <th>操作</th>
      </tr> 
    </thead>
    <tbody>
    <c:forEach var="list"  items="${buying}">
      <tr>
      	<td><img src="${basePath }${list.thing.img}" style="width:100px; border:#CCCCCC; padding:3px" /></td>
        <td>${list.thing.name}</td>
        <td>${list.thing.price }元</td>
        <td><a href="javascript:;;" id="${list.thing.id }" class="del">删除</a></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <div style="width:100%; text-align:right; font-size:16px"><button id="sure" class="layui-btn layui-btn-normal">共计人民币<b style="color:red">${sum }</b>元,确认订单</button></div>  
            </div>
            </div>
            </td>
        </tr>
    </table>
    <%@ include file="foot.jsp" %> 
    
    <script>
    $(function(){ 
    	$(".del").click(function(){
    		var id = $(this).attr("id");
		    $.messager.confirm("系统提示", "您确认要取消吗？", function(r) {
				if (r) {
					$.post("${basePath}buy/delbuying.do", {
						tid:id
					}, function(result) {
						if (result.success) {
								 $.messager.alert("系统提示", result.mgf, "info", function () {
									window.location.reload();
						        }); 
						} else {
							$.messager.alert("系统提示", result.mgf);
						}
					}, "json");
				}
			});
    	});
    	
    	$("#sure").click(function(){
		    $.messager.confirm("系统提示", "您确认要生成订单吗？", function(r) {
				if (r) {
					$.post("${basePath}buy/add.do", function(result) {
						if (result.success) {
								 $.messager.alert("系统提示", result.mgf, "info", function () {
									location.href="${basePath}buy/my_list.do";
						        }); 
						} else {
							$.messager.alert("系统提示", result.mgf);
						}
					}, "json");
				}
			});
    	});
    })
    </script>
  </body>
</html>
