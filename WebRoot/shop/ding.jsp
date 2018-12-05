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
    <title></title>
</head>

  </head>
  
  <body>
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" id="maintable">
        <tr>
            <td class="lefttd"><%@ include file="left.jsp"%></td>
            <td>
  		
<table class="layui-table">
    <thead>
      <tr>
      	<th>图片</th>
        <th>名称</th>
        <th>联系人</th>
        <th>状态</th>
        <th>下单日期</th>
        <%if(request.getParameter("state").equals("0")){ %>
        <th>操作</th>
        <%} %>
      </tr> 
    </thead>
    <tbody>
    <c:forEach var="list"  items="${list}">
      <tr>
      	<td><img src="${basePath }${list.thing.img}" style="width:100px; border:#CCCCCC; padding:3px" /></td>
        <td>${list.thing.name}</td>
        <td>${list.client.name}<span style="color:green" title="联系人：${list.client.name}&#10;联系电话：${list.client.tel}&#10;送餐地址：${list.client.address}">[祥细]</span></td>
        <td>${list.stateText }</td>
        <td><fmt:formatDate value="${list.intime }" pattern="MM-dd"/></td>
        <%if(request.getParameter("state").equals("0")){ %>
        <td><a href="javascript:;;" id="${list.id }" class="state">已处理</a></td>
        <%} %>
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


  	</td>
            <td class="mainrightborder"></td>
        </tr>
    </table>
    <%@ include file="foot.jsp"%>
  	
    <script>
    $(function(){ 
    	$(".state").click(function(){
    		var id = $(this).attr("id");
		    $.messager.confirm("系统提示", "您确认要该笔订单已处理了吗？", function(r) {
				if (r) {
					$.post("${basePath}buy/state.do", {
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
    })
    </script>
  </body>
</html>
