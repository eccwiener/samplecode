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
	
	String street = (String) MembershipUtil.safeGetAttribute(request, "street");
	//String street2 = (String) MembershipUtil.safeGetAttribute(request, "street2");
	String city = (String) MembershipUtil.safeGetAttribute(request, "city");
	String state = (String) MembershipUtil.safeGetAttribute(request, "state");
	String postalCode = (String) MembershipUtil.safeGetAttribute(request, "postalCode");
	String guid = (String) MembershipUtil.safeGetAttribute(request, "guid");
	String type = (String) MembershipUtil.safeGetAttribute(request, "type");
	String departmentName = (String) MembershipUtil.safeGetAttribute(request, "departmentName");
	String invitingBusinessName = (String) MembershipUtil.safeGetAttribute(request, "invitingBusinessName");
	String newYork = "NY";
	if (state.length() == 0) {
	state = newYork;
	}
%>

<script type="text/javascript" src="/Events-portlet/js/jquery.min.js"></script>

<div class="reg-wizard" >

	<!--
  <div class="header">
      <div class="container">
        <div class="title">
          Login Information
        </div>
      </div>
  </div>
  -->
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
	            <span>1</span>
	          </div>
	          <div class="info">
	            Free Business Profile Setup
	          </div>
	        </div>
	       <div class="content-container new-bus" id="business-info">	        	
	          <aui:form class="form-horizontal" role="form" action="<%=submitUserURL.toString()%>" method="POST">
	          <input name="registrationType" type="hidden" value="business"/>
			  <input name="type" type="hidden" value="<%=type%>"/>
			  <input name="guid" type="hidden" value="<%=guid%>"/>
			  <input name="invitingBusinessName" type="hidden" value="<%=invitingBusinessName%>"/>
			  <input name="departmentName" type="hidden" value="<%=departmentName%>"/>

	          <div class="form-group regTop bizName required">
	              <label class="col-sm-3 text-right label-text control-label">
	                Business Name:
	              </label>
	              <div class="col-sm-9">
	                <div class="row">
	                  <input name="firstName" id="firstName" placeholder="Required Field"  type="text" value="<%=firstName%>" required> 
	                </div>
	              </div>
	          </div><!-- first name -->
	
	            <div class="form-group street regTop">
	            <label class="col-sm-3 text-right label-text">
	                Street Address:
	              </label>
	              <div class="col-sm-9">
	                <div class="row">
	                  <input class="form-control" id="street" name="street" type="text" value="<%=street%>" /> 
	                </div>
	              </div>
	            </div><!-- street -->

	            <div class="clearfix address-field-group">
                     
                    <div class="form-group regTop city required">
	              <label class="col-sm-3 text-right label-text control-label">
	                City:
	              </label>
                     <div class="col-sm-9">
                         <div class="row ">                         	
                             <input type="text" placeholder="Required Field" class="form-control" id="city" name="city" required value="<%=city%>" />
                         </div>
                     </div>
                     </div>
                     
                   <div class="form-group regTop state required">
	                <label class="col-sm-3 text-right label-text control-label">
	                State:
	              </label>
                     <div class="col-sm-9">
                         <div class="row">
                             <!--<input type="text" class="form-control" id="state" name="state" required value="<%=state%>" required />-->                            
                             <select class="styled-select" id="state" name="state" required>
                             	<option value="">Select State</option>
								<option value="AL">Alabama</option>
								<option value="AK">Alaska</option>
								<option value="AZ">Arizona</option>
								<option value="AR">Arkansas</option>
								<option value="CA">California</option>
								<option value="CO">Colorado</option>
								<option value="CT">Connecticut</option>
								<option value="DE">Delaware</option>
								<option value="DC">District Of Columbia</option>
								<option value="FL">Florida</option>
								<option value="GA">Georgia</option>
								<option value="HI">Hawaii</option>
								<option value="ID">Idaho</option>
								<option value="IL">Illinois</option>
								<option value="IN">Indiana</option>
								<option value="IA">Iowa</option>
								<option value="KS">Kansas</option>
								<option value="KY">Kentucky</option>
								<option value="LA">Louisiana</option>
								<option value="ME">Maine</option>
								<option value="MD">Maryland</option>
								<option value="MA">Massachusetts</option>
								<option value="MI">Michigan</option>
								<option value="MN">Minnesota</option>
								<option value="MS">Mississippi</option>
								<option value="MO">Missouri</option>
								<option value="MT">Montana</option>
								<option value="NE">Nebraska</option>
								<option value="NV">Nevada</option>
								<option value="NH">New Hampshire</option>
								<option value="NJ">New Jersey</option>
								<option value="NM">New Mexico</option>
								<option value="NY">New York</option>
								<option value="NC">North Carolina</option>
								<option value="ND">North Dakota</option>
								<option value="OH">Ohio</option>
								<option value="OK">Oklahoma</option>
								<option value="OR">Oregon</option>
								<option value="PA">Pennsylvania</option>
								<option value="RI">Rhode Island</option>
								<option value="SC">South Carolina</option>
								<option value="SD">South Dakota</option>
								<option value="TN">Tennessee</option>
								<option value="TX">Texas</option>
								<option value="UT">Utah</option>
								<option value="VT">Vermont</option>
								<option value="VA">Virginia</option>
								<option value="WA">Washington</option>
								<option value="WV">West Virginia</option>
								<option value="WI">Wisconsin</option>
								<option value="WY">Wyoming</option>
							</select>				
                         </div>
                     </div>
                    </div>
                     
                     <div class="form-group regTop zip required">
               		<label class="col-sm-3 text-right label-text control-label">
	                Zip Code:
	              </label>
                     <div class="col-sm-9">
                         <div class="row">
                             <input type="text" class="form-control" placeholder="Required Field" id="postalCode" name="postalCode" required value="<%=postalCode%>" required />
                         </div>
                     </div>
                     </div>
                 </div>	
	
	          <div class="form-group website regTop">
	              <label class="col-sm-3 text-right label-text control-label">
	                Website:
	              </label>
	              <div class="col-sm-9">
	                <div class="row">
	                  <input name="lastName" id="lastName" type="text" value="<%=lastName%>"> 
	                </div>
	              </div>
	            </div><!-- last name -->
	            <br>
	
	            <div class="form-group email required">
	              <label class="col-sm-3 text-right label-text control-label">
	                Email:
	              </label>
	              <div class="col-sm-9">
	                <div class="row">
	                  <input class="form-control" placeholder="Required Field" name="email" id="email" type="email" value="<%=email%>" required/>
	                </div>
	              </div>
	            </div><!-- email -->
	
	            <br>
	          
	            <div class="form-group password1 required">
	              <label class="col-sm-3 text-right label-text control-label">
	                Password:
	              </label>
	              <div class="col-sm-9">
	                <div class="row">
	                  <input class="form-control" id="password" name="password" type="password" placeholder="Required Field" value="<%=password%>" required/>
	                </div>
	              </div>
	            </div><!-- password -->
	
	            <div class="form-group password1 pass2 required">
	              <label class="col-sm-3 text-right label-text control-label">
	                Repeat Password:
	              </label>
	              <div class="col-sm-9">
	                <div class="row">
	                  <input class="form-control" id="confirmPassword" name="confirmPassword" type="password" placeholder="Required Field" value="<%=confirmPassword%>" required/> 
	                </div>
	              </div>
	            </div><!-- repeat password -->
				<div class="text-center">
                <p style="text-align:center; margin-top:20px; margin-bottom:20px;">Site usage is permitted under WinWin's <a href="/terms-of-use" target="_blank">Terms of Use</a> and <a href="/privacy-policy" target="_blank">Privacy Policy</a> hereby agreed to by clicking Save &amp; Continue.</p>
            	</div>
	            <div class="text-right">
	              <a class="btn btn-primary btn-lg" onclick="$('#_newbusinessregistration_WAR_Membershipportlet_fm').submit()">Save &amp; Continue</a>
	            </div>
	            <br />
	            <br />
	          </aui:form>
	        </div>
	      </div><!-- main-container -->
      </div><!-- container -->
</div><!-- wizard -->
    
<script type="text/javascript">
	$("#state").find ("option [value ='<%=state%>']").attr("selected", true); 
</script>
    
