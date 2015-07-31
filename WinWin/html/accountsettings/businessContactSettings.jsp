<div class="tab-pane" id="businessContact">
     <div class="col-sm-9 content-right">
         <button type="button" class="navbar-toggle pull-left">
             <span class="sr-only">Toggle navigation</span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
         </button>
         <div class="col-xs-12" id="saveContactSuccessful" style="display:none;">
        	<div class="alert alert-success" role="alert" style="margin-top: 15px;">
      			 Contact Information successfully saved. 
  			</div>
 		 </div> 
         <div class="col-xs-12 contact-info">
             <h2>Edit Contact Information</h2>
            
             <form name="businessContactForm"  novalidate>
                 <div class="form-group" ng-class="{'has-feedback  has-success': businessContactForm.email.$valid}">
                     <label class="control-label">Business Email:</label>
                     <input class="form-control" name="email" type="email" 
                     		ng-model="user.emailAddress" required>
                     <p class="text-danger" 
                     	ng-show="businessContactForm.email.$error.required && !businessContactForm.email.$pristine">Email is required</p>
                     <span
                            class="glyphicon glyphicon-ok form-control-feedback"
                            ng-show="businessContactForm.email.$valid"
                            ng-class="{'hidden': businessContactForm.email.$invalid}"></span>
                     <div id="hint"></div>
                 </div>
                 <div class="form-group" ng-class="{'has-feedback  has-success': businessContactForm.address.$valid}">
                     <label class="control-label">Business Address:</label>
                     <input type="text" class="form-control" name="address" required
                     		ng-model="location.street" 
                     		>
                     <p class="text-danger" ng-show="businessContactForm.address.$error.required && !businessContactForm.address.$pristine">Address is required</p>
                     <span
                            class="glyphicon glyphicon-ok form-control-feedback"
                            ng-show="businessContactForm.address.$valid || businessContactForm.location.$valid || businessContactForm.zip.$valid || businessContactForm.state.$valid "
                            ng-class="{'hidden': businessContactForm.address.$invalid || businessContactForm.location.$invalid || businessContactForm.state.$invalid || businessContactForm.zip.$invalid}"></span>
                 </div>
                 <div class="clearfix address-field-group fields-group form-group">
                     <div class="col-sm-6">
                         <div class="row">
                             <input type="text" class="form-control" name="location" ng-model="location.city" required>
                             <p class="text-danger" ng-show="businessContactForm.location.$error.required && !businessContactForm.location.$pristine">Location is required</p>
                         </div>
                     </div>
                     <div class="col-sm-3">
                         <div class="row">
                             <input type="text" class="form-control" name="state" ng-model="location.state" required>
                             <p class="text-danger" ng-show="businessContactForm.state.$error.required && !businessContactForm.state.$pristine">State is required</p>
                         </div>
                     </div>
                     <div class="col-sm-3">
                         <div class="row">
                             <input type="text" class="form-control" name="zip" ng-model="location.zip" required>
                             <p class="text-danger" ng-show="businessContactForm.zip.$error.required && !businessContactForm.zip.$pristine">Zip Code is required</p>
                         </div>
                     </div>
                 </div>
                 <div class="clearfix">
                     <div class="col-sm-9">
                         <div class="fields-group">
                             <div class="form-group" ng-class="{'has-feedback  has-success': businessContactForm.phone_number.$valid}">
                                 <div class="row">
                                     <label class="control-label">Phone Number:</label>
                                     <input type="text" class="form-control" name="phone_number" required
                                     		ng-model="business.phone"
                                     		ng-minlength="10"
                                     		>
                                     <p class="text-danger" 
                                     		ng-show="businessContactForm.phone_number.$error.required && !businessContactForm.phone_number.$pristine">Phone Number is required</p>
                                     <p class="text-danger"
                                     	ng-show="businessContactForm.phone_number.$error.minlength">Phone Number be 10 digits</p>
                                 	 <span
			                            class="glyphicon glyphicon-ok form-control-feedback"
			                            ng-show="businessContactForm.phone_number.$valid"
			                            ng-class="{'hidden': businessContactForm.phone_number.$invalid}"></span>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="col-sm-3">
                         <div class="form-group" ng-class="{'has-feedback  has-success': businessContactForm.ext.$valid}">
                             <div class="row">
                                 <label>Ext:</label>
                                 <input type="text" name="ext" class="form-control" 
                                 		ng-maxlength="5" 
                                 		ng-pattern="onlyNumbers"
                                 		ng-model="business.phoneExt">
                                  <p class="text-danger" 
                                 	 ng-show="businessContactForm.ext.$error.maxlength && !businessContactForm.ext.$pristine">Ext can't be more than 5 characters long</p>
                         		<p class="text-danger" ng-show="businessContactForm.ext.$error.pattern && !businessContactForm.ext.$pristine">Ext must contain numbers only</p>
                         </div>
                     </div>
                </div>
                </div>
                <div class="form-group">
                     <label class="control-label">Website:</label>
                     <input type="text" class="form-control" name="website" ng-model="business.website" http-prefix>
                </div>
                <div class="btn-content text-right">
                     <a class="close-panel btn-cancel"  onClick="$('businessForm').reset();">Reset</a>
                     <button type="submit" class="btn-save" ng-click='saveContactInfo()' ng-disabled="businessContactForm.$invalid">Save</button>
                </div>       	
              	<div class="justify-container">
                    <label>Additional Contacts:</label> 
                    <a class="btn-additional-contact" data-toggle="modal" data-target="#addContacts">
                        <span class="glyphicon glyphicon-plus"></span>
                    	Add Additional Contact
                    </a>
               </div>

                 
                 <table class="table contacts-table">
                    <tr ng-repeat="contact in businessContacts">
                        <td class="text-muted">{{contact.title}}</td>
                        <td>{{contact.name}}</td>
                        <td class="controls">
                            <ul class="list-inline">
                                <li><a href="" class="edit-link" data-toggle="modal" ng-click="applyContact(contact)" data-target="#addContacts">Edit</a></li>
                                <li><a href="" class="delete-icon" data-toggle="modal" data-target="#removeContact" ng-click="applyContactToRemove(contact)"><span class="glyphicon glyphicon-trash"></span></a></li>
                            </ul>
                        </td>
                    </tr>
                </table>
             </form>
         </div>
     </div>
 </div>
<%@ include file="../modals/additionalContacts.html" %>
<%@ include file="../modals/alerts/removeContact.html"%>

<script type="text/javascript">$(document).ready(function(){$("input").attr("autocomplete","off");});</script>
