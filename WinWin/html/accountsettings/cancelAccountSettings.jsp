<div class="tab-pane" id="businessCancel">
    <div class="col-sm-9 content-right">
        <button type="button" class="navbar-toggle pull-left">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="col-xs-12 cancel">
            <h2>Don't Leave!</h2>

            <div class="text-center">
                <p>What can we do to make the business stay? <a href="/contact-us" class="styled" target="_blank">Talk with a winologist</a></p>
                <div class="btn-content">
                  <!-- <a href="/dashboard" class="close-panel btn-cancel">Cancel</a>-->
                   <center> <button type="submit" class="btn-save" data-toggle="modal" data-target="#cancelModal">Delete</button></center>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade styled-modal winwin-modal" id="cancelModal" tabindex="-1" role="dialog" aria-hidden="true" style="display:none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <div class="modal-button"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
                <h4 class="modal-title">Why not stay a member and take us up on free promotional material?</h4>
            </div>
            <div class="modal-body">
                <a href="/contact-us">
                    <img class="img-responsive" src="WinWinTheme-theme/images/assets/account-settings/cancel-account.jpg" />
                    
                    <!-- start warning box -->
                    <div class="warningBox">
                        <div class="warningLeft">
                            <h2>WARNING:</h2>
                        </div>
                        <div class="warningRight">
                                <p><span style="color:red;"><strong>This action is permanent.</strong></span> The entire business account will be deleted, including all associated users and posts. Please contact a Winologist for assistance before proceeding.
                                </p>
                        </div>
                    </div>
                    <!-- end warning box -->
                </a>
            </div>           
            <div class="modal-footer">
                <button type="button" class="close-panel btn-cancel" data-dismiss="modal">Go Back</button>
                <button type="button" class="btn-save" ng-click="cancelMyAccount()">Delete Account</button>
            </div>
        </div>
    </div>
</div>