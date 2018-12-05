<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path_top = request.getContextPath();
String basePath_top = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path_top+"/";
request.setAttribute("basePath_top", basePath_top);
%>
<link href="<%=basePath_top %>admin/css/css.css" rel="stylesheet" type="text/css" />

<script src="<%=basePath_top %>js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=basePath_top %>js/layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath_top %>js/layui/layui.js"  type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath_top %>js/layui/css/layui.css" />
<link class="uiTheme" rel="stylesheet" type="text/css" href="<%=basePath_top %>js/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath_top %>js/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/jquery.cookie.js"></script>


    
       <div id="top">
        <b>农产品销售平台的设计与实现 	</b>
        <ul id="topmenu">
            <li><a href="${basePath_top }index.do" >返回首页</a></li>
            <li><a href="<%=basePath_top %>admin/exit.do" >退出系统</a></li>
        </ul>
    </div>
    