<div class="user-content current-users clearfix">
    <p><strong class="text-muted">Current Users</strong></p>
    <div class="col-sm-12 deletable clearfix" ng-repeat="businessUser in businessUsers">
        <div class="col-sm-3">
            <div class="fields-group">
                <div class="form-group">
                    <div class="row">
                        <input type="hidden" class="form-control" id="firstName" ng-model="businessUser.firstName">
                        <p class="form-control">{{businessUser.firstName}}</p>
                        <!--
                        <input type="text" class="form-control" id="lastName" ng-model="businessUser.lastName">
                    	-->
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="fields-group">
                <div class="form-group">
                    <div class="row">
                        <input type="hidden" class="form-control" id="email" ng-model="businessUser.emailAddress">
                    	<p class="form-control">{{businessUser.emailAddress}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-2">
            <div class="form-group">
                <div class="row">
                	<input type="hidden" class="form-control" id="email" value="Activated">
                	<p class="form-control">Activated</p>
                </div>
            </div>
        </div>
        <div class="manage-actions">
       		<button class="btn btn-edit" data-toggle="modal" data-target="#editEmp" ng-click="applyCurrentEmployee(businessUser)">Edit</button>
        </div>
	    <a  class="item-delete" data-toggle="modal" data-target="#removeUser" ng-click="applyCurrentEmployeeToRemove(businessUser)">
	    	<span class="glyphicon glyphicon-trash"></span>
	    </a>
    </div><!-- end .deletable -->
</div><!-- end .current-user -->
