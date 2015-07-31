<%@page import="com.liferay.portal.kernel.util.PropsUtil"%>
<%@page import="com.winwin.portlet.membership.util.MembershipUtil"%>
<portlet:actionURL name="uploadImage" var="uploadImageURL"/>

<script type="text/javascript">
	var useFilter = false;
	var showSinglePost = false;
</script>

<%
	String content = (String) request.getAttribute("content");
	String announcement = (String) request.getAttribute("dashboard.announcement");
	String postId = (String) request.getAttribute("postId");
	boolean showSinglePost = false;
	
	if(content == null)
		content = "";
	
	String showRecommendedInterval = PropsUtil.get("dashboard.recommended.show.every");
	
	if (showRecommendedInterval == null || showRecommendedInterval.trim().length() == 0)
		showRecommendedInterval = "10";
	
	System.out.println("showRecommendedInterval: " + showRecommendedInterval);
	
	String filter = (String) request.getAttribute("industryId");
	
	if (filter != null && filter.trim().length() > 0)
	{
		%>
			<script type="text/javascript">
				var filter = <%=filter%>;
				useFilter = true;
			</script>
		<%
	}
	
	if (postId != null && postId.trim().length() > 0)
	{
		showSinglePost = true;
		
		%>
			<script type="text/javascript">
				var postId = <%=postId%>;
				showSinglePost = true;
				//alert('postId=' + postId);
			</script>
		<%
	}
%>			
 
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
 
