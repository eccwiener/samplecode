<%@page import="com.winwin.portlet.membership.util.MembershipUtil"%>
<portlet:actionURL name="uploadImage" var="uploadImageURL"/>

<%
	String imagePath = (String) request.getAttribute("imagePath");
	String content = (String) request.getAttribute("content");
	String announcement = (String) request.getAttribute("dashboard.announcement");
	
	if (imagePath == null)
		imagePath = "";
	
	if(content == null)
		content = "";
%>

<script type="text/javascript">
	var filePath = "";
</script>				
 
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

	<%=announcement%>
	
	<form id="imgForm" name="imgForm" method="post" action="<%=uploadImageURL.toString()%>" enctype="multipart/form-data">                 
	    	
		<%
			if (imagePath.trim().length() > 0)
			{
				
		        if (MembershipUtil.isVideo(imagePath))
		        {
		        	%>
		        	<script type="text/javascript">
						filePath = "<%=imagePath%>";
					</script>
					<table width="100%">
						<tr>
							<td>
								<textarea class="form-control" name="content" placeholder="Talk Business to Alliances" ng-model="newPost.content" rows="3"><%=content%></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<video width="320" height="240" controls>
								  <source src="<%=imagePath%>">
								  Your browser does not support the video tag.
								</video>
								<input type="hidden" name="filePath" value="<%=imagePath%>">
							</td> 
						</tr>		
					</table>		
		        	<%
		        }
		        else
		        {
				%>
					<script type="text/javascript">
						filePath = "<%=imagePath%>";
					</script>
					<table width="100%">
						<tr>
							<td>
								<textarea class="form-control" name="content" placeholder="Talk Business to Alliances" ng-model="newPost.content" rows="3"><%=content%></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<img src="<%=imagePath%>" class="dashboardImage"/>
								<input type="hidden" name="filePath" value="<%=imagePath%>">
							</td>
						</tr>		
					</table>			
				<%	
		        }
			}
			else
			{
			%>
				<div class="panel-group" id="accordion" style="border:none;">
					<div class="panel panel-default" style="border:none;">
						<div class="panel-heading" style="border:none;">
							<h4 class="panel-title">
								<a  data-parent="#accordion" href="#dash-drop" data-toggle="collapse" >
									 <textarea class="form-control" name="content" placeholder="Talk Business to Alliances" ng-model="newPost.content" rows="3"></textarea>
								</a>
							</h4>
						</div><!-- panel-heading -->
					</div>
				</div>
			<%
			}
		%>
		
		<div class="control-panel">
		    <div class="fileUpload" ng-if="postType == '1'">
	
		    	<img src="/WinWinTheme-theme/images/assets/paper-pin.png" /> 
		    	<span>Upload Photo/Video</span> 
		    	<!--<input class="upload" type="file"/>-->
		    		
		        <input type="file" class="upload" id="imgfile" name="imgfile" onchange="this.form.submit();">
		    </div>
		    
		    <div class="fileUpload" ng-if="postType != '1'"></div>
		  
		    <!--<button class="btn btn-primary pull-right" ng-click="submitDashboardPost();">Post</button>-->
			<a class="btn btn-primary pull-right" ng-click="submitDashboardPost();" >Post</a>
		
			<div class="pull-right">
				<select ng-model="postType" class="form-control">
					<option value="1" selected>Alliances</option>
					<option value="2">Business Wisdom</option>
				</select>	
			</div>
		</div>
	
	</form>

	<div class="media-list">
	
	<div class="media bottom-bordered" ng-repeat="post in entries">
		<a class="pull-left" href="/profile?businessId={{post.businessId}}">
			<img alt="img" class="media-object bus-logo" src="{{post.logo}}" /> 
		</a>
	
	    <div class="media-body">
	        <p class="post-info pull-right">
	        	<small>{{post.postTimestamp}}</small>        
	        	<img ng-if="post.dashboardPostTypeId == '1'" src="/WinWinTheme-theme/images/assets/icon-dimon.png" />
	        	<img ng-if="post.dashboardPostTypeId == '2'" src="/WinWinTheme-theme/images/assets/icon-bulb.png" />
	        </p>
	        <p>
	        	<strong>
	        		<a href="/profile?businessId={{post.businessId}}">{{post.businessName}}</a>
	        	</strong>
	        	
	        	<span ng-if="post.sharedPost != null">
				<em> shared </em>
			        	<strong>
			        		<a href="/profile?businessId={{post.sharedPost.businessId}}">{{post.sharedPost.businessName}}</a>
			        	</strong>  <em>posting</em>
	        	</span>
	        </p>
	        
	        <p>
	        	{{post.content}}
	        </p>
		
			<div ng-if="post.isVideo == 'TRUE'">
					<video ng-if="post.filePath != ''" width="320" height="240" controls>
					  <source src="{{post.filePath}}">
					  Your browser does not support the video tag.
					</video>
			</div>
				
			<div ng-if="post.isVideo == 'FALSE'">
				<img ng-if="post.filePath != ''" src="{{post.filePath}}" class="postImage"/>				
			</div>
			
	
	
			<div ng-hasSharedPost == 'TRUE'== 'TRUE'">	
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
		                <p><strong><a href="/profile?businessId={{comment.businessId}}">{{comment.businessName}}</a></strong>
		                <br/>
		                {{comment.content}}
		                </p>
							
		                <ul class="list-inline wisdom-options" ng-if="comment.isMyComment == 'FALSE'">
		                    <li><small>
		                    
		                    <a class="text-muted" ng-if="comment.userRecommended == 'FALSE'" ng-click="recommendComment(comment)">Recommend ({{comment.recommendationCount}})</a></small></li>
		                    <p class="text-muted" ng-if="comment.userRecommended == 'TRUE'">Recommended ({{comment.recommendationCount}})</p>
		                    
		                    <li><small><a class="text-muted" href="#">Settings</a></small></li>
		                </ul>
		            </div>
		        </div>
	        </div>
	        
	        <div class="clearfix">
	        	<input class="col-xs-12" ng-model="post.newComment" placeholder="Talk Business" type="text" ng-keypress="submitCommentFunct($event, post)"/>
	 		</div>
	
	        <ul class="list-inline wisdom-options" ng-if="post.isMyPost != 'TRUE'">
	            <li>
	            	<small>
	            		<strong>
	            			<a class="text-muted" ng-if="post.userRecommended == 'FALSE'" ng-click="recommendPost(post)">Recommend ({{post.recommendationCount}})</a>
	            			<p class="text-muted" ng-if="post.userRecommended == 'TRUE'">Recommended ({{post.recommendationCount}})</p>
	            		</strong>
	            	</small>
	            </li>
	            <li>
	            	<small>
	            		<a class="text-muted" ng-if="post.userShared == 'FALSE'" data-toggle="modal" ng-click="applyPost(post)" data-target="#sharePostModal">Share ({{post.shareCount}})</a>
	            		<p class="text-muted" ng-if="post.userShared == 'TRUE'">Shared ({{post.shareCount}})</p>
	            	</small>
	            </li>
	            <li><small><a class="text-muted" href="#">Settings</a></small></li>
	        </ul>
	        
	    </div>
	</div>
	
		<table width="100%" border="0">
			<tr>
				<td ng-repeat="business in recommended">
					<img class="recommend-bus-logo" src="{{business.logo}}" ng-mouseover="showRecommended(business)"/>				
				</td>
		
			</tr>
			<tr>	
				<td colspan="10">
					<img class="recommend-bus-logo" src="{{recommendedBusiness.logo}}" ng-if="showRequestAlliance"/>				
					<strong>
						{{recommendedBusiness.name}}			
					</strong>
				</td>
			</tr>
			<tr>
				<td colspan="10">
					{{recommendedBusiness.about}}
				</td>
			</tr>
			<tr>
				<td colspan="10">
					<div ng-if="showRequestAlliance">
						<div id="request{{ecommendedBusiness.businessId}}">
			            	<span class="glyphicon glyphicon-diamond"></span>
			            	<a ng-click="sendAllianceRequest($event, recommendedBusiness.businessId);" class="request">
			            		Request Alliance
			            	</a>
			           	</div>
			           	<div id="requested{{ecommendedBusiness.businessId}}" class="muted requested" style="display: none">
			            	<span class="glyphicon glyphicon-checkmark"></span> Awaiting Approval
			        	</div>
		        	</div>
		        </td>
			</tr>
		</table>
	
	<div infinite-scroll="loadmore()" infinite-scroll-distance="0"></div>
	   
	</div>
</div>
<script>
    /*====== [Business Dashboard] */
    $('.dashboard .dropdown-content').click(function(){
        $(this).find('ul').toggle();
    });
</script>
