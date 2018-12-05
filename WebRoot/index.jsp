<%@page import="com.java.service.IntroduceService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
            
            
            
            
            <div class="mainborder" style="overflow:visible">
                <div class="map"><b>搜索</b></div>
                <fieldset class="layui-elem-field">
			  <legend>搜索条件</legend>
			  <div class="layui-field-box">
			    <form class="layui-form" id="sqlform" method="post" action="thing/web_list.do">
			    	 <div class="layui-form-item">
					    <div class="layui-inline">
					      <label class="layui-form-label">名称</label>
					      <div class="layui-input-inline">
					        <input name="name" lay-verify="required" autocomplete="off" class="layui-input">
					      </div>
					    </div>
					    <div class="layui-inline">
					      <label class="layui-form-label">类别</label>
					      <div class="layui-input-inline">
					        <select name="thingtypeId">
							<c:forEach var="list"  items="${thingtype}">
						        <option value="${list.id }">${list.type }</option>
						        </c:forEach>
						      </select>
					      </div>
					    </div>
					  </div>
					  
					   <div class="layui-form-item">
					    <div class="layui-inline">
					      <label class="layui-form-label">地区</label>
					      <div class="layui-input-inline">
					        <select name="thingtype2Id">
								<c:forEach var="list"  items="${left_thingtype2}">
						        <option value="${list.id }">${list.type }</option>
						        </c:forEach>
						      </select>
					      </div>
					    </div>
					    <div class="layui-inline">
					      <label class="layui-form-label"></label>
					      <div class="layui-input-inline">
					        <input class="layui-btn layui-btn-normal"  type="submit" value="提交"></input>
					      </div>
					    </div>
					  </div>
				      
			    </form>
			  </div>
			</fieldset>
            </div>
            
            <div class="mainborder">
                <div class="map"><b>网站简介</b></div>
                <p><img src="images/jj.jpg" style="width:260px; float:left; padding:10px; border:solid 1px #DCDCDC" />
					${intr.content}
				</p>    
            </div>
            
            
            
            
            </td>
        </tr>
    </table>
    
    
    <%@ include file="foot.jsp" %> 
  </body>
</html>
