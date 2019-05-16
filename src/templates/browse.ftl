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
<input type="hidden" value="menu-apply-fapiao" id="j-menu">
<!-- header -->
<header class="header mb10"><jsp:include page="/WEB-INF/views/modules/common/header.jsp"></jsp:include></header>
<!-- header end-->

<div class="app">
    <div class="navi-wrap">
        <!-- nav -->
        <div class="app-aside hidden-xs bg-light dker nav"><jsp:include page="/WEB-INF/views/modules/common/nav.jsp"/></div>
        <!-- nav end-->
        
        <!-- content begin -->
        <div class="app-content">
            <div class="fade-in-up bg-light lter wrapper-md">
                <ul class="breadcrumb">
                    <li class="active">
                        <a href="<%=basePath %>" class="j-a">首页</a> &gt;
                        <span>发票管理</span> &gt;
                        <span>发票审核</span>
                    </li>
                </ul>
            </div>
			
            <div class="hbox hbox-auto-xs hbox-auto-sm">
                <div class="wrapper-md tab-big">
					<div class="">
                    	<div class="col-8">
	                		<div class="tab-title mt20 j-tabtitle j-wait-overview tab-title-active" ><a>待处理发票申请</a></div>
	                        <div class="tab-title mt20 j-tabtitle j-approved-overview"><a>已处理发票申请</a></div>
                		</div>
						<c:if test="${roleType=='0' || roleType=='1'}">
	                        <div class="pull-right col-4 mt25" >组织：
		                    	<a href="javascript:void(0);" class="j-lisa-select" title="${rootName}">
		                    		<c:if test="${not empty rootName}">
			                 			<c:if test="${fn:length(rootName) > 8}">
			                          		${fn:substring(rootName, 0, 8)}...
			                          	</c:if>
			                          	<c:if test="${fn:length(rootName) <= 8}">
			                          		${rootName}
			                          	</c:if>
									</c:if>
		                    	</a>
		                    </div>
	                    </c:if>
                    </div>
                    
                    <div class="row tab-main-header mt30">
						<form class="j-by-form-search" action="" method="post">
							<div class="search text-right">
								<div class="dis-inline">
									<select class="search-input tab-cell" id="j-form-dateType">
										<option value="1" <c:if test="${dateType==1 }">selected="selected"</c:if>>按申请日期</option>
										<option value="2" <c:if test="${dateType==2 }">selected="selected"</c:if>>按开课日期</option>
									</select>
									<input id="ast" type="text" value="${applyStartTime}" class="search-input tab-cell Wdate max767-mb0 mr0"
										readonly onClick="WdatePicker({readOnly:true,position:{top:2},isShowOK:false,maxDate:'#F{$dp.$D(\'aet\') || \'%y-%M-%d\' }'})">
									<span class="text-select-left color-d">-</span>
									<input id="aet" type="text" value="${applyEndTime}" class="search-input tab-cell Wdate"
										readonly onClick="WdatePicker({readOnly:true,position:{top:2},isShowOK:false,maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'ast\')}'})">
									<select class="search-input tab-cell" id="j-form-contractStatus">
										<option value="">合同状态</option>
										<option <c:if test="${contractStatus==2 }">selected="selected"</c:if> value="2">已生效</option>
										<option <c:if test="${contractStatus==4 }">selected="selected"</c:if> value="4">已结束</option>
										<option <c:if test="${contractStatus==7 }">selected="selected"</c:if> value="7">已终止</option>
										<option <c:if test="${contractStatus==8 }">selected="selected"</c:if> value="8">退费审核</option>
									</select>
									<div class="dis-in-b">
		                            	<input class="product-search mb20 search-input-w5" id="j-form-searchContext" placeholder="搜索客户姓名、手机号、合同编号" value="${searchContext }">
		                            	<button class="product-search-btn mb20 icon-select col3fa6fd j-by-search"></button>
									</div>
								</div>
							</div>
							<input type="hidden" id="pns" class="sHidden" name="pns" value="${pn }" >
							<input type="hidden" id="dateType" class="sHidden" name="dateType" value="${dateType }" >
							<input type="hidden" id="applyStartTime" class="sHidden" name="applyStartTime" value="${applyStartTime }" >
							<input type="hidden" id="applyEndTime" class="sHidden" name="applyEndTime" value="${applyEndTime }" >
							<input type="hidden" id="contractStatus" class="sHidden"  name="contractStatus" value="${contractStatus }" >
							<input type="hidden" id="searchContext" class="sHidden" name="searchContext" value="${searchContext }" >
							<input type="hidden" id="searchFlag" class="sHidden" name="searchFlag" value="${searchFlag }" />
                           	<input type="hidden" id="requireOrgId" name="requireOrgId" class="sHidden" value="${requireOrgId }">
		                    <input type="hidden" id="requireOrgName" name="requireOrgName" class="sHidden" value="${rootName}" />
						</form>
                    </div>
                    
                    <!-- 列表 -->
                    <div id="contTab" class="tab-scroll"></div>
                    <!-- 翻页 -->
                    <div class="pages new-pages"></div>
                    
                </div>
            </div>
        </div>
		
    </div>
	<!-- content end -->
	
</div>

<!-- footer -->
<div class="app-footer footer mt10"><jsp:include page="/WEB-INF/views/modules/common/footer.jsp"></jsp:include></div>
<!-- footer end-->

<jsp:include page="/WEB-INF/views/modules/common/common_js.jsp"></jsp:include>

<script type="text/javascript" src="<%=basePath%>static/js/common/j-srj-table-data.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/common/j-srj-page.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/tenantadmin/invoicewait/invoicewait_browse.js?t=20190424"></script>
</body>
</html>
