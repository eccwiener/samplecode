	<div class="row profile-top"
                ng-mouseenter="hover = true"
                ng-mouseleave="hover = false"
                ng-cloak
            >
            <div class="col-sm-5">
                <div><img class="img-responsive" src="{{business.logo}}" /></div>
            </div>

            <div class="col-sm-6">
            
            	<img class="pull-right" src="/WinWinTheme-theme/images/assets/right-mark.png" ng-if="business.isVerified"/>
                <img class="pull-right" src="/WinWinTheme-theme/images/assets/non-verified_03.png" ng-if="!business.isVerified"/>
                       
	            <%
	            if (myBusiness != null && myBusiness.getBusinessId() == Long.parseLong(businessId))
	            {
	            	%>
	            	<!--<div style="display:none;" ng-class="{show: hover}">-->
	            	<div>
	             	<a data-edit="profile"  class="btn btn-primary" href="/account-settings">
	             		<span class="glyphicon glyphicon-pencil"></span> Edit Profile
	             	</a>
	            	</div>
	            	<%
	            }
	            %>
	        
	            <h3 class="title">{{business.name}}</h3>

                <div class="info clearfix"><img class="pull-left" src="{{business.iconUri}}" />
                    <div class="text-content">
                        <p>Industry - {{business.industry}}</p>

                        <p>Location - {{location.city}}, {{location.state}}</p>
                        
                   	</div>
                </div>

                <ul class="list-inline">
                    <li>
                    	<%
                    	if (myBusiness != null && businessId != null && myBusiness.getBusinessId() != Long.parseLong(businessId))
                    	{
                    	%>
                    	<a data-toggle="modal" data-target="#businessSendMessageModal" ng-click="initSendBusinessMessage(business)">Send Message</a></li>
                    	<%
                    	}
                    	%>
                    <li>
                    	<%
                    	if (myBusiness != null && businessId != null && myBusiness.getBusinessId() != Long.parseLong(businessId))
                        {
	                    	if (!isAlly)
	                    	{
	                    	%>
		                        <div id="request{{business.businessId}}" ng-if="!business.pendingInvite">
		                            <span class="glyphicon glyphicon-diamond"></span>
		                            <a ng-click="sendAllianceRequest($event, business.businessId);" class="request">
		                                Request Alliance
		                            </a>
		                        </div>
		                        <div ng-if="business.pendingInvite">
		                        	<span class="glyphicon glyphicon-checkmark"></span> Awaiting Approval
		                        </div>
		                        <div id="requested{{business.businessId}}" class="muted requested" style="display: none">
		                         <span class="glyphicon glyphicon-checkmark"></span> Awaiting Approval
		                        </div>
	                        <%
	                        }	                       
                        }
	                    %>
                    </li>
                </ul>
            </div>
        </div><!-- profile top-->
