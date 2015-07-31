<div class="tab-pane" id="businessNotifications">
    <div class="col-sm-9 content-right">
        <button type="button" class="navbar-toggle pull-left">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="col-xs-12" id="saveNotificationsSuccessful" style="display:none;">
        	<div class="alert alert-success" role="alert" style="margin-top: 15px;">
      			 Email notifications successfully saved. 
  			</div>
 		</div>     
        <div class="col-xs-12 notification">
            <h2>Email Notifications</h2>    
             <img class="pull-right hidden-xs" src="/WinWinTheme-theme/images/assets/account-settings/email.jpg" alt=""/>   
            <div class="text-center notification-setting">
                 <form name="notificationForm" id="notificationForm">
	                <table class="table">
	                <thead>
	                  <tr>
	                    <th>Notification</th>
	                    <th><div class="text-center">On</div></th>
	                    <!--<th><div class="text-center">Weekly</div></th>
	                    <th><div class="text-center">Monthly</div></th>-->
                        <th><div class="text-center">Off</div></th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <tr>
	                    <td>Member requests alliance</td>
	                    <td><div class="text-center"><input type="radio" value="D" ng-model="member.emailRequestAlliance"></div></td>
	                    <!--<td><div class="text-center"><input type="radio" value="W" ng-model="member.emailRequestAlliance"></div></td>
	                    <td><div class="text-center"><input type="radio" value="M" ng-model="member.emailRequestAlliance"></div></td>-->
                        <td><div class="text-center"><input type="radio" value="N" ng-model="member.emailRequestAlliance"></div></td>
	                  </tr>
	                  <tr>
	                    <td>Member approves alliance</td>
	                    <td><div class="text-center"><input type="radio" value="D" ng-model="member.emailApproveAlliance"></div></td>
	                    <!--<td><div class="text-center"><input type="radio" value="W" ng-model="member.emailApproveAlliance"></div></td>
	                    <td><div class="text-center"><input type="radio" value="M" ng-model="member.emailApproveAlliance"></div></td>-->
                        <td><div class="text-center"><input type="radio" value="N" ng-model="member.emailApproveAlliance"></div></td>
	                  </tr>
	                  <tr>
	                    <td>Member comments on postings</td>
	                    <td><div class="text-center"><input type="radio" value="D" ng-model="member.emailCommentsOnPosts"></div></td>
	                  <!--  <td><div class="text-center"><input type="radio" value="W" ng-model="member.emailCommentsOnPosts"></div></td>
	                    <td><div class="text-center"><input type="radio" value="M" ng-model="member.emailCommentsOnPosts"></div></td>-->
                        <td><div class="text-center"><input type="radio" value="N" ng-model="member.emailCommentsOnPosts"></div></td>
	                  </tr>
	                  <tr>
	                    <td>Member sends a private message</td>
	                    <td><div class="text-center"><input type="radio" value="D" ng-model="member.emailSendsPrivateMessage"></div></td>
	                   <!-- <td><div class="text-center"><input type="radio" value="W" ng-model="member.emailSendsPrivateMessage"></div></td>
	                    <td><div class="text-center"><input type="radio" value="M" ng-model="member.emailSendsPrivateMessage"></div></td>-->
                        <td><div class="text-center"><input type="radio" value="N" ng-model="member.emailSendsPrivateMessage"></div></td>
	                  </tr>
	                  <tr>
	                    <td>New features &amp; site releases</td>
	                    <td><div class="text-center"><input type="radio" value="D" ng-model="member.emailNewFeatures"></div></td>
	                 <!--   <td><div class="text-center"><input type="radio" value="W" ng-model="member.emailNewFeatures"></div></td>
	                    <td><div class="text-center"><input type="radio" value="M" ng-model="member.emailNewFeatures"></div></td>-->
                        <td><div class="text-center"><input type="radio" value="N" ng-model="member.emailNewFeatures"></div></td>
	                  </tr>             
	                </tbody>
	              </table>	              
	              <div class="btn-content text-right">
	              	<a class="close-panel btn-cancel" ng-click="resetNotificationForm()">Reset</a>
	                <button type="submit" class="btn-save" ng-click='saveEmailNotificationSettings()'>Save</button>
	              </div>
              </form>
            </div><!-- end notifications -->
        </div>
    </div>
</div>