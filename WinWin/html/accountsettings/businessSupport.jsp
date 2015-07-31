<div class="tab-pane" id="businessSupport">
    <div class="col-sm-9 content-right">
        <button type="button" class="navbar-toggle pull-left">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="col-xs-12 support">
            <h2>Having Problems?</h2>
         <!--   <div class="text-center notification-setting">
                <div class="btn-group">
                    <label class="btn btn-default" ng-model="support.create" btn-checkbox>Create</label>
                    <label class="btn btn-default" ng-model="support.current" btn-checkbox>Current</label>
                    <label class="btn btn-default" ng-model="support.solved" btn-checkbox>Saved</label>
                </div>
            </div> -->

            <form role="form" name="supportForm">
                <div class="form-group has-feedback">
                    <label class="control-label" for="supportSubject">Subject of Ticket:</label>
                    <input type="text" class="form-control" name="supportSubject"
                           ng-model="support.subject"
                           
                           required
                        >
                        <p class="text-danger" ng-show="supportForm.supportSubject.$error.required && !supportForm.supportSubject.$pristine">Subject required</p>
                        <p class="text-danger" ng-show="supportForm.supportSubject.$error.pattern">Must contain only alpha numeric values</p>
                </div>
                <div class="form-group has-feedback">
                    <label class="control-label" for="supportIssue">Describe Issue:</label>
                    <textarea type="t" class="form-control" name="supportIssue"
                              ng-model="support.issue"                        
                              required
                        /></textarea>
                        <p class="text-danger" ng-show="supportForm.supportIssue.$error.required && !supportForm.supportIssue.$pristine">Description required</p>
                        <p class="text-danger" ng-show="supportForm.supportIssue.$error.pattern">Must contain only alpha numeric values</p>
                </div>
                <div class="btn-content text-right">
                <a href="#" class="close-panel btn-cancel">Cancel</a>
                <button type="submit" class="btn-save" ng-click="support.send()" ng-disabled="supportForm.$invalid">Send</button>
            </div>
            </form>

        </div>
    </div>
</div>