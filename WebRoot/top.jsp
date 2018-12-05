<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path_top = request.getContextPath();
	String basePath_top = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path_top + "/";
	request.setAttribute("basePath_top", basePath_top);
	request.setAttribute("thingtype", request.getSession().getAttribute("thingtype"));
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=basePath_top %>js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=basePath_top %>js/layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath_top %>js/layui/layui.js"  type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath_top %>js/layui/css/layui.css" />
<link class="uiTheme" rel="stylesheet" type="text/css" href="<%=basePath_top %>js/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath_top %>js/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/jquery.cookie.js"></script>

	<link href="<%=basePath_top %>css/StyleSheet.css" rel="stylesheet" type="text/css" />

    <div class="big topbg">
        <div><h1>农产品销售平台</h1></div>
    </div>
    <div id="menu" class="big">
    <div>
        <ul>
            <li><a href="<%=basePath_top %>index.do">首页</a></li>
            <c:forEach var="list"  items="${thingtype}">
            <li><a href="<%=basePath_top %>thing/web_list.do?thingtypeId=${list.id}">${list.type }</a></li>
            </c:forEach>
            <c:forEach var="list"  items="${menu}">
            <li><a href="<%=basePath_top %>news/web_list.do?newstypeId=${list.id}">${list.type }</a></li>
            </c:forEach>
            <li><a href="<%=basePath_top %>shop/web_list.do">商家查看</a></li>
            <li><a href="<%=basePath_top %>introduce/call.do?id=2">加盟联系</a></li>
        </ul>
        </div>
    </div>
    <div class="big">
        <img src="${basePath_top }images/top.jpg" style="width:100%" />
    </div>

