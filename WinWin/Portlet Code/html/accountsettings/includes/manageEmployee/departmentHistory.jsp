<div class="employeeHistory" ng-if="invitedDepartments.length > 0">
	<div class="user-content employeeHistory clearfix">
    	<p>
    		<strong class="text-muted">Department Invite History</strong>
    	</p>
      	<div ng-repeat="department in invitedDepartments">
	        <div class="col-sm-4">
	            <div class="fields-group">
	                <div class="form-group">
	                    <div class="row">
	                        <input type="hidden" class="form-control">
	                    	<p class="form-control" >{{department.name}}</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-sm-4"> <!-- class="col-xs-2" style="width:40%;"> -->
	            <div class="form-group" >
	                <div class="row">
	                	<input type="hidden" class="form-control">
	                	<p class="form-control" >{{department.email}}</p>
	                </div>
	            </div>
	        </div>
	        <div class="col-sm-2">
	            <div class="form-group" >
	                <div class="row">
	                	<input type="hidden" class="form-control">
	                	<p class="form-control" >{{department.date}}</p>
	                </div>
	            </div>
	        </div>
	        <!--
	    	<span class="glyphicon glyphicon-trash" style="margin-top: 10px; margin-left: 15px; cursor: pointer;"></span>
			-->
		</div>
	</div>
</div><!-- end .employeeHIstory -->