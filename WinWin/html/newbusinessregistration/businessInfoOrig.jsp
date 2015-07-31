<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<portlet:defineObjects />

<portlet:actionURL name="submitBusiness" var="submitBusinessURL"/>   
   
<script type="text/javascript" src="/Events-portlet/js/jquery.min.js"></script>
   
<%
	String registrationType = (String) request.getAttribute("registrationType");
	String firstName = (String) request.getAttribute("firstName");
	String lastName = (String) request.getAttribute("lastName");
	String email = (String) request.getAttribute("email");
	String password = (String) request.getAttribute("password");
	String confirmPassword = (String) request.getAttribute("confirmPassword");
%>

<div class="registration" >
	<div class="container">
		<div class="clearfix">
			<ul class="nav-tabs nav">
				<li class="active"><a data-toggle="tab">Business Information</a></li>
			</ul>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="tab-content">
   					<aui:form class="tab-pane active" id="business-info" action="<%=submitBusinessURL.toString()%>" method="POST">
                		<input type="hidden" name="registrationType" value="<%=registrationType%>">
                		<input type="hidden" name="firstName" value="<%=firstName%>">
                		<input type="hidden" name="lastName" value="<%=lastName%>">
                		<input type="hidden" name="email" value="<%=email%>">
                		<input type="hidden" name="password" value="<%=password%>">
                		<input type="hidden" name="confirmPassword" value="<%=confirmPassword%>">
                		
		                <div class="form-group">
		                    <label class="control-label">Business Name:</label>
		                    <input type="text" class="form-control" name="businessName" id="businessName" required>
		                </div>
		                <div class="form-group">
		                    <label class="control-label">Website Address:</label>
		                    <input type="text" class="form-control" name="businessWebsite" ng-model="business.website">
		                </div>
		                <div class="form-group">
		                    <label class="control-label">Tell us about the business</label>
		                    <textarea class="form-control" name="about" id="about-company" rows="7" style="height: 180px" required></textarea>
		                </div>
		
		                <div class="form-group">
		                    <label class="control-label">Pick an  Industry</label>
		                    <select class="form-control" id="business.industry" name="industry" required>
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
		
		                <div class="form-group">
		                    <label class="control-label">How did you hear about WinWin?</label>
		                    <select type="text" class="form-control" name="hear" required>
		                        <option value="_none">- Select a value -</option>
		                        <option value="Radio Commercial">Radio Commercial</option>
		                        <option value="WinWin Staff or Recruiter">WinWin Staff or Recruiter</option>
		                        <option value="Email or Advertising">Email or Advertising</option>
		                        <option value="Networking Event">Networking Event</option>
		                        <option value="Promotion">Promotion</option>
		                        <option value="Brochure Kiosk">Brochure Kiosk</option>
		                        <option value="Search Engine">Search Engine</option>
		                        <option value="Call Center">Call Center</option>
		                        <option value="bfmmail">BFM Mail Campaign</option>
		                    </select>
		                </div>
		
		                <div class="form-group">
		                    <label class="control-label">Who told you about WinWin?</label>
		                    <select type="text" class="form-control" name="told">
		                        <option value="_none">- Select a value -</option>
								<option value="880 WCBS">880 WCBS</option>
								<option value="1010 WINS">1010 WINS</option>
								<option value="Business News Weekly">Business News Weekly</option>
								<option value="Call Center">Call Center</option>
								<option value="Huffington Post">Huffington Post</option>
								<option value="LIBN">LIBN</option>
								<option value="Mashable">Mashable</option>
								<option value="Received an e-mail">Received an e-mail</option>
								<option value="Cindy Mardenfeld">Cindy Mardenfeld</option>
								<option value="Contractors for Kids">Contractors for Kids</option>
								<option value="Corrine Zeidler">Corrine Zeidler</option>
								<option value="Donette Kingston">Donette Kingston</option>
								<option value="Eddie Lopez">Eddie Lopez</option>
								<option value="Joe Urraro">Joe Urraro</option>
								<option value="John Templeton">John Templeton</option>
								<option value="Kim DaSilva">Kim DaSilva</option>
								<option value="Laurie DiGiacomo">Laurie DiGiacomo</option>
								<option value="Melissa Kirby">Melissa Kirby</option>
								<option value="Michael Ilardi">Michael Ilardi</option>
								<option value="Michelle Bernstein">Michelle Bernstein</option>
								<option value="Mike Crimmins">Mike Crimmins</option>
								<option value="Richard Nornes">Richard Nornes</option>
								<option value="Rob Kwasnicki">Rob Kwasnicki</option>
								<option value="Rory Hedels">Rory Hedels</option>
								<option value="Tom Tellekamp">Tom Tellekamp</option>
								<option value="Tony Reis">Tony Reis</option>
								<option value="Troy Caruso">Troy Caruso</option>
								<option value="bfm">BFM</option>
		                    </select>
		                </div>
		
		                <div class="form-group">
		                    <label  class="control-label">Business phone number</label>
		                    <input  class="form-control" type="text" name="phone" required>
		                </div>
		
		                <div class="form-group"
		                        >
		                    <label class="phone-ext control-label">ext.</label>
		                    <input class="form-control" type="text" name="ext">
		                </div>
		
		                <div class="form-group">
		                    <label class="control-label">Mobile phone number</label>
		                    <input  class="form-control" type="text" name="mobile">
		                </div>
		        		<div class="form-group">
				            <div class="text-right">
				                <a class="btn btn-orange" onClick="$('#_newbusinessregistration_WAR_Membershipportlet_fm').submit()">Save &amp; Continue</a>
				            </div>
		        		</div><!-- end .form-group -->
		   			</aui:form>
				</div>
			</div> <!-- end .tab-content -->
		</div> <!-- end .col-sm-12 -->
	</div> <!-- end .row -->
</div> <!-- end .container -->
<!-- end .registration -->