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
                <div class="map"><b>商家列表</b></div>
                
               <div class="layui-form"  lay-skin="line">
  
    <c:forEach var="list"  items="${list}">
    <table class="layui-table">
    <tbody>
      <tr>
      	<td colspan="2"><b>${list.name }</b></td>
      </tr>
      <tr>
      	<td>负责人：${list.people }</td>
      	<td>电话：${list.tel }</td>
      </tr>
      <tr>
      	<td colspan="2">${list.address }</td>
      </tr>
      </tbody>
  </table>
      </c:forEach>
    
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
