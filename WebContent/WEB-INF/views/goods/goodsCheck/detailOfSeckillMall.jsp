<%@page import="com.axp.dao.impl.AdminUserDAOImpl" %>
<%@page import="com.axp.util.StringUtil" %>
<%@page import="com.axp.model.AdminUser" %>
<%@page import="com.axp.dao.AdminUserDAO" %>
<%@page import="com.axp.model.CashshopType" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@    taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wh" uri="wehua-taglib" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    Integer current_user_id = (Integer) request.getSession().getAttribute("currentUserId");
/* AdminUserDAO adao = new AdminUserDAOImpl();
AdminUser user = null;
user = adao.findById(current_user_id); */
    Object o = request.getAttribute("cashshopType");
    CashshopType sc = null;
    String imageurls = null;
    String imageurls1 = null;
    if (o != null) {
        sc = (CashshopType) o;
        imageurls = sc.getImg();
        imageurls1 = sc.getImg2();
    }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="<%=basePath %>css/css.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath %>css/add/css/global.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath %>css/add/css/main.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath %>css/add/css/shop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${BASEPATH_IN_SESSION}ueditor/themes/default/ueditor.css">
    <title>新增商品规格</title>
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${BASEPATH_IN_SESSION}ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${BASEPATH_IN_SESSION}ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="${BASEPATH_IN_SESSION}js/WdatePicker.js"></script>
    <script type="text/javascript" src="${BASEPATH_IN_SESSION}js/goods/goodsStandard.js"></script>
    
    <style type="text/css">
	    tr#tableProperty {
	    		text-align: left;
		}
		td{
	    		padding-right: 50px;
		}
    </style>
</head>

