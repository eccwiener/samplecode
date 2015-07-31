<%@page import="com.winwin.portlet.membership.util.MembershipUtil"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui" %>

<portlet:defineObjects />

<portlet:actionURL name="submitBusiness" var="submitBusinessURL"/>   
<portlet:resourceURL var="captchaURL"/>
   
<script type="text/javascript" src="/Events-portlet/js/jquery.min.js"></script>
   
<%
	String message = (String) request.getAttribute("message");

	String registrationType = (String) request.getAttribute("registrationType");
	
	//String firstName = "";
	//String lastName = ""; 
	String email = (String) request.getAttribute("email");
	String password = (String) request.getAttribute("password");
	String confirmPassword = (String) request.getAttribute("confirmPassword");
	

    String bizName = (String) MembershipUtil.safeGetAttribute(request, "businessName");
    String webName = (String) MembershipUtil.safeGetAttribute(request, "businessWebsite");
	
	String businessName = (String) request.getAttribute("firstName");
	String businessWebsite = (String) request.getAttribute("lastName");
	
	String street = (String) MembershipUtil.safeGetAttribute(request, "street");
	String street2 = (String) MembershipUtil.safeGetAttribute(request, "street2");
	String city = (String) MembershipUtil.safeGetAttribute(request, "city");
	String state = (String) MembershipUtil.safeGetAttribute(request, "state");
	String postalCode = (String) MembershipUtil.safeGetAttribute(request, "postalCode");
	
	
	String guid = (String) MembershipUtil.safeGetAttribute(request, "guid");
	String type = (String) MembershipUtil.safeGetAttribute(request, "type");
	String invitingBusinessName = (String) MembershipUtil.safeGetAttribute(request, "invitingBusinessName");
	
	String departmentName = (String) MembershipUtil.safeGetAttribute(request, "departmentName");
	
	String about = (String) MembershipUtil.safeGetAttribute(request, "about");
	String industry = (String) MembershipUtil.safeGetAttribute(request, "industry");
	String hear = (String) MembershipUtil.safeGetAttribute(request, "hear");
	String told = (String) MembershipUtil.safeGetAttribute(request, "told");
	String phone = (String) MembershipUtil.safeGetAttribute(request, "phone");
	String ext = (String) MembershipUtil.safeGetAttribute(request, "ext");
	String mobile = (String) MembershipUtil.safeGetAttribute(request, "mobile");
	
	String lastName = (String) MembershipUtil.safeGetAttribute(request, "lastName");
	String firstName = (String) MembershipUtil.safeGetAttribute(request, "firstName");
	 
	
	boolean businessNameDisabled = false;
	
    if (bizName == null || bizName.trim().length() == 0 )
   	{ 
   		lastName = "";
   		firstName= "";
   	}
    else
    {
    	businessName = bizName; 
     	businessWebsite = webName;
   	}	
    
	if (type != null && type.trim().length() > 0)
	{
		if (type.equalsIgnoreCase("D"))
		{
			businessName = invitingBusinessName + " (" + departmentName + ")";
			businessNameDisabled = true;
		}
		
		if (type.equalsIgnoreCase("L"))
		{
			businessName = invitingBusinessName + " (" + city + ", " + state + ")";
			businessNameDisabled = true;
		}
	}
%>

