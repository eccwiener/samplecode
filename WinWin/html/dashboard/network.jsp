<%@page import="com.winwin.entities.membership.model.Location"%>
<%@page import="com.winwin.entities.membership.model.Business"%>
<%
	Business business = (Business) request.getAttribute("business");
	Location location = (Location) request.getAttribute("location");
	
	String zip = (location != null ? location.getZip() : "unknown");
%>

   <div class="tab-pane network" id="network">
    <div class="col-sm-12"> 
        <h1>Invite more businesses to WinWin </h1>

       <!-- individual e-mail invite -->  
        <div class="individual-invite">
	        <form action="" class="form-email">
	
	        	<label>  <p style="font-size:12px;">Enter the email address below: <a href="#" data-toggle="tooltip" title="Invite More! Separate e-mail addresses with commas" style="text-decoration:none; margin-left:5px; font-weight:999;">?</a> </p> </label>
                 <!-- HTML to write --> 

 	        	
	            <input ng-model="emailToInvite" class="col-xs-12 email-address" placeholder="Email@address.com" type="email" />
	
	            <div class="row">
	                <div class="col-xs-4 small-mobile-fullWidth">
	                    <input class="btn-orange" id="invite-business-btn" ng-click="inviteViaEmail()" type="submit" value="Invite Business">
	                </div> 
	            </div>
	        </form>
        </div> <!-- end indivudle invite --> 

        <h3 style="font-size: 18px;">Local Businesses Near (<%=zip%>)</h3>
        <div class="business-blocks">
        
        	<div class="single-business-block" ng-repeat="prospect in prospects">
                <h4>{{prospect.businessName}}</h4>

                <p><span>{{prospect.city}}, {{prospect.state}}</span></p>

                <p><span>{{prospect.distance}}</span></p>
                
                <a ng-if="prospect.status=='A'" ng-click="sendInvite(prospect)">Send invite</a>
          		<p ng-if="prospect.status!='A'">Invited</p>
          	</div>
			
            <div infinite-scroll="loadProspects()" infinite-scroll-distance="0"></div>
        </div>
    </div><!-- end .col-sm-12 -->
   </div>
   <div ng-show='isProspectsBusy' class="text-center">
   		<img src="/WinWinTheme-theme/images/assets/ajax-loader.gif" alt=""/>
   </div>
<script type="text/javascript">
$(function() {
    $('a').tooltip({placement: 'right'});
});
</script>