<%@page import="com.winwin.entities.membership.model.Location"%>
<%@page import="com.winwin.entities.membership.service.persistence.BusinessFinderUtil"%>
<%@page import="com.winwin.entities.membership.service.persistence.BusinessFinderImpl"%>
<%@page import="com.winwin.entities.membership.service.BusinessLocalServiceUtil"%>
<%@page import="com.winwin.portlet.membership.util.MembershipUtil"%>
<%@page import="com.winwin.entities.membership.model.Business"%>
<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />
   
<%
   ThemeDisplay td = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
   
   Business business = MembershipUtil.getBusinessByUserId(td.getUserId());
   //Location location = MembershipUtil.getLocationByBusinessId(business.getBusinessId());
%>

<script type="text/javascript" src="/Events-portlet/js/jquery.min.js"></script>
<script type="text/javascript" src="/Membership-portlet/js/vendor/angular.min.js"></script>
 <!--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&key=AIzaSyC4X4F5wG0oUfNaqoM_n1f2xo9zB7Iv_jk"></script>-->
<script type="text/javascript">
	var userId=<%=td.getUserId()%>;
	var businessId=<%=business.getBusinessId()%>;
	var groupId=<%=td.getScopeGroupId()%>;
</script>

<div class="acct-settings" ng-controller="AccountSettingsCntrl">
	<div class="container">
   		<%@include file="businessProfileCompletion.jsp" %>
   		<div class="row">
                <%@include file="tabs.jsp" %>
            <div class="tab-content">
                <%@include file="businessSettings.jsp" %>
                <%@include file="businessContactSettings.jsp" %>
                <%@include file="businessNotificationSettings.jsp" %>
                <%@include file="businessOrganization.jsp" %>
                <%@include file="verifyCenter.jsp" %>
           <!--include verifyPay.jsp -->    
                <%@include file="verifyDownload.jsp" %>
            <!--include verifySupport.jsp -->  
                <%@include file="businessMembershipSettings.jsp" %>
                <%@include file="businessPasswordSettings.jsp" %>
                <%@include file="businessSupport.jsp" %>
                <%@include file="cancelAccountSettings.jsp" %>
            </div><!-- end .tab-content -->
       	</div><!-- end .row -->
  	</div><!-- end .container -->
</div><!-- end .account-settings wrapper -->