<div class="reg-wizard">

   <div class="header">
      <!--
      <div class="container">
        <div class="title">
          Business Information
        </div>
      </div>
      -->
    </div>
    <div class="container">
      <div class="main-container">
      	<%
			if (message != null)
			{
				%>
					<strong><font color="red"><%=message %></font></strong>				
				<%
			}
		%>
				
        <div class="title-bar">
          <div class="step">
            STEP
            <span>2</span>
          </div>
          <div class="info">
            About Business &amp; Contact Info
          </div>
        </div>
        <div class="content-container" id="business-info">
        	<aui:form class="form-horizontal newBusForm" role="form" id="business-info" action="<%=submitBusinessURL.toString()%>" method="POST">
            	<input type="hidden" name="registrationType" value="<%=registrationType%>">
       			<input type="hidden" name="email" value="<%=email%>">
       			<input type="hidden" name="password" value="<%=password%>">
       			
       			<input type="hidden" name="businessName" value="<%=businessName%>">
       			<input type="hidden" name="businessWebsite" value="<%=businessWebsite%>"> 
       			
       			<input type="hidden" name="confirmPassword" value="<%=confirmPassword%>">
       			<input type="hidden" name="street" value="<%=street%>">
       			<input type="hidden" name="street2" value="<%=street2%>">
       			<input type="hidden" name="city" value="<%=city%>">
       			<input type="hidden" name="state" value="<%=state%>">
       			<input type="hidden" name="postalCode" value="<%=postalCode%>">
       			<input type="hidden" name="guid" value="<%=guid%>">	
       			<input type="hidden" name="invitingBusinessName" value="<%=invitingBusinessName%>"/>	

       			<p id="allfields"><em>All Fields Required</em></p>
       			
				<div class="form-group phone required">
	              <div class="with-ext">
	                <div class="phone-number">
	                  <label class="col-sm-4 text-right label-text control-label">
					    Business Phone Number:
					     </label>
	                  <div class="col-sm-5">
	                    <div class="row">
	                       <input class="form-control" placeholder="10 Digits; Numbers Only; No Spaces or Symbols" value="<%=phone%>" type="text" name="phone" maxlength="10" required>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	 	       <div class="form-group about required">
	              <label class="col-sm-4 text-right label-text control-label">
	               About:
	              </label>
	              <div class="col-sm-8">
	                <div class="row">
	                  <textarea placeholder="Required Field" name="about" id="about-company" rows="7" style="height: 180px" required><%=about%></textarea>
	                </div>
	              </div>
	            </div>	                        	             		
	            <br />
	            <div class="form-group industry required">
	              <label class="col-sm-4 text-right label-text control-label">
	               Industry:
	              </label>
	              <div class="col-sm-8">
	                <div class="row">
		                    <select class="form-control styled-select" id="business.industry" name="industry" required>
		                        <option value="_none">- Select a value -</option>
		                        <option value="1">Agriculture</option>
		                        <option value="5">Construction &amp; Manufacturing</option>
		                        <option value="15">Education</option>
		                        <option value="7">Energy &amp; Defense</option>
		                        <option value="8">Entertainment</option>
		                        <option value="11">Finance</option>
		                        <option value="10">Food &amp; Beverage</option>
		                        <option value="18">Government</option>
		                        <option value="16">Health Care</option>
		                        <option value="13">Media &amp; Communication</option>
		                        <option value="3">Moving &amp; Storage</option>
		                        <option value="17">Non-Profit</option>
		                        <option value="14">Professional Services</option>
		                        <option value="22">Property Management</option>
		                        <option value="21">Real Estate</option>
		                        <option value="19">Retail</option>
		                        <option value="33">Sports</option>
		                        <option value="12">Technology</option>
		                        <option value="2">Transportation</option>
		                        <option value="9">Travel</option>
		                        <option value="20">Wholesale</option>
		                    </select>
                </div>
              </div>
            </div>
            <br />
            <div class="form-group how required">
              <label class="col-sm-5 text-right label-text control-label">
                Referred By:
              </label>
              <div class="col-sm-7">
                <div class="row">
		                    <select class="form-control styled-select" name="hear" required>
						      <option value="_none">- Select a value -</option> 
						      <option value="brochureKiosk">Brochure Kiosk</option>
						      <option value="email">Email</option> 
						      <option value="iadvance">Iadvance Now inc.</option> 
						      <option value="linkedIn">LinkedIn</option> 					      
						      <option value="merchantAdvanceExpress">Merchant Advance Express</option> 
						      <option value="nationalFunding">National Funding</option> 
						      <option value="networkEvent">Networking Event</option> 
						      <option value="platinumRapidFundingGroup">Platinum Rapid Funding Group</option> 
						      <option value="print">Print</option> 						       
						      <option value="radioCommercial">Radio</option> 
						      <option value="searchEngine">Search Engine</option> 
						      <option value="winWinStaffRecruiter">WinWin Staff or Recruiter</option>    
						      <option value="winwinbusiness">A business on WinWinUSA.com</option>       						      					
						      <option value="other">Other</option>
		                    </select>
                </div>
              </div>
            </div>
            <div class="form-group who" id="whoToldYou" style="display:none;">
              <label class="col-sm-5 text-right label-text">
               <!-- Who told you about WinWin? -->
              </label>
              <div class="col-sm-7">
                <div class="row">
                	<select class="form-control styled-select" name="told" value="<%=about%>"></select>
                </div>
              </div>
            </div>
            <br />
	            <div class="form-group first required">
	              <label class="col-sm-4 text-right label-text control-label">
	               First Name:
	              </label>
	              <div class="col-sm-8">
	                <div class="row">	                
	                	<input type="text" value="<%=firstName%>" name="firstName" id="firstName" placeholder="Required Field"  required>			        	                  
	                </div>
	              </div>
	            </div>
	           <br />
	            <div class="form-group last required">
	              <label class="col-sm-4 text-right label-text">
	                Last Name:
	              </label>
	              <div class="col-sm-8">
	                <div class="row">
	                  <input type="text" name="lastName" id="lastName" value="<%=lastName%>" placeholder="Required Field"  required>
	                </div>
	              </div>
	            </div>
           	
           	<div class="form-group captchaReg required">
              	<label class="col-sm-4 text-right label-text control-label">

              	</label>
					
				<div class="col-sm-8">
                	<div class="row">					
						<p style="font-size:12px;"><strong>What code is in the image?<span style="color:red;">*</span></strong></p>
						<liferay-ui:captcha url="<%= captchaURL %>" />
					</div>
              	</div>
      		</div>
	      		
            <div class="text-right">
              <a class="btn btn-primary btn-large" onClick="$('#_newbusinessregistration_WAR_Membershipportlet_fm').submit()">Save &amp; Continue</a>
            </div>
            <br />
          </aui:form>
        </div>
      </div>
    </div>

</div>

<script type="text/javascript">
$(function() {
    $('a').tooltip({placement: 'top'});
});
</script>
