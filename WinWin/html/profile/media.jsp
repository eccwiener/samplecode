
    <div class="tab-pane" id="media">

        <div class="profile-media">
<div class="profile-photos">
	<!--<h2>Photos</h2>-->

	<% 
		if (business.getBusinessId() == myBusiness.getBusinessId())
		{
	%>
		<div class="messaging">		    		
		  	<span class="media-button">
		  		<img src="/WinWinTheme-theme/images/assets/messaging/icon-img.png"> 
		  		Add Photos 
		  		<input type="file" accept="image/*" ng-disabled="imageUploaded" onclick="this.value=null" ng-file-select="uploadBusinessImage($files)">
		  	</span>
		 </div>
	<%
		}
	%>
			    	
	<ul class="list-group">
		<li class="list-group-item" ng-repeat="image in businessImages track by $index">
			<img class="profile-photos" src="{{image.url}}" />
			<%
			if (business.getBusinessId() == myBusiness.getBusinessId()) {
			%>
			<button class="btn btn-reply" ng-click="removeBusinessImage(image)">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
			</button>
			<%
			}
			%>
		</li>
	</ul>
</div>

<!--
<div class="profile-videos">
<h2>Videos</h2>

<ul class="list-group">
<li class="list-group-item"><img class="profile-videos" src="/WinWinTheme-theme/images/Seminar_03.png" /> </li>
<li class="list-group-item"> <img class="profile-videos" src="/WinWinTheme-theme/images/video.png" /></li>
<li class="list-group-item"> <img class="profile-videos" src="/WinWinTheme-theme/images/puppies.jpg" /></li>
<li class="list-group-item"> <img class="profile-videos" src="/WinWinTheme-theme/images/puppies2.jpg" /></li>
<li class="list-group-item"> <img class="profile-videos" src="/WinWinTheme-theme/images/puppies3.jpg" /></li>
<li class="list-group-item"> <img class="profile-videos" src="/WinWinTheme-theme/images/puppies4.jpg" /></li>
</ul>
</div>
-->

</div>

        </div>