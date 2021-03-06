<%@page import="java.sql.Timestamp"%>
<%@page import="com.axp.model.ImageType"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@page import="com.axp.model.Zones"%>
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
<link href="<%=basePath %>css/paging.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
</head>
<script>
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
	//alert(cs.length);
	if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor=highlightcolor;
		}
}

function  changeback(){
	if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
	   return
	if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
	//source.style.backgroundColor=originalcolor
		for(i=0;i<cs.length;i++){
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
	//alert(cs.length);
	if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor=clickcolor;
		}
	else
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor="";
		}
}
</script>
<body style="background:none">
	<form>
		<div class="main" style="height:auto;">
			<div class="header">
				<div class="header-left">
					<p>你当前的位置：[商城管理]-[图文管理]</p>
				</div>
				<div class="header-right">
					<div class="header-right-cell" onclick="addCashshopType();" style="cursor: pointer;">
						<img src="<%=basePath%>img/new-2.png" />
						<p>新增</p>
					</div>
				</div>
				<hr align="center" />
			</div>
			<!--end of header-->
			<div class="pageColumn">
				<table class="list" style="width:98%;margin:0 auto;">
					<thead>
						<th width="3%"><input id="s" name="" type="checkbox" value=""
							onclick="$(this).attr('checked')?checkAll():uncheckAll()" /></th>
						<th width="5%"  style="height:50px;">序号</th>
						<th width="10%">名称</th>
						<th width="9%">图片</th>
						<th width="9%">图片(商城按钮)</th>
						<th width="9%">跳转链接</th>
						<th width="9%">描述</th>
						<th width="9%">修改人</th>
						<th width="9%">所属类别</th>
						<th width="9%">创建时间</th>
						<th width="9%">基本操作</th>
					</thead>
					<tbody>
					<c:forEach items="${list }" var="cashshop" >
							<tr>
								<td><input type="checkbox" name="code_Value" value="${cashshop.id }" /></td>
								<td>${cashshop.id }</td>
								<td>${cashshop.name }</td>
								<td><img src="${RESOURCE_LOCAL_URL }${cashshop.img }" style="width:80px;height:80px;"/></td>
								<td>
									<c:if test="${cashshop.img2!=null}">
										<img src="${RESOURCE_LOCAL_URL }${cashshop.img2 }" style="width:80px;height:80px;"/>
									</c:if>
									
								</td>
								<td><c:if test="${!empty cashshop.url}"><a href="${cashshop.url }">查看</a></c:if></td>
								<td>${cashshop.remark }</td>
								<td>${cashshop.adminUser.loginname }</td>
								<td>${cashshop.imageType.name }</td>
								<td>
									<fmt:formatDate value="${cashshop.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								
								</td>
								<td>
								<div align="center">
									<span class="STYLE4"> <span
										onclick="editCashshopType('${cashshop.id }');" style="cursor: pointer;"> <img
											src="<%=basePath%>constant/tab/images/edt.gif" width="16"
											height="16" />编辑
									</span> <span style="cursor: pointer;"
										onclick="if(!confirm('您确认要删除此数据吗?删除后数据不能恢复!'))return false; else del('${cashshop.id }');"><img
											src="<%=basePath%>constant/tab/images/del.gif" width="16"
											height="16" />删除</span>
									</span>
								</div>
            						
								</td>
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
							<div class="page-box common-page-box" style="text-align:center">
			${requestScope.pageFoot }
		</div>
						</tr>
					</table>

				</div>
			</div>
		</div>
		<!--end of main-->
	</form>
<script>

function addCashshopType(){
	window.location.href="toAdd";
}
function del(id){
	window.location.href="del?id="+id;
}

function editCashshopType(id){
	
	window.location.href="toAdd?id="+id;
}
  
  function checkAll() 
  { 
	  var code_Values = document.all['code_Value']; 
	  if(code_Values.length){ 
	  for(var i=0;i<code_Values.length;i++) 
	  { 
	  code_Values[i].checked = true; 
	  } 
	  }else{ 
	  code_Values.checked = true; 
	  } 
  } 
  function uncheckAll() 
  { 
	  var code_Values = document.all['code_Value']; 
	  if(code_Values.length){ 
	  for(var i=0;i<code_Values.length;i++) 
	  { 
	  code_Values[i].checked = false; 
	  } 
	  }else{ 
	  code_Values.checked = false; 
	  } 
  }

  function mulDelete() 
  { 
	  var num = 0; 
	  var ids="";
	  var code_Values = document.all['code_Value']; 
	  if(code_Values.length){ 
		  for(var i=0;i<code_Values.length;i++) 
		  { 
		     if(code_Values[i].checked == true) 
			  { 
			    num ++;
			     id = code_Values[i].value;
			     ids= ids+ id+",";
			  } 
		  } 
	  }else{ 
		  if(code_Values.checked == true){ 
		     num ++ ; 
		     id = code_Values[i].value;
		     ids= ids+ id+",";
		  } 
	  } 
	  if(num == 0){ 
	    alert('请至少选择一项来删除！'); 
	  } 
	  if(num >0){ 
		  if(ids.length>0){
			  ids = ids.substring(0,ids.length-1);
		  }
		  parent.delMulschool(ids);
	  } 
  } 
</script>
</body>
</html>

