<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<ul class="menuul">
                    <li class="left_par"><b>产品管理</b></li>
                    <li class="left_chi"><a href="${basePath_top }thing/addpage.do">添加产品</a></li>
                   <li class="left_chi"><a href="${basePath_top }thing/shop_list.do">产品管理</a></li>
                   
                   <li class="left_par"><b>订单管理</b></li>
                    <li class="left_chi"><a href="${basePath_top }buy/shop_list.do?state=0">待处理订单</a></li>
                   <li class="left_chi"><a href="${basePath_top }buy/shop_list.do?state=1">已处理订单</a></li>

                   
                   <li class="left_par"><b>系统管理</b></li>
                    <li class="left_chi"><a href="${basePath_top }shop/shop_editpage.do">更新信息</a></li>
                   <li class="left_chi"><a href="${basePath_top }shop/pwdpage.do">修改密码</a></li>
                   <li class="left_chi"><a href="${basePath_top }shop/exit.do">退出</a></li>

                </ul>
