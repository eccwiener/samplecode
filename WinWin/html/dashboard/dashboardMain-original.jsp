<%@page import="com.winwin.portlet.membership.util.MembershipUtil"%>
<portlet:actionURL name="uploadImage" var="uploadImageURL"/>

<%
	String imagePath = (String) request.getAttribute("imagePath");
	String content = (String) request.getAttribute("content");
	
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
<div class="top-block">Your business should add all of your employees <a href="#"><img src="/WinWinTheme-theme/images/assets/icon-plus.png" /></a></div>
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
			<textarea class="form-control" name="content" placeholder="Talk Business to Alliances" ng-model="newPost.content" rows="3"></textarea>
		<%
		}
	%>
	 
	
	<div class="control-panel">
	    <div class="fileUpload">
	    	<img src="/WinWinTheme-theme/images/assets/paper-pin.png" /> 
	    	<span>Upload Photo/Video</span> 
	    		<!--<input class="upload" type="file"/>-->
	    		
	            <input type="file" class="upload" id="imgfile" name="imgfile" onchange="this.form.submit();">
	                      
	    	
	    </div>
	  
	    <!--<button class="btn btn-primary pull-right" ng-click="submitDashboardPost();">Post</button>-->
		<a class="btn btn-primary pull-right" ng-click="submitDashboardPost();">Post</a>
	
	    <div class="dropdown-content pull-right">
	       	<span>
	       		<img src="/WinWinTheme-theme/images/assets/icon-allies.png" />Alliances</span>
	        <img class="arrow" src="/WinWinTheme-theme/images/assets/arrow-down.png" />
	        <ul>
	            <li><a href="#"><span><img src="/WinWinTheme-theme/images/assets/icon-bulb.png" /> Business Wisdom</span></a></li>
	         <!--   <li><a href="#"><span><img src="/WinWinTheme-theme/images/assets/icon-rss.png" /> WinWin Post</span></a></li> -->
	        </ul>
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
        	<img src="/WinWinTheme-theme/images/assets/icon-dimon.png" />
        </p>
        <p>
        		<a href="/profile?businessId={{post.businessId}}">{{post.businessName}}</a>
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
		
		<p>&nbsp;</p>
		
		<div ng-hasSharedPost == 'TRUE'== 'TRUE'">		
	
			<a class="pull-left" href="/profile?businessId={{post.sharedPost.businessId}}">
				<img alt="img" class="media-object bus-logo" src="{{post.sharedPost.logo}}" /> 
			</a>
		
		    <div class="media-body">
		        <p class="post-info pull-right">
		        	<small>{{post.sharedPost.postTimestamp}}</small>
		        	<img src="/WinWinTheme-theme/images/assets/icon-dimon.png" />
		        </p>
		        <p>
		        		<a href="/profile?businessId={{post.sharedPost.businessId}}">{{post.sharedPost.businessName}}</a>
		        </p>
		        
		        <p>
		        	{{post.sharedPost.content}}
		        </p>
		        
		        <div ng-if="post.sharedPost.isVideo == 'TRUE'">
					<video ng-if="post.sharedPost.filePath != ''" width="320" height="240" controls>
					  <source src="{{post.sharedPost.filePath}}">
					  Your browser does not support the video tag.
					</video>
				</div>
					
				<div ng-if="post.sharedPost.isVideo == 'FALSE'">
					<img ng-if="post.sharedPost.filePath != ''" src="{{post.sharedPost.filePath}}" class="postImage"/>				
				</div>
				
				<p>&nbsp;</p>
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
	                    
	                    <li><small><a class="text-muted" href="#">Options</a></small></li>
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
            <li><small><a class="text-muted" href="#">Options</a></small></li>
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
					{{recommendedBusiness.name}}			
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