<div class="tab-pane active" id="dashboard">

	<%
	if (!showSinglePost)
	{
	%>
	<%=announcement%>
<!-- <div class="panel-group" id="accordion"> 
	<div class="panel panel-default"> 
		<div class="panel-heading"> 
			<h4 class="panel-title"> 
			<div class="top-block" style="color:black; border:none;">
				<a data-parent="#accordion" data-toggle="collapse" href="#dash" style="float:left; border:none; color:black; text-size:16px;" data-original-title="" title="">What is available with our Virtual Conference Room?</a>
				<a data-parent="#accordion" data-toggle="collapse" href="#dash" data-original-title="" title="">
				<img src="/WinWinTheme-theme/images/assets/icon-plus.png"></a>
			</div>
			</h4> 
		</div>
		<div class="panel-collapse collapse" id="dash"> 
			<div class="panel-body" style="background-color: #f5f5f5; border: none; text-align: center;"> 
			<p>Video chat, share a screen, share a whiteboard, share files and, yes, a plethora of smileys are available, too.  Try it out today!</p><br>
			<p>Visit the <a href="/video-chat-help" target="_blank">Video Chat Help</a> page for quick tutorials.</p> 
			</div> 
		</div> 
	</div> 
</div>
-->

		<div class="panel-group" id="accordion" style="border:none;">
			<div class="panel panel-default" style="border:none;">
				<div class="panel-heading" style="border:none;">
					<h4 class="panel-title">
						<a  data-parent="#accordion" href="#dash-drop" data-toggle="collapse" >
							 <textarea class="form-control" name="content" placeholder="Talk Business to Alliances" ng-model="newPost.content" rows="3"></textarea>
						</a>
					</h4>
				</div><!-- panel-heading -->
				<div class="messaging">
	 						<div class="row messageUpload" ng-if="imageUploaded">
		      			<img class="messagingImagePreview" src="{{newPost.imagePath}}"/>
		      			<button class="btn btn-reply" ng-click="removeImage()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		    		</div>
		    	</div>
			</div>
		</div>
	
		<div class="control-panel form-group">
		    <div class="fileUpload" ng-if="postType == '1'">
	
			<!--
		    	<img src="/WinWinTheme-theme/images/assets/paper-pin.png" /> 
		    	<span>Upload Photo/Video</span> 
		    		
		        <input type="file" class="upload" id="imgfile" name="imgfile" onchange="this.form.submit();">
		    -->
		    	<div class="messaging">
		    		
			    	<span class="media-button" ng-if="!imageUploaded">
			    		<img src="/WinWinTheme-theme/images/assets/messaging/icon-img.png"> 
			    		Add Photos 
			    		<input type="file" accept="image/*" ng-disabled="imageUploaded" onclick="this.value=null" ng-file-select="uploadImage($files)">
			    	</span>
		    	</div>
		    </div>
		    
		    <div class="fileUpload" ng-if="postType != '1'"></div>
		  
		    <!--<button class="btn btn-primary pull-right" ng-click="submitDashboardPost();">Post</button>-->
			<a class="btn btn-primary pull-right" ng-click="submitDashboardPost();" >Post</a>
		
			<div class="pull-right">
				<select ng-model="postType" class="styled-select">
					<option value="1" selected>Alliances</option>
					<option value="2">Business Wisdom</option>
				</select>	
			</div>
		</div>
	<%
	}
	%>
	
	<!--</form>-->

	<div class="media-list">
	
	<div class="media bottom-bordered" ng-repeat="post in entries track by $index" ng-if="post.status != 'D'">
		<a class="pull-left" href="/profile?businessId={{post.businessId}}">
			<img alt="img" class="media-object bus-logo" src="{{post.logo}}" /> 
		</a>
	
	    <div class="media-body">
	        
	        <p class="post-info pull-right">
	        	<img ng-if="post.isPost && !post.isPrivate" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_post.png" />
	        	<img ng-if="post.isWisdom" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_wisdom.png" />
	        	<img ng-if="post.isB2B" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_b2b.png" />
	        	<img ng-if="post.isCoop" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_coop.png" />
	        	<img ng-if="post.isEvent" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_events.png" />
	        	<img ng-if="post.isPrivate" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_profile.png" />	
	        	<img ng-if="post.isAlliance" src="/WinWinTheme-theme/images/assets/dashboard/feed/icons_alliance.png" />	
	        	<br/>
	        	<span am-time-ago="post.postTimestamp"></span>
	        </p>
	        
	        <p>
	        		<a href="/profile?businessId={{post.businessId}}">{{post.businessName}}</a>
	        	
	        	<span ng-if="post.sharedPost != null">
				<em> shared </em>
			        		<a href="/profile?businessId={{post.sharedPost.businessId}}">{{post.sharedPost.businessName}}</a>
			        	 <em>posting</em>
	        	</span>
	        	<span ng-if="post.privatePost == 'TRUE'">
				<em> Wrote to </em>
			        		<a href="/profile?businessId={{post.targetBusinessId}}">{{post.targetBusinessName}}</a>
			        	<br/>
	        	</span>
	        </p>
	        <p ng-if="post.isWisdom"><span ng-bind-html="post.content"></span> was posted on Business Wisdom</p>
	        <p ng-if="!post.isWisdom" ng-bind-html="post.content"></p>
	        
			<div ng-if="post.isVideo == 'TRUE'">
					<video ng-if="post.filePath != ''" width="320" height="240" controls>
					  <source src="{{post.filePath}}">
					  Your browser does not support the video tag.
					</video>
			</div>
				
			<div ng-if="post.isVideo == 'FALSE'">
				<img ng-if="post.filePath != ''" src="{{post.filePath}}" class="postImage"/>				
			</div>
			
	
	
			<div ng-hasSharedPost == 'TRUE'">	
			          <div class="media-body">
			       <div ng-if="post.sharedPost.isVideo == 'TRUE'">
						<video ng-if="post.sharedPost.filePath != ''" width="320" height="240" controls>
						  <source src="{{post.sharedPost.filePath}}">
						  Your browser does not support the video tag.
						</video>
					</div>
	  					
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
	        	<input class="col-xs-12" ng-model="post.newComment" placeholder="Talk Business with {{post.businessName}}" type="text" ng-keypress="submitCommentFunct($event, post)"/>
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
	        <ul class="list-inline wisdom-options" ng-if="post.isMyPost == 'TRUE'">
		    	<li>
		    		<small>
		    			<a class="text-muted" ng-click="post.showSettings = !post.showSettings">
		    				Options
		    			</a>
		    		</small>
		    	</li>	   
		    </ul>
	    </div>
	    
	    <div class="post-options" ng-if="post.showSettings && post.isMyPost != 'TRUE'">
		    <ul class="list-unstyled">
		        <li><a data-toggle="modal" data-target="#removeAlliance" ng-click="applyAllianceToRemove(post.businessId)"><small>Remove Alliance</small></a></li>
		        <!-- <li class="active"><a href=""><small>Remove notifications from this alliance</small></a></li> -->
		        <li><a data-toggle="modal" data-target="#reportSpam" ng-click="applySpamDashboardPostId(post.dashboardPostId)"><small>Report as Spam/Abuse</small></a></li>
		    </ul>
		</div>		
	    
	    <div class="post-options" ng-if="post.isMyPost == 'TRUE' && post.showSettings">	    	
	   		<ul class="list-unstyled" ng-if="post.showSettings">
		      	<li><a data-toggle="modal" data-target="#removePost" ng-click="applyPostToRemove(post)"><small>Delete Post</small></a></li>	        
		    </ul>	
	    </div>
	 
	    <div ng-if="$index % <%=showRecommendedInterval%> == 0 && $index > 0">
	    <a href="/alliances#rec-alliances"><button class="btn btn-cancel"><img src="/WinWinTheme-theme/images/assets/gear.jpg">Manage Settings</button></a>
		   <h5>Recommended Alliances</h5>
		    <table width="100%" border="0" class="recommendedBusinesses">
				<tr>
					<td ng-repeat="business in recommended">
						<img class="recommend-bus-logo" src="{{business.logo}}" ng-mouseover="showRecommended(business, $index)" id="image{{recommendedBusiness.businessId}}"/>				
					</td>
			
				</tr>
				<tr>	
					<td colspan="10" class="rec-info">
						<img class="recommend-bus-logo" src="{{recommendedBusiness.logo}}" ng-if="showRequestAlliance"   />				
							<a style="font-size:12px:" target="_blank" href="/profile?businessId={{recommendedBusiness.businessId}}">
							{{recommendedBusiness.name}}</a>			
							<br>
						<p>	{{recommendedBusiness.about}} </p>
							<br>
					<div ng-if="showRequestAlliance" class="rec-info-detail">	
						<div class="row">		            
				           <div class="col-md-6">
				                <ul class="result-bus-info">
				                   <li class="industry">
				                       <small>Industry: <span>{{recommendedBusiness.industry}}</span> </small>
				                   </li>
				                   <li class="address">
				                       <small>Address: <span>{{recommendedBusiness.street}} {{recommendedBusiness.city}}, {{recommendedBusiness.state}} {{recommendedBusiness.zip}}</span></small>
				                   </li>
				               </ul>
				           </div><!-- end col-md-5 result-bus-details -->
				           <div class="col-md-6">
				              <ul class="result-bus-info">
				                   <li class="alliances-num">
				                       <small>Alliances: <span>{{recommendedBusiness.allianceCount}}</span> </small>
				                   </li>
				                   <li class="comm-allies">
				                       <small>Common Alliances: <span>{{recommendedBusiness.commonAlliesCount}}</span></small>
				                   </li>
				               </ul>
				           </div>	
				       	</div><!-- end .col-md-2 result-bus-details -->
				     </div><!-- end col-md-5 result-bus-details -->
					</td>				
				</tr>
				<tr>
					<td colspan="10">
						<div ng-if="showRequestAlliance">
							<div id="request{{recommendedBusiness.businessId}}">
				            	<span class="glyphicon glyphicon-diamond"></span>
				            	<a id="anchor{{recommendedBusiness.businessId}}"  ng-click="sendAllianceRequest($event, recommendedBusiness.businessId);" class="request">
				            		Request Alliance
				            	</a>
				           	</div>
			        	</div>
			        </td>
				</tr>
			</table>
<!-- 
<div class="mobile-ad-container">
	<div class="row">
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <img src="/WinWinTheme-theme/images/assets/spotlights/SimsburyPublicLibrary.png">
	      <div class="caption">
	        <p><a href="#">Visit Profile</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <img src="/WinWinTheme-theme/images/assets/spotlights/SimsburyPublicLibrary.png">
	      <div class="caption">
	        <p><a href="#">Visit Profile</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <img src="/WinWinTheme-theme/images/assets/spotlights/SimsburyPublicLibrary.png">
	      <div class="caption">
	        <p><a href="#">Visit Profile</a></p>
	      </div>
	    </div>
	  </div>
	</div>
</div>
 -->
	    </div>
	</div>	
	
	<div infinite-scroll="loadmore()" infinite-scroll-distance="0"></div>
	   
	</div>
</div>

<%@include file="../modals/alerts/removeAllianceAlert.html"%>
<%@include file="../modals/alerts/removePostAlert.html"%>
<%@include file="../modals/alerts/reportSpamAlert.html"%>

<script>
    /*====== [Business Dashboard] */
    $('.dashboard .dropdown-content').click(function(){
        $(this).find('ul').toggle();
    });
</script>