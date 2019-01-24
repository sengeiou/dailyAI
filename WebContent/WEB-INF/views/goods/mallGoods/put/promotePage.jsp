<%@page import="org.apache.commons.lang3.StringUtils" %>
<%@page import="com.axp.util.StringUtil" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="wh" uri="wehua-taglib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	%>
		
<head>
	
    <link href="${BASEPATH_IN_SESSION}css/css.css" rel="stylesheet" type="text/css">
    <link href="${BASEPATH_IN_SESSION}css/manage-stock.css" rel="stylesheet" type="text/css">
    <link href="${BASEPATH_IN_SESSION}css/add/css/global.css" rel="stylesheet" type="text/css">
    <link href="${BASEPATH_IN_SESSION}css/add/css/main.css" rel="stylesheet" type="text/css">	
    <link href="${BASEPATH_IN_SESSION}css/add/css/shop.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${BASEPATH_IN_SESSION}js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${BASEPATH_IN_SESSION}js/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${BASEPATH_IN_SESSION}js/jquery-validation/messages_cn.js"></script>
    <script type="text/javascript" src="${BASEPATH_IN_SESSION}js/layer-v2.0/layer/layer.js"></script>
    <script type="text/javascript" src="${BASEPATH_IN_SESSION}js/WdatePicker.js"></script>
    <script type="text/javascript" src="${BASEPATH_IN_SESSION}js/goods/goodsStandard.js"></script>

	
    <title>商品管理-推广</title>
    <style type="text/css">
    </style>
</head>

<body>
<input type="hidden" class="mypath" value="<%=basePath%>"/>
<div class="div_new_content">
    <div style="margin-left:10px;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
            <tr>

                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="46%" valign="middle">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>

                                        <td width="95%" class="STYLE1">
                                            <div class="header-left">
                                                <p>你当前的位置：[商城管理]-[商品管理]-[推广]</p>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>

                        </tr>
                    </table>
                </td>

            </tr>
        </table>
        </td>
        </tr>
        <tr>
            <td>
                <div class="stock" id="manage">
                    <div class="setion_all">
                        <div class="left">推广到商城</div>
                        <div class="right">
                          
                            <div class="chek">
                                <ul>
                               
                                <c:if test="${jfdh=='show'}">
                                 	<li><input type="checkbox" name="chk" class="chk" id="scm"> <span>积分兑换</span></li>
                       			</c:if>
	                          <%--     <c:if test="${xsms eq 'show' }">
	                            	<li><input type="checkbox" name="chk" class="chk" id="skm"> <span>限时秒杀</span></li>
	                             </c:if> 
	                          <c:if test="${qgtc eq 'show' }">
	                            	 <li><input type="checkbox" name="chk" class="chk" id="lsm"> <span>全国特产</span></li>
	                             </c:if>
	                              <c:if test="${pt eq 'show'}">
	                             	<li><input type="checkbox" name="chk" class="chk" id="tem"> <span>拼团商品</span></li>   
	                             </c:if>   
	                             <c:if test="${hhh eq 'show' }">
	                             	<li><input type="checkbox" name="chk" class="chk" id="hhh"> <span>换货商品</span></li>  
	                             </c:if>  
								<c:if test="${yhq eq 'show'}">
	                             	<li><input type="checkbox" name="chk" class="chk" id="yhq"> <span>普通优惠券</span></li>   
	                             </c:if>  --%>
	                              <c:if test="${jfcj=='show'}">
                                 	<li><input type="checkbox" name="chk" class="chk" id="ldm"> <span>游戏专区</span></li>
                       			</c:if>   
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab">
                        <h4>
                       
                        <c:if test="${jfdh=='show'}">
                        	<span>积分兑换</span>
                        </c:if>
                         <c:if test="${xsms=='show' }">
                          	<span>限时秒杀</span>
                        </c:if>
                         <c:if test="${qgtc=='show' }">
                          	<span>全国特产</span>
                         </c:if>
                          <c:if test="${pt=='show' }">
                          <span>拼团商城</span>
                          </c:if>
                          <c:if test="${hhh=='show' }">
                           <span>换货会</span>
                          </c:if>
                         <c:if test="${yhq=='show'}">
                         	 <span>普通优惠券</span>
                         </c:if>
                          <c:if test="${jfcj=='show'}">
                        	<span>游戏专区活动</span>
                        </c:if>
                            
                        </h4>
                         <ul class="tab_con">
                        	
                         	 <c:if test="${jfdh eq 'show' }">
                            	<jsp:include page="scoreMall.jsp"></jsp:include>
                             </c:if> 
                             <c:if test="${xsms eq 'show' }">
                            	<jsp:include page="seckillMall.jsp"></jsp:include>
                             </c:if> 
                            <c:if test="${qgtc eq 'show' }">
                            	<jsp:include page="localMall.jsp"></jsp:include>
                             </c:if>
                              <c:if test="${pt eq 'show'}">
                             	<jsp:include page="teamMall.jsp"></jsp:include>   
                             </c:if>   
                             <c:if test="${hhh eq 'show' }">
                             	<jsp:include page="changeMall.jsp"></jsp:include>   
                             </c:if>  
							<c:if test="${yhq eq 'show'}">
                             	<jsp:include page="couponMall.jsp"></jsp:include>   
                             </c:if>  
                              <c:if test="${jfcj eq 'show' }">
                            	<jsp:include page="luckMall.jsp"></jsp:include>
                             </c:if> 
                             
                        </ul> 
 					

                        <div style="width:100%;height:50px;"></div>


                    </div>
                </div>
            </td>
        </tr>

        </table>
    </div>