<div class="media bottom-bordered"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-orange.png" /> </a>

    <div class="media-body">
        <p class="post-info pull-right"><small>5 mins ago</small><img src="/WinWinTheme-theme/images/assets/icon-dimon.png" /></p>

        <p><u>Liberty Properteis LLC</u> Lorem Ipsum is <u>simply dummy text</u></p>

        <div class="clearfix"><input class="col-xs-12" placeholder="Talk Business" type="text" /></div>

        <ul class="list-inline wisdom-options">
            <li><small><a class="text-muted" href="#">Recommend</a></small></li>
            <li><small><a class="text-muted" href="#">Share</a></small></li>
            <li><small><a class="text-muted" href="#">Options</a></small></li>
        </ul>
    </div>
</div>

<div class="media bordered"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-blue.png" /> </a>

    <div class="media-body">
        <p class="post-info pull-right"><img src="/WinWinTheme-theme/images/assets/rss-corner-icon.png" /></p>

        <p>Liberty Properteis LLC <i>Posted</i> simply dummy text</p>

        <p class="text-muted">Free set of 1000 business cards with any order over $100</p>

        <div class="clearfix"><input class="col-xs-12" placeholder="Talk Business" type="text" /></div>

        <ul class="list-inline wisdom-options">
            <li><small><a class="text-muted" href="#">Recommend</a></small></li>
            <li><small><a class="text-muted" href="#">Share</a></small></li>
            <li><small><a class="text-muted" href="#">Options</a></small></li>
        </ul>
    </div>
</div>

<div class="media highlighted comment"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-maroon.png" /> </a>

    <div class="media-body">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

        <ul class="list-inline wisdom-options">
            <li><small><a class="text-muted" href="#">Recommend</a></small></li>
            <li><small><a class="text-muted" href="#">Share</a></small></li>
            <li><small><a class="text-muted" href="#">Settings</a></small></li>
        </ul>
    </div>
</div>

<div class="post-options">
    <ul class="list-unstyled">
        <li><a href=""><small>Remove Ally</small></a></li>
        <li class="active"><a href=""><small>Remove notifications from this ally</small></a></li>
        <li><a href=""><small>Report as Spam/Abuse</small></a></li>
    </ul>
</div>

<hr />
<div class="media bottom-bordered"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-blue.png" /> </a>

    <div class="media-body">
        <p class="post-info pull-right"><small>35 mins ago</small><img src="/WinWinTheme-theme/images/assets/icon-chat.png" /></p>

        <p>Liberty Properteis LLC</p>

        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>

        <ul class="list-inline wisdom-options">
            <li><small><a class="text-muted" href="#">Recommend</a></small></li>
            <li><small><a class="text-muted" href="#">Share</a></small></li>
            <li><small><a class="text-muted" href="#">Settings</a></small></li>
        </ul>

        <div class="media bottom-bordered comment"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-maroon.png" /> </a>

            <div class="media-body">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

                <ul class="list-inline wisdom-options">
                    <li><small><a class="text-muted" href="#">Recommend</a></small></li>
                    <li><small><a class="text-muted" href="#">Share</a></small></li>
                    <li><small><a class="text-muted" href="#">Settings</a></small></li>
                </ul>
            </div>
        </div>

        <div class="clearfix"><input class="col-xs-12" placeholder="Talk Business" type="text" /></div>
    </div>
</div>

