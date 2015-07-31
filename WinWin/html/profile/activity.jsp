 <div class="tab-pane active" id="activity">

<style>
 	.recommend-bus-logo{
		max-width: 40px;
	 	max-height: 40px;
 	}
 	
 	.recommend-bus-logo:hover{
		max-width: 50px;
	 	max-height: 50px;
 	}
 	.dashboardImage {
 		max-width: 350px;
 		max-height: 200px;
 	}
 	.postImage {
 		max-width: 600px;
 		max-height: 400px;
 	}
</style>

  <!--  <p>{{business.aboutUs}}</p> -->
    
   	<%
   	if (myBusiness.getBusinessId() != business.getBusinessId())
   	{
   	%>
    	<input id="profile-input" ng-model="postContent" class="form-control input-lg large-text-field" placeholder="Talk Business with <%=business.getName()%>" type="text" />
		<a class="btn btn-primary pull-right" ng-click="submitDashboardPost();" data-original-title="" title="">Post</a>
	<%
	}
	%>
    <!-- activity filter start --> 
    <div class="activity-filter">
    <form class="form-inline" role="form">
    <div class="styled-select">
      <div class="form-group" >
            <select ng-model="activityType" class="form-control" ng-change="clearActivity()">
              <option value="all" selected="selected">All Activity</option>
              <option value="b2b">B2B Exchange</option>
              <option value="coop">Co-op Marketing</option>
              <option valye="events">Events</option>
            </select>
      </div>
      </div>

    </form>
	</div> <!-- end filter --> 
    <h3>Recent Activity</h3>
    <% //@include file="pending.jsp" %>
      <div class="media-list dashboard">
        <div class="media bottom-bordered" ng-repeat="post in activity track by $index">
         <a class="pull-left" href="/profile?businessId={{post.businessId}}">
			<img alt="img" class="media-object bus-logo" src="{{post.logo}}" /> 
		</a>

          <div class="media-body">
          	<p class="post-info pull-right">
	        	<img ng-if="post.isPost && !post.isPrivate" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_post.png" />
	        	<img ng-if="post.isWisdom " src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_wisdom.png" />
	        	<img ng-if="post.isB2B" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_b2b.png" />
	        	<img ng-if="post.isCoop" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_coop.png" />
	        	<img ng-if="post.isEvent" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_events.png" />
	        	<img ng-if="post.isPrivate" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_profile.png" />	
	        	<img ng-if="post.isAlliance" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_alliance.png" />	
	        	<br/>
	        	<span am-time-ago="post.postTimestamp"></span>
	        </p>                      
            <p>	
            	
           			<a href="/profile?businessId={{post.businessId}}">
           				{{post.businessName}}
           			</a>
            	
            	<span ng-if="post.privatePost == 'TRUE'">
					<em> Wrote to </em>
			        
			        	<a href="/profile?businessId={{post.targetBusinessId}}">{{post.targetBusinessName}}</a>
			         
			     	<br/>
	        	</span> 

		        <p ng-if="post.isWisdom"><span ng-bind-html="post.content"></span> was posted on Business Wisdom</p>
		        <p ng-if="!post.isWisdom" ng-bind-html="post.content"></p>
	        	</p>
            </p>

			<div ng-if="post.isVideo == 'FALSE'">
				<img ng-if="post.filePath != ''" src="{{post.filePath}}" class="postImage"/>				
			</div>
			
            <div ng-hasSharedPost == 'TRUE'== 'TRUE'">	
				<div class="media-body">
	 					
					<div ng-if="post.sharedPost.isVideo == 'FALSE'">
						<img style="margin-left:25px;" ng-if="post.sharedPost.filePath != ''" src="{{post.sharedPost.filePath}}" class="postImage" />				
					</div>
					
					 <p style="margin-left:25px;">
			        	<em>{{post.sharedPost.content}}</em>
			        </p>
			    </div>
			 
			</div>
			
			<div ng-repeat="comment in post.comments">
		        <div class="media bottom-bordered comment">
		        	<a class="pull-left" href="#">
		        		<img alt="img" class="media-object bus-logo" src="{{comment.logo}}" />
		        	</a>
		
		            <div class="media-body">
		                <p><a href="/profile?businessId={{comment.businessId}}">{{comment.businessName}}</a>
		                <br/>
		                {{comment.content}}
		                </p>
							
		                <ul class="list-inline wisdom-options" ng-if="comment.isMyComment == 'FALSE'">
		                    <li><small>
		                    
		                    <a class="text-muted" ng-if="comment.userRecommended == 'FALSE'" ng-click="recommendComment(comment)">Recommend ({{comment.recommendationCount}})</a></small></li>
		                    <p class="text-muted" ng-if="comment.userRecommended == 'TRUE'">Recommended ({{comment.recommendationCount}})</p>
		                    
		                    <!--<li><small><a class="text-muted" href="#">Options</a></small></li>-->
		                </ul>
		            </div>
		        </div>
	        </div>
	        
	        <div class="clearfix">
	        	<input class="col-xs-12" ng-model="post.newComment" placeholder="Talk Business with <%=business.getName() %>" type="text" ng-keypress="submitCommentFunct($event, post)"/>
	 		</div>
	
	        <ul class="list-inline wisdom-options" ng-if="post.isMyPost != 'TRUE'">
	            <li>
	            	<small>
	            		
	            			<a class="text-muted" ng-if="post.userRecommended == 'FALSE'" ng-click="recommendPost(post)">Recommend ({{post.recommendationCount}})</a>
	            			<p class="text-muted" ng-if="post.userRecommended == 'TRUE'">Recommended ({{post.recommendationCount}})</p>
	            		
	            	</small>
	            </li>
	            <li>
	            	<small>
	            		<a class="text-muted" ng-if="post.userShared == 'FALSE'" data-toggle="modal" ng-click="applyPost(post)" data-target="#sharePostModal">Share ({{post.shareCount}})</a>
	            		<p class="text-muted" ng-if="post.userShared == 'TRUE'">Shared ({{post.shareCount}})</p>
	            	</small>
	            </li>
	            <li><small><a class="text-muted" ng-click="post.showSettings = !post.showSettings">Options</a></small></li>	       
	        </ul>
	        
          </div>
        </div>
      </div>
	<div infinite-scroll="loadActivity()" infinite-scroll-distance="0">
		<div ng-show='activityIsBusy' class="text-center">
			<img src="/WinWinTheme-theme/images/assets/ajax-loader.gif" alt="" />
		</div>
	</div>
</div>
<!-- end .tab -->