<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%
	ThemeDisplay td = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
%>

<portlet:defineObjects />

<script type="text/javascript" src="/Events-portlet/js/jquery.min.js"></script>
<script type="text/javascript">var companyId = <%=td.getCompanyId()%>;</script>

<div class="registration" ng-controller="RegistrationCntrl">

         <div class="container">
                    <%@include file="tabs.jsp" %>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="tab-content">
                                <%@include file="findBusiness.jsp" %>
                            </div><!-- end .tab-content -->
                        </div><!-- end .col-sm-12 -->
                    </div><!-- end .row -->
        </div><!-- end .container -->
 </div><!-- end .registration -->
 
 
 
 
 

