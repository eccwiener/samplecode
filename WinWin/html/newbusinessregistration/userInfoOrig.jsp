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
%>

<script type="text/javascript" src="/Events-portlet/js/jquery.min.js"></script>

<div class="registration" >
	<div class="container">
		<%
			if (message != null)
			{
				%>
				<strong><font color="red"><%=message %></font></strong>
				<%
			}
		%>
		
		<div class="clearfix">
			<ul class="nav-tabs nav">
				<li class="active"><a data-toggle="tab" href="#login-info">Login Information</a></li>
			</ul>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="tab-content">
					<aui:form class="tab-pane active" action="<%=submitUserURL.toString()%>" method="POST">
						<input name="registrationType" type="hidden" value="business"/>

						<div class="form-group">
							<label class="control-label" for="firstName">First Name:</label> 
							<input class="form-control" name="firstName" id="firstName" type="text" value="<%=firstName%>"/>
						</div>

						<div class="form-group">
							<label for="lastName">Last Name:</label> 
							<input class="form-control" name="lastName" id="lastName" type="text" value="<%=lastName%>"/>
						</div>

						<div class="form-group">
							<label for="email">Email</label> 
							<input class="form-control" name="email" id="email" type="email" value="<%=email%>"/>
						</div>

						<div class="form-group">
							<label for="password">Password</label> 
							<input class="form-control" id="password" name="password" type="password" value="<%=password%>"/>
						</div>

						<div class="form-group">
							<label for="confirmPassword">Confirm Password</label> 
							<input class="form-control" id="confirmPassword" name="confirmPassword" type="password" value="<%=confirmPassword%>"/>
						</div>

						<div class="text-right form-group">
							<a class="btn btn-orange" onclick="$('#_newbusinessregistration_WAR_Membershipportlet_fm').submit()">Save &amp; Continue</a>
						</div>
					</aui:form>
				</div>
			</div> <!-- end .tab-content -->
		</div> <!-- end .col-sm-12 -->
	</div> <!-- end .row -->
</div> <!-- end .container -->
<!-- end .registration -->