</div>
<script>

  var _canpost = true;
    function submitAjax() {
    	_canpost = true;
        var check = 1;
        var subLengh=1;
        var mallType= $("input:hidden[name='mallType']").val();
        var param = [];
        var lable1 = $("input[name='lable1']").val();
        var lable2 = $("input[name='lable2']").val();
        param.push(lable1);
        param.push(lable2);
        $("#want").val(JSON.stringify(param));
        
        
        var params=[];
        var standardId = $("input[name='standardId']").val();
        var stock = $("#stock").val();
        var standardName = $("input:hidden[name='standardName']").val();
        var price = $("input:hidden[name='price']").val();
        params.push({"specId":standardId,"stock":stock,"specStr":standardName,"price":price});
        $("#standardArray").val(JSON.stringify(params));
        
        
    
        if(check==1){
        $('form').each(function (index, form) {
            if ($(".chek input[name='chk']").eq(index).prop("checked")) {
            	if(_canpost){
            		 $.ajax({
                         type: 'POST',
                         url: 'promote',
                         data: $('form').eq(index).serialize(),
                         async: false,
                         error: function (data) {
                             alert("提交失败");
                             subLengh=1;
                         },
                         success: function (data) {
                        	 subLengh=subLengh+1;
                             alert(data.msg);
                      		  window.location.href="<%= basePath%>"+"/reMallGoods/sellerMallList";
                             $("form:eq(" + index + ") input[name='id']").val(data.id);
                         }
                     });
            	}
            }
        });
        }
    }
    
    
    $('.chk').click(function (event) {
        var index = $(this).parent().index();
        console.log(index);
		

        //勾选checkBox时，增加对应的商城名的span，并且，将第一个勾选的商城名增加current样式；
        if ($(this).prop('checked')) {

            //在选择商城的同时，需要回显该商城数据；(如果有数据的话；)
            returnBack($(this));

            $('.tab h4 span').eq(index).addClass('show').siblings();

            if ($('.chk:checked').length == 1) {
                $('.tab h4 span').eq(index).addClass('current').siblings().removeClass('current');
                $('.tab .tab_con li').eq(index).addClass('current').siblings().removeClass('current');
               
            }
        }
        //去掉勾选时，去掉span，并适宜的更改内容；
        else {
            $('.tab h4 span').eq(index).removeClass('show').removeClass('current');
            if ($('.tab h4 span.current').length == 0) {
                //$('.tab h4 span:visible').eq(0).addClass('current')
                $('.tab h4 span.show').eq(0).addClass('current');
                var showIndex = $('.tab h4 span.show').eq(0).index();
                $('.tab .tab_con li').eq(showIndex).addClass('current').siblings().removeClass('current');
                //alert(1)
            }
            if ($('.chk:checked').length == 0) {
                $('.tab .tab_con li').removeClass('current');
            }

        }
    });

    /*<!-------------tab栏转换效果---------------->*/
    $('.tab h4 span').click(function (e) {
        $('.tab_con').addClass('current');
        $(this).addClass('current').siblings().removeClass('current');
        $('.tab_con li:eq(' + $(this).index() + ')').addClass('current').siblings().removeClass('current');
    });

    $('.stock_btn').click(function (e) {
        $(this).toggleClass('stock_btn_click');
        $(this).parents('.default_con').siblings('.stock_form').toggle();
    });
    function Goto() {
    }
    function deleteCurrentRow(obj) {
        var tr = obj.parentNode.parentNode;
        var tbody = tr.parentNode;
        tbody.removeChild(tr);
    }
    $('.stock_form .btm_in input').click(function (e) {
        $(this).parents('.stock_form').hide();
    });


    //当更改checkBox的时候 决定显示什么-->
    function clickNoStandard(obj) {
        var isChecked = $(obj).prop("checked");
        if (isChecked) {
            $(obj).parent("dd").find("div").css({"display": "inline"}).find("input").val("0");
            $(obj).parent("dd").find("[type='button']").css({"display": "none"});
            $(obj).parent("dd").find(".isNoStandard").val("1");
        } else {
            $(obj).parent("dd").find("div").css({"display": "none"});
            $(obj).parent("dd").find("[type='button']").css({"display": "inline"});
            $(obj).parent("dd").find(".isNoStandard").val("0");
        }
    }
    
  
</script>
</body>
</html>
