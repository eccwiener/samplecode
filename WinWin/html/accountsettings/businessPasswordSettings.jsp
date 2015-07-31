<div class="tab-pane" id="businessPassword">
    <div class="col-sm-9 content-right">
        <button type="button" class="navbar-toggle pull-left">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="col-xs-12" id="passwordSuccess" style="display:none;">
        	<div class="alert alert-success" role="alert" style="margin-top: 15px;">
      			 The Company's Password has been changed for this account. Please log out and log back in to test. Contact us on the footer of the site with any problems. 
  			</div>
 		</div>
        <div class="col-xs-12 passwordReset">
            <h2>Password Reset</h2>     
            <form role="form" name="resetForm" novalidate>
                <div class="form-group has-feedback">
                    <label class="control-label" for="businessPswd">Current Password:</label>
                    <input type="password" class="form-control" name="businessPswd" id="businessPswd"
                           ng-model="currentPassword"
                           required
                        >
                </div>
                <div class="row">
                    <div class="form-group has-feedback clearfix" ng-class="{ 'has-error' : resetForm.password.$invalid && !resetForm.password.$pristine }">
                        <label class="control-label col-sm-4" for="newbusinessPswd">New Password:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" name="password" id="password"
                                   ng-model="newPassword"
                                   ng-minlength="8"
                                   ng-maxlength="20"
                                   ng-pattern="pswdPattern"
                                   required
                                >
                            <span class="text-danger" ng-show="resetForm.password.$error.required && resetForm.password.$dirty">required</span>
                            <span class="text-danger" ng-show="!resetForm.password.$error.required && (resetForm.password.$error.minlength || resetForm.password.$error.maxlength) && resetForm.password.$dirty">passwords must be between 8 and 20 characters.</span>
                            <span class="text-danger" ng-show="!resetForm.password.$error.required && !resetForm.password.$error.minlength && !resetForm.password.$error.maxlength && resetForm.password.$error.pattern && resetForm.password.$dirty">Must contain one lower &amp; uppercase letter, and one non-alpha character (a number or a symbol.)</span>
                        </div>
                    </div>
                    <div class="form-group has-feedback" ng-class="{ 'has-error' : resetForm.businessConfirmPswd.$invalid && !resetForm.businessConfirmPswd.$pristine }">
                        <label class="control-label col-sm-4" for="businessConfirmPswd">Confirm Password:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" name="businessConfirmPswd" id="businessConfirmPswd"
                                   ng-model="businessConfirmPswd"
                                   valid-password
                                   required
                                >
                            <span class="text-danger" ng-show="resetForm.businessConfirmPswd.$error.required && resetForm.businessConfirmPswd.$dirty">Please confirm your password.</span>
                            <span class="text-danger" ng-show="!resetForm.businessConfirmPswd.$error.required && resetForm.businessConfirmPswd.$error.noMatch && resetForm.password.$dirty">Passwords do not match.</span>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="btn-content text-right">
                    <a href="#" class="close-panel btn-cancel">Cancel</a>
                    <button type="submit" class="btn-save" ng-click="changePassword()" ng-disabled="resetForm.$invalid">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>