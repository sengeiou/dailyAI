<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="wh" uri="wehua-taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=basePath%>css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/css2.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/paging.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
</head>
<script>
function add(){
	window.location.href='<%=basePath%>newRedPaperAsset/getAssetDetail.action'; 
}
function edit(id){
	window.location.href="<%=basePath%>newRedPaperAsset/getAssetDetail.action?id="+id; 
}
function del(id,t){
var url = "<%=basePath%>newRedPaperAsset/invalidAsset.action?id="+id;
$.post(url,{},function(){
	//$(t).parent().parent().parent().remove();
	$(t).parent().html("已冻结");
});
}
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
	source=event.srcElement;
	if  (source.tagName=="TR"||source.tagName=="TABLE")
	   return;
	while(source.tagName!="TD")
		source=source.parentElement;
	source=source.parentElement;
	cs  =  source.children;
	if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
		for(var i=0;i<cs.length;i++){
			cs[i].style.backgroundColor=highlightcolor;
		}
}

function  changeback(){
	if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
	   return
	if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
		for(var i=0;i<cs.length;i++){
			cs[i].style.backgroundColor="";
		}
}

function  clickto(){
	source=event.srcElement;
	if  (source.tagName=="TR"||source.tagName=="TABLE")
	   return;
	while(source.tagName!="TD")
	   source=source.parentElement;
	source=source.parentElement;
	cs  =  source.children;
	if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
		for(var i=0;i<cs.length;i++){
			cs[i].style.backgroundColor=clickcolor;
		}
	else
		for(var i=0;i<cs.length;i++){
			cs[i].style.backgroundColor="";
		}
}
</script>
<body>
	<form action="<%=basePath%>newRedPaperAsset/list.action" method="post">
		<div class="main" style="height:auto;">
			<div class="header">
				<div class="header-left">
					<p>你当前的位置：[红包管理]-[授权红包额度]-[额度历史]</p>
				</div>
				<hr align="center" />
			</div>
			<div class="div_search">	
					<c:if test="${asset.adminUser!=null}">${asset.adminUser.loginname}</c:if>
					<c:if test="${asset.seller!=null}">${asset.seller.name}</c:if>
					&nbsp;&nbsp;&nbsp;现有额度：<fmt:formatNumber maxFractionDigits="2" value="${asset.positionSurplus}" type="number" />元
					<span style="float:right; margin-right:30px;">总记录：${count}条</span>
			</div>
			<!--end of header-->
			<div class="pageColumn">
				<table class="list" style="width:98%;margin:0 auto;">
					<thead>
						<th width="3%"  style="height:50px;">序号</th> 
						<th width="5%">新增日期</th>
						<th width="5%">新增额度</th>
						<th width="5%">当前可用额度</th>
						<th width="5%">总额度</th>
						<th width="5%">有效期至</th>
						<th width="5%">操作者</th>
						<th width="8%">备注</th>
					</thead>
					<tbody>
						<c:forEach items="${logList }" var="data">
							<tr>
								<td>${data.id }</td>
            					<td><fmt:formatDate value="${data.createTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            					<td><fmt:formatNumber maxFractionDigits="2" value="${data.positions}" type="number" />元</td>
            					<td><fmt:formatNumber maxFractionDigits="2" value="${data.asset.positionSurplus}" type="number" />元</td>
            					<td><fmt:formatNumber maxFractionDigits="2" value="${data.asset.positionTotal}" type="number" />元</td>
            					<td><fmt:formatDate value="${data.asset.endTime}" type="date" pattern="yyyy-MM-dd"/></td>
            					<td>${data.remitter.loginname }</td>
            					<td>${data.remark }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!--end of pageColunm-->
			<div class="footer">
				<div class="page">
					<table>
						<tr>
							<div class="page-box common-page-box" style="text-align:center">${requestScope.pageFoot }</div>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!--end of main-->
	</form>
</body>
</html>
