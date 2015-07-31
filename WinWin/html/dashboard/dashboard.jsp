<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<%
	ThemeDisplay td = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
	String activeTab = (String) request.getAttribute("activeTab");
%>

<script type="text/javascript" src="/Events-portlet/js/jquery.min.js"></script>
<script type="text/javascript">var userId=<%=td.getUserId()%></script>
<div ng-controller="DashboardCntrl" ng-cloak>
	<%@include file="tabs.jsp" %>
	<div class="content-left col-sm-12 dashboard">
	    <div class="tab-content">
	            <%@include file="dashboardMain.jsp" %>
	            <%@include file="network.jsp" %>
	            <%@include file="creation.jsp" %>
	            <%@include file="savedItems.jsp" %>
	    </div><!-- end .tab-content -->
	</div><!-- end .content-left/dashboard -->
    <!-- <div infinite-scroll="loadmore()" infinite-scroll-distance="0">
    </div>-->

	<div ng-show='loadmore.isBusy' class="text-center">
   		<img src="/WinWinTheme-theme/images/assets/ajax-loader.gif" alt=""/>
   	</div>
   	<%@include file="includes/sharePost.jsp"%>
</div>