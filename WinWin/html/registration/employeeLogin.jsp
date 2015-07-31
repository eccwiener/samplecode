<form class="tab-pane" id="login-info">
		<input type="hidden" name="registrationType" ng-model="$scope.business.registrationType">
		<div class="form-group">
	   		<label class="control-label" for="firstName">First Name:</label>
	     	<input type="text" class="form-control" id="firstName" ng-model="business.firstName">
	 	</div>

	 	<div class="form-group">
	   		<label for="lastName">Last Name:</label>
	   		<input type="text" class="form-control" id="lastName" ng-model="business.lastName">
	 	</div>

		<div class="form-group">
			<label for="email">Email</label>
		   	<input type="email" class="form-control" id="email" ng-model="business.email">
		</div>

		<div class="form-group">
			<label for="password">Password</label>
		  	<input type="password" class="form-control" id="password" ng-model="business.password">
		</div>

		<div class="form-group">
			<label for="confirmPassword">Confirm Password</label>
		  	<input type="password" class="form-control" id="confirmPassword" ng-model="business.confirmPassword">
		</div>
       <div class="form-group">
            <div class="text-right">
                <a class="btn btn-orange">Save &amp; Continue</a>
            </div>
        </div><!-- end .form-group -->
</form>