<div class="media bottom-bordered"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-blue.png" /> </a>

    <div class="media-body">
        <p class="post-info pull-right"><small>1 hour ago</small><img src="/WinWinTheme-theme/images/assets/icon-pencil.png" /></p>

        <p>Liberty Properteis LLC <i>New Service - Web Design</i></p>

        <ul class="list-inline wisdom-options">
            <li><small><a class="text-muted" href="#">Recommend</a></small></li>
            <li><small><a class="text-muted" href="#">Share</a></small></li>
            <li><small><a class="text-muted" href="#">Settings</a></small></li>
        </ul>

        <div class="media comment"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-maroon.png" /> </a>

            <div class="media-body">
                <p>Liberty Properteis LLC Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>

                <ul class="list-inline wisdom-options">
                    <li><small><a class="text-muted" href="#">Recommend</a></small></li>
                    <li><small><a class="text-muted" href="#">Share</a></small></li>
                    <li><small><a class="text-muted" href="#">Settings</a></small></li>
                </ul>
            </div>
        </div>

        <div class="media comment"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-maroon.png" /> </a>

            <div class="media-body">
                <p>Liberty Properteis LLC Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>

                <ul class="list-inline wisdom-options">
                    <li><small><a class="text-muted" href="#">Recommend</a></small></li>
                    <li><small><a class="text-muted" href="#">Share</a></small></li>
                    <li><small><a class="text-muted" href="#">Settings</a></small></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="media bottom-bordered"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-blue.png" /> </a>

    <div class="media-body">
        <p class="post-info pull-right"><small>2 hour ago</small><img src="/WinWinTheme-theme/images/assets/light-bulb.png" /></p>

        <p>Liberty Properteis LLC</p>

        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

        <div class="clearfix"><input class="col-xs-12" placeholder="Talk Business" type="text" /></div>

        <ul class="list-inline wisdom-options">
            <li><small><a class="text-muted" href="#">Favor</a></small></li>
            <li><small><a class="text-muted" href="#">Comment</a></small></li>
        </ul>
    </div>
</div>

<div class="media bottom-bordered">

    <div class="media-body">
        <p class="post-info pull-right"><small>2 hour ago</small><img src="/WinWinTheme-theme/images/assets/light-bulb.png" /></p>

        <p>Liberty Properteis LLC</p>

        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

        <div class="clearfix"><input class="col-xs-12" placeholder="Talk Business" type="text" /></div>

        <ul class="list-inline wisdom-options">
            <li><small><a class="text-muted" href="#">Favor</a></small></li>
            <li><small><a class="text-muted" href="#">Comment</a></small></li>
        </ul>
    </div>
</div>

<div class="media bottom-bordered"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-green.png" /> </a>

    <div class="media-body">
        <p class="post-info pull-right"><small>2 hour ago</small><img src="/WinWinTheme-theme/images/assets/icon-home.png" /></p>

        <p>Liberty Properteis LLC</p>

        <p>simply dummy text...</p>

        <ul class="list-inline wisdom-options">
            <li><small><a class="text-muted" href="#">Favor</a></small></li>
            <li><small><a class="text-muted" href="#">Comment</a></small></li>
        </ul>

        <div class="clearfix"><input class="col-xs-12" placeholder="Talk Business" type="text" /></div>
    </div>
</div>

<div class="media"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-blue.png" /> </a>

    <div class="media-body">
        <p class="post-info pull-right"><small>1 hour ago</small><img src="/WinWinTheme-theme/images/assets/icon-chat-2.png" /></p>

        <p>Liberty Properteis LLC <i>New Service - Web Design</i></p>

        <ul class="list-inline wisdom-options">
            <li><small><a class="text-muted" href="#">Recommend</a></small></li>
            <li><small><a class="text-muted" href="#">Share</a></small></li>
            <li><small><a class="text-muted" href="#">Settings</a></small></li>
        </ul>

        <div class="media comment"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-maroon.png" /> </a>

            <div class="media-body">
                <p>Liberty Properteis LLC Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>

                <ul class="list-inline wisdom-options">
                    <li><small><a class="text-muted" href="#">Recommend</a></small></li>
                    <li><small><a class="text-muted" href="#">Share</a></small></li>
                    <li><small><a class="text-muted" href="#">Settings</a></small></li>
                </ul>
            </div>
        </div>

        <div class="media comment"><a class="pull-left" href="#"><img alt="img" class="media-object" src="/WinWinTheme-theme/images/assets/img-maroon.png" /> </a>

            <div class="media-body">
                <p>Liberty Properteis LLC Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>

                <ul class="list-inline wisdom-options">
                    <li><small><a class="text-muted" href="#">Recommend</a></small></li>
                    <li><small><a class="text-muted" href="#">Share</a></small></li>
                    <li><small><a class="text-muted" href="#">Settings</a></small></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<script>
    /*====== [Business Dashboard] */
    $('.dashboard .dropdown-content').click(function(){
        $(this).find('ul').toggle();
    });
</script>