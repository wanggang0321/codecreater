<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="spring" uri="/WEB-INF/tlds/spring.tld"%>
<%@ page import="com.collegepre.aspen.common.utils.URLUtils" language="java"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<%
String basePath = URLUtils.getBasePath(request);
%>
<!doctype html>
<html>
<head>
    <jsp:include page="/WEB-INF/views/modules/common/common_css.jsp"></jsp:include>
</head>
<body>
<input type="hidden" id="j-menu" value="menu-shenhe-browse" />
<!-- header -->
<header class="header mb10"><jsp:include page="/WEB-INF/views/modules/common/header.jsp"></jsp:include></header>
<!-- header end-->

<div class="app">
    <div class="navi-wrap">
        <!-- nav -->
        <div class="app-aside hidden-xs bg-light dker b-r nav"><jsp:include page="/WEB-INF/views/modules/common/nav.jsp"/></div>
        <!-- nav end-->
        <!-- content begin -->
        <div class="app-content">
            <div class="fade-in-up bg-light lter wrapper-md">
                <ul class="breadcrumb">
                    <li class="active">
                        <a class="j-a" href="<%=basePath %>">首页</a> &gt;
                        <span>加盟商合同</span> &gt;
                        <a href="<%=basePath%>tenantadmin/schoolcontract/toapprovallist" class="j-a">审批管理</a> &gt;
                        <span>解约审批</span>
                    </li>
                </ul>
            </div>
            <div class="hbox hbox-auto-xs hbox-auto-sm">
                <div class="wrapper-md">
	                <c:forEach var="item" items="${crmmrolefuncList}">
	                 	<c:if test="${item.parentNAME == '审核管理' && item.onlyMark =='CRM_LR_SHENPI'}">
		                    <div class="statistical-report-list">
		                        <button class="btn statistical-report-btn" onClick="window.location='<%=basePath%>/tenantadmin/enterexamination/enterexaminationbrowse'">录入审批</button>
		                    </div>
	                    </c:if> 
	                    <c:if test="${item.parentNAME == '审核管理' && item.onlyMark =='CRM_ZB_SHENPI'}">
		                    <div class="statistical-report-list">
		                        <button class="btn statistical-report-btn" onClick="window.location='<%=basePath%>/tenantadmin/transfersafeapply/selecttransfersafeapplylist'">转保审批</button>
		                    </div>
	                    </c:if> 
	                    <c:if test="${item.parentNAME == '审核管理' && item.onlyMark =='CRM_SS_SHENPI'}">
		                    <div class="statistical-report-list">
		                        <button class="btn statistical-report-btn" onClick="window.location='<%=basePath%>/tenantadmin/litigationexamination/applyforsuitbrowse'">诉讼审批</button>
		                    </div>
	                    </c:if> 
	                    <c:if test="${item.parentNAME == '审核管理' && item.onlyMark =='CRM_JY_SHENPI'}">
		                    <div class="statistical-report-list">
		                        <button class="btn statistical-report-btn active-bg-3fa6fd" onClick="window.location='<%=basePath%>/tenantadmin/rescissionapply/selectrescissionapplylist'">解约审批</button>
		                    </div>
		                </c:if> 
                    </c:forEach>
                    <div class="clearfix mt15">
						<form class="j-by-form-search" action="" method="post">
	                        <div class="pull-right text-right">
	                        	<div class="dis-i-b max767-search">
                                    <span class="text-select-left">申请日期：</span>
                                    <input id="ast" type="text" value="${applyStartTime}" class="search-input tab-cell Wdate max767-mb0 mr0"
                                           readonly onClick="WdatePicker({readOnly:true,position:{top:2},isShowOK:false,maxDate:'#F{$dp.$D(\'aet\') || \'%y-%M-%d\' }'})">
                                    <span class="text-select-left color-d">-</span>
                                    <input id="aet" type="text" value="${applyEndTime}" class="search-input tab-cell Wdate"
                                           readonly onClick="WdatePicker({readOnly:true,position:{top:2},isShowOK:false,maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'ast\')}'})">
                                </div>
	                            <select class="search-input tab-cell" id="by-solveStatus">
	                                <option value="">按审批状态</option>
	                                <c:if test="${visibleType=='chushen' || visibleType=='ALL' || visibleType=='NO_DATA'}">
		                                <option <c:if test="${solveStatus==1 }">selected="selected"</c:if> value="1">待初审</option>
	                                </c:if>
	                                <c:if test="${visibleType=='chushen' || visibleType=='ershen' || visibleType=='ALL' || visibleType=='NO_DATA'}">
	                                	<option <c:if test="${solveStatus==2 }">selected="selected"</c:if> value="2">待二审</option>
	                                </c:if>
	                                <c:if test="${visibleType=='chushen' || visibleType=='ershen' || visibleType=='zhongshen' || visibleType=='ALL' || visibleType=='NO_DATA'}">
	                                	<option <c:if test="${solveStatus==3 }">selected="selected"</c:if> value="3">待终审</option>
	                                </c:if>
	                                <c:if test="${visibleType=='chushen' || visibleType=='ALL' || visibleType=='NO_DATA'}">
	                                	<option <c:if test="${solveStatus==4 }">selected="selected"</c:if> value="4">初审拒绝</option>
	                                </c:if>
	                                <c:if test="${visibleType=='chushen' || visibleType=='ershen' || visibleType=='ALL' || visibleType=='NO_DATA'}">
		                                <option <c:if test="${solveStatus==5 }">selected="selected"</c:if> value="5">二审拒绝</option>
	                                </c:if>
	                                <c:if test="${visibleType=='chushen' || visibleType=='ershen' || visibleType=='zhongshen' || visibleType=='ALL' || visibleType=='NO_DATA'}">
		                                <option <c:if test="${solveStatus==6 }">selected="selected"</c:if> value="6">终审通过</option>
		                                <option <c:if test="${solveStatus==7 }">selected="selected"</c:if> value="7">终审拒绝</option>
	                                </c:if>
	                            </select>
	                            <div class="dis-in-b">
	                            	<input class="product-search mb20" id="by-searchStr" placeholder="搜索合同编号、中心名称" value="${searchContext }">
	                            	<button class="product-search-btn mb20 icon-select col3fa6fd j-by-search"></button>
	                            </div>
	                        </div>
		                    <input type="hidden" id="pns" class="sHidden" name="pns" value="${pn }" >
		                    <input type="hidden" id="applyStartTime" class="sHidden" name="applyStartTime" value="${applyStartTime }" >
		                    <input type="hidden" id="applyEndTime" class="sHidden" name="applyEndTime" value="${applyEndTime }" >
		                    <input type="hidden" id="solveStatus" class="sHidden" name="solveStatus" value="${solveStatus }" >
		                    <input type="hidden" id="searchContext" class="sHidden" name="searchContext" value="${searchContext }" >
		                    <input type="hidden" id="searchFlag" class="sHidden" name="searchFlag" value="${searchFlag }" />
						</form>
                    </div>
                    <div id="contTab" class="tab-scroll"></div>
                    <div class="pages new-pages"></div>
                </div>
            </div>
            
        </div>
        <!-- content end -->
    </div>
</div>
<!-- footer -->
<div class="app-footer footer mt10"><jsp:include page="/WEB-INF/views/modules/common/footer.jsp"></jsp:include></div>
<!-- footer end-->

<jsp:include page="/WEB-INF/views/modules/common/common_js.jsp"></jsp:include>

<script type="text/javascript" src="<%=basePath%>static/js/common/j-srj-table-data.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/common/j-srj-page.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/tenantadmin/franchiseecontract/rescissionapply/rescissionapply_browse.js"></script>
</body>
</html>