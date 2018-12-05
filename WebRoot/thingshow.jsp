<%@page import="com.java.service.IntroduceService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
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
                <div class="map"><b>${thing.name}</b></div>
                <div style="overflow:hidden">
                <%-- <img src="<%=basePath %>${thing.img}" style=" float:left; width:300px; padding:5px; border:solid 1px #CCCCCC; margin:10px" /> --%>
                <div style="width:100%; text-align:center"><img src="<%=basePath %>${thing.img}" style=" width:500px; padding:5px; border:solid 1px #CCCCCC; margin:10px" /></div>
                <div style="text-align:center; width:500px; margin:0px auto;">
                <ul class="jinmes">
                    <li>名称：${thing.name}</li>
                    <li>类别：${thing.thingtype.type}</li>
                    <li>包装：${thing.thingtype2.type}</li>
                    <li>价格：${thing.price}元</li>
                    <li>商家：${thing.shop.name}</li>
                </ul> 
                <input type="button" id="buy" style="display:block; width:93px; height:40px; background:url(${basePath}images/timg.jpg); border-width:0px" />
                </div>
                
                
                </div>
                <div class="content">
                	${thing.content}
                </div>
                <div class="map"><b>点评</b></div>
                <c:forEach var="list"  items="${pinglun_list}">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
				  <legend>来自会员<b style="color:orange">${list.client.login }</b>的点评：${list.title }</legend>
				</fieldset>
				 
				<blockquote class="layui-elem-quote layui-quote-nm">
				  ${list.content }
				</blockquote>
				</c:forEach>
				<form class="layui-form" id="sqlform" method="post">
				<div class="layui-form-item">
				    <label class="layui-form-label">点评主题</label>
				    <div class="layui-input-block">
				      <input name="title" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">点评内容</label>
				    <div class="layui-input-block">
				      <textarea id="content" name="content" lay-verify="content" style="width:98%; height:100px"></textarea>
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">&nbsp;</label>
				    <div class="layui-input-block">
				      <input class="layui-btn layui-btn-normal" lay-submit  lay-filter="demo1"  type="submit" value="点 评"></input>
				    </div>
				  </div>
				  </form>
            </div>
            </td>
        </tr>
    </table>
    
    
    <%@ include file="foot.jsp" %> 
        <script>
    $(function(){ 
    	$("#buy").click(function(){
    		var id=${thing.id};
		    $.messager.confirm("系统提示", "您确认要加入购物车吗？", function(r) {
				if (r) {
					$.post("${basePath}buy/buying.do", {
						id:id
					}, function(result) {
						$.messager.alert("系统提示", result.mgf, "info", function () {
							location.href='${basePath}buy/getbuying.do';
				        }); 
					}, "json");
				}
			});
    	});
    })
    </script>
  	<script type="text/javascript">
//Demo
layui.use(['form', 'layedit', 'laydate','layer','element'], function(){
   var form = layui.form
   ,layedit = layui.layedit
   ,laydate = layui.laydate
   ,element=layui.element
   ,layer=layui.layer;
//创建一个编辑器
 var editIndex = layedit.build('content');
//同步编辑器，否则获取不到更新的内容
 form.verify({
	   content: function(value){
		      layedit.sync(editIndex);
		    }
	})

//监听提交
 form.on('submit(demo1)', function(data){
	       $("#sqlform").form("submit",{
				url : "${basePath}pinglun/add.do?id=${thing.id}",
				onSubmit : function() { },
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
							$.messager.alert("系统提示", result.mgf, "info", function () {
								location.href='${basePath}thing/show.do?id=${thing.id}';
					        }); 
						} else {
							$.messager.alert("系统提示", result.mgf);
						}
				}
			});  
		 return false;
	}) 
});
	
</script>
  </body>
</html>
