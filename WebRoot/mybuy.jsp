<%@page import="com.java.service.IntroduceService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <div class="map"><b>我的订单</b></div>
                
               <div class="layui-form">
  <table class="layui-table">
    <thead>
      <tr>
      	<th>产品</th>
        <th>名称</th>
        <th>价格</th>
        <th>状态</th>
        <th>下单日期</th>
        <th>操作</th>
      </tr> 
    </thead>
    <tbody>
    <c:forEach var="list"  items="${list}">
      <tr>
      	<td><img src="${basePath }${list.thing.img}" style="width:100px; border:#CCCCCC; padding:3px" /></td>
        <td>${list.thing.name}</td>
        <td>${list.thing.price }元</td>
        <td>${list.stateText }</td>
        <td><fmt:formatDate value="${list.intime }" pattern="MM-dd"/></td>
        <td><a href="javascript:;;" id="${list.id }" class="del">退订</a></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
 <div style="width:100%; margin-left:24px; background:white; text-align:center" id="pagediv">
						<style>
						#pagediv a,#pagediv a:visited{ color:#A51010; margin:5px; font-size:12px}
						</style>
				  		${pages }
				  		</div>
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
					$.post("${basePath}buy/del.do", {
						id:id
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
									localhost.href="${basePath}buy/my_buy.do";
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