<body>
<div class="div_new_content">
    <div style="margin-left:10px;">

        <div class="header-left">
            <p>你当前的位置：[商城审核]-[商品详情-限时秒杀]</p>
        </div>

        <form action="<%=basePath%>reBaseGoods/save" id="reGoodsForm" method="post">
            <div class="r_con_wrap">
                <div class="r_con_form">
                    <input name="id" type="hidden" id="id" value="">

                    <%--基础商品信息开始--%>
                    <div class="rows">
                        <label>商品名称：</label>
                        <span class="input">
                            <lable>${reGoodsOfSeckillMall.snapshotGoods.name}</lable>
                        </span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>封面图片：</label>
                        <span class="input">
                            <img src="${RESOURCE_LOCAL_URL}${reGoodsOfSeckillMall.snapshotGoods.coverPicOne}" style="width: 150px;height: 150px;;">
                        </span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>简述图：</label>
                        <span class="input">
                            <c:forEach items="${goodsOfBase.listOfDescriptionPics}" var="each">
                                <img src="${RESOURCE_LOCAL_URL}${each}" style="width: 100px;height: 100px;display: inline-block">
                            </c:forEach>
                        </span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>商品标签：</label>
                        <span class="input">
                            <label>${reGoodsOfSeckillMall.snapshotGoods.lablesString}</label>
                        </span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                            <label>市场价：</label>
						<span class="input">
                            <label>${reGoodsOfSeckillMall.displayPrice}</label>
			 			</span>
                            <div class="clear"></div>
                        </div>
                    
                    <%--基础商品信息结束--%>

                    <c:if test="${reGoodsOfSeckillMall.isNoStandard}">
                        <div class="rows">
                            <label>库存：</label>
						<span class="input">
                            <label>${reGoodsOfSeckillMall.noStandardRepertory}</label>
			 			</span>
                            <div class="clear"></div>
                        </div>
                         
                        <div class="rows">
                            <label>单价：</label>
						<span class="input">
                            <label>${reGoodsOfSeckillMall.noStandardPrice}</label>
			 			</span>
                            <div class="clear"></div>
                        </div>
                    </c:if>
                    <c:if test="${!reGoodsOfSeckillMall.isNoStandard}">
                        <div class="rows">
                            <label>规格：</label>
						<span class="input">
                        <div class="tableArea" style="display: none;">
                            <table id="table">
                                <thead>
                                <tr id="tableProperty" class="headLine">
                                    ${reGoodsOfSeckillMallTableHead}
                                    <th>库存</th>
                                    <th>售价</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="newbody">
                                    ${reGoodsOfSeckillMallTableLine}
                                </tbody>
                            </table>
                        </div>
                        <script>
                            $(function () {
                                $(".tableArea").css({"display": "block"});
                            });
                        </script>
			 			</span>
                            <div class="clear"></div>
                        </div>
                    </c:if>

                    <div class="rows">
                        <label>每人限购：</label>
						<span class="input">
                            <label>${reGoodsOfSeckillMall.seckillCountLimit}</label>
			 			</span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>秒杀区域：</label>
						<span class="input">
                            <dd>
                                ${reGoodsOfSeckillMall.seckillArea==0?'<input type="radio" name="seckillArea" value="0" checked><span>当地</span>':'<input type="radio" name="seckillArea" value="0"><span>当地</span>'}
                                ${reGoodsOfSeckillMall.seckillArea==1?'<input type="radio" name="seckillArea" value="1" checked><span>全国</span>':'<input type="radio" name="seckillArea" value="1"><span>全国</span>'}
                            </dd>
			 			</span>
                        <div class="clear"></div>
                    </div>

                    <div class="rows">
                        <label>配送方式：</label>
						<span class="input">
                            <dd>
                                ${reGoodsOfSeckillMall.transportationType==1?"<input type=radio name='transportationType' value='1' checked/>":"<input type=radio name='transportationType' value='1'/>"}
                                <span>包邮</span>
                                ${reGoodsOfSeckillMall.transportationType==2?"<input type=radio name='transportationType' value='2' checked/>":"<input type=radio name='transportationType' value='2'/>"}
                                <span style="margin-right:0;">邮费</span>
                                <input type="text" name="transportationPrice" class="txt" value="${reGoodsOfSeckillMall.transportationPrice}">
                                <span>元</span>
                                ${reGoodsOfSeckillMall.transportationType==3?"<input type=radio name='transportationType' value='3' checked/>":"<input type=radio name='transportationType' value='3'/>"}
                                <span>到店消费</span>
                                ${reGoodsOfSeckillMall.transportationType==4?"<input type=radio name='transportationType' value='4' checked/>":"<input type=radio name='transportationType' value='4'/>"}
                                <span>上门自取</span>
                            </dd>
			 			</span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>上架时间：</label>
						<span class="input">
                            <label>${reGoodsOfSeckillMall.addedTime}</label>
			 			</span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>下架时间：</label>
						<span class="input">
                            <lable>${reGoodsOfSeckillMall.shelvesTime}</lable>
			 			</span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>秒杀时段：</label>
						<span class="input">
                            <dd class="seckillTimes">
                                <c:forEach items="${timesList }" var="times">
                                    <input type="checkbox" name="times" class="times"
                                           value=${times.id }>&nbsp;${times.startTime }~${times.endTime }&nbsp;&nbsp;
                                </c:forEach>
                            </dd>
                            <script>
                                //用于回显秒杀时间段；
                                $(function () {
                                    var a =${reGoodsOfSeckillMall.arrayForReturnBack};
                                    var inputs = $(".seckillTimes input");
                                    $.each(inputs, function (index, obj) {
                                        var v = $(obj).val();
                                        for (var i = 0; i < a.length; i++) {
                                            if (v == a[i]) {
                                                $(obj).prop("checked", true);
                                            }

                                        }
                                    });
                                });
                            </script>
			 			</span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>商品详情：</label>
						<span class="input">
							<a href="${BASEPATH_IN_SESSION}goodsCheck/goodsDetails?baseGoodsId=${goodsOfBase.id}">查看商品详情</a>
						</span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>已上架商城：</label>
						<span class="input">
                            <label>${goodsOfBase.launchMallsName}</label>
			 			</span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>未上架商城：</label>
						<span class="input">
                            <label>${goodsOfBase.unLaunchMallsName}</label>
			 			</span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>审核描述：</label>
						<span class="input">
							<textarea class="checkDesc" name="checkDesc"></textarea>
						</span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label></label>
						<span class="input">
							<input type="button" value="审核通过" onclick="pass(${reGoodsOfSeckillMall.id},true);" style="color:#fff; font-size:1.0rem; line-height:2.5rem; width:6.0rem; background:#0e93d8; border-radius:3px; cursor:pointer;"/>
							<input type="button" value="审核不通过" onclick="pass(${reGoodsOfSeckillMall.id},false);" style="color:#fff; font-size:1.0rem; line-height:2.5rem; width:6.0rem; background:#0e93d8; border-radius:3px; cursor:pointer;"/>
						</span>
                        <div class="clear"></div>
                        <script>
                            function pass(goodsId, isPass) {
                                var d = $(".checkDesc").val();
                                $.post("checkOfSeckillMall", {"goodsId": goodsId, "checkDesc": d, "isPass": isPass}, function (data) {
                                    alert(data.message);
                                    location.href = "listOfSeckillMall";
                                });
                            }
                        </script>
                    </div>
                </div>
            </div>

        </form>

    </div>
    <div style="width:100%;height:20px;">
    </div>
</div>
<div id="baseGoods">
 	<jsp:include page="historyGoodsDetails.jsp"></jsp:include>
</div>
</body>

</html>
