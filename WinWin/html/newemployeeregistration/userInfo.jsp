<%@page import="com.winwin.portlet.membership.util.MembershipUtil"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<portlet:defineObjects />

<portlet:actionURL name="submitUser" var="submitUserURL"/>

<%
	String message = (String) request.getAttribute("message");

	String registrationType = (String) MembershipUtil.safeGetAttribute(request, "registrationType");
	String firstName = (String) MembershipUtil.safeGetAttribute(request, "firstName");
	String lastName = (String) MembershipUtil.safeGetAttribute(request, "lastName");
	String email = (String) MembershipUtil.safeGetAttribute(request, "email");
	String password = (String) MembershipUtil.safeGetAttribute(request, "password");
	String confirmPassword = (String) MembershipUtil.safeGetAttribute(request, "confirmPassword");
	
	String businessId = (String) MembershipUtil.safeGetAttribute(request, "businessId");
	String guid = (String) MembershipUtil.safeGetAttribute(request, "guid");
%>

<script type="text/javascript" src="/Events-portlet/js/jquery.min.js"></script>

<div class="reg-wizard">
  <div class="header">
      <div class="container">
        <div class="title">
          Login Information
        </div>
      </div>
  </div>
  
    <div class="container">
    		<%
			if (message != null)
			{
				%>
				<strong><font color="red"><%=message %></font></strong>
				<%
			}
		%>
	      <div class="main-container">
	        <div class="title-bar">
	          <div class="step">
	            STEP
	            <span>2</span>
	          </div>
	          <div class="info">
	            Fill in Business information below
	          </div>
	        </div>
	        <div class="content-container" id="business-info">
	          <aui:form class="form-horizontal" role="form" action="<%=submitUserURL.toString()%>" method="POST">
	          <input name="registrationType" type="hidden" value="business"/>
			  <input name="businessId" type="hidden" value="<%=businessId%>"/>
			  <input name="guid" type="hidden" value="<%=guid%>"/>
			  
	            <div class="form-group required">
	              <label class="col-sm-2 text-right label-text control-label">
	                First Name:
	              </label>
	              <div class="col-sm-10">
	                <div class="row">
	                  <input name="firstName" id="firstName" type="text" value="<%=firstName%>"> 
	                </div>
	              </div>
	            </div><!-- first name -->
	
	          <div class="form-group required">
	              <label class="col-sm-2 text-right label-text control-label">
	                Last Name:
	              </label>
	              <div class="col-sm-10">
	                <div class="row">
	                  <input name="lastName" id="lastName" type="text" value="<%=lastName%>"> 
	                </div>
	              </div>
	            </div><!-- last name -->
	            <br>
	
	            <div class="form-group required">
	              <label class="col-sm-2 text-right label-text control-label">
	                Email:
	              </label>
	              <div class="col-sm-10">
	                <div class="row">
	                  <input class="form-control" name="email" id="email" type="email" value="<%=email%>"/>
	                </div>
	              </div>
	            </div><!-- email -->
	
	            <br>
	            
	            <div class="form-group required">
	              <label class="col-sm-2 text-right label-text control-label">
	                Password:
	              </label>
	              <div class="col-sm-10">
	                <div class="row">
	                  <input class="form-control" id="password" name="password" type="password" value="<%=password%>"/>
	                </div>
	              </div>
	            </div><!-- password -->
	
	
	            <div class="form-group required">
	              <label class="col-sm-2 text-right label-text rep-pass control-label">
	                Repeat Password:
	              </label>
	              <div class="col-sm-10">
	                <div class="row">
	                  <input class="form-control" id="confirmPassword" name="confirmPassword" type="password" value="<%=confirmPassword%>"/> 
	                </div>
	              </div>
	            </div><!-- repeat password -->
	
	            <div class="text-right">
	              <a class="btn btn-primary btn-lg" onclick="$('#_newemployeeregistration_WAR_Membershipportlet_fm').submit()">Save &amp; Continue</a>
	            </div>
	            <br />
	            <br />
	          </aui:form>
	        </div>
	      </div><!-- main-container -->
      </div><!-- container -->
</div><!-- wizard -->
    
