<div class="user-content clearfix">
    <p class="text-pending">None Pending</p>

                         <label class="control-label" id="username-label"><strong>User Name</strong></label>
                                              <label class="control-label" id="email-label"><strong>Email</strong></label>
    <div class="col-sm-12 deletable clearfix" ng-repeat="employee in pendingEmployees">
        <div class="col-sm-3">
            <div class="fields-group">
                <div class="form-group">
                    <div class="row">

                     <input type="hidden" class="form-control" id="firstName" ng-model="employee.firstName">
                     <p class="form-control">{{employee.firstName}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="fields-group">
                <div class="form-group">
                    <div class="row">

                    <input type="hidden" disabled="disabled" class="form-control" id="firstName" ng-model="employee.email">                       
                    <p class="form-control">{{employee.email}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="manage-actions">
	        <div class="col-sm-2 row">
	            <div class="fields-group">
	                <div class="form-group">
	                    <div class="row">
	        				<button class="btn btn-approve" ng-click="approvePendingEmployee(employee)">Approve</button>                  
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-sm-2">
	            <div class="fields-group">
	                <div class="form-group">
	                    <div class="row">
	        				 <button class="btn btn-reject" ng-click="rejectPendingEmployee(employee)">Reject</button>                   
	                    </div>
	                </div>
	            </div>
	        </div>        
        </div><!-- manage-actions -->

    </div><!-- detable container -->
</div><!-- end .user-content -->