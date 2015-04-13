<div class="tab-pane" id="locations">
                    <form id="add-location" method="post" action="" novalidate>
                    	<div class="form-group">
                            <label for="loc_name">Location Name</label>
                            <input type="text" class="form-control" name="name" id="loc_name" placeholder="Name" autocomplete="off" ng-model="newLocation.name">
                        </div>
                        <div class="form-group">
                            <label for="loc_street">Street</label>
                            <input type="text" class="form-control" name="street" id="loc_street" placeholder="Street" autocomplete="off" ng-model="newLocation.street">
                        </div>
                        <!--
                        <div class="form-group">
                            <label for="loc_street2">Street 2</label>
                            <input type="text" class="form-control" name="street2" id="loc_street2" placeholder="Street 2" autocomplete="off" ng-model="newLocation.street2">
                        </div>
                        -->
                        <div class="form-group">
                            <label for="loc_city">City</label>
                            <input type="text" class="form-control" name="city" id="loc_city" placeholder="City" autocomplete="off" ng-model="newLocation.city">
                        </div>
                        <div class="form-group">
                            <label for="loc_state">State</label>
                            <input maxlength="2" type="text" class="form-control" name="state" id="loc_state" placeholder="State" autocomplete="off" ng-model="newLocation.state">
                        </div>
                        <div class="form-group">
                            <label for="loc_postalCode">Postal Code</label>
                            <input type="text" class="form-control" name="zip_code" id="loc_postalCode" placeholder="Postal Code" autocomplete="off" ng-model="newLocation.postalCode">
                        </div>

                        <!--<p class="text-right">
                        	<a href="#" data-dismiss="modal" ng-click='clearLocationPopup()' class="btn-cancel">Cancel</a>
                        	<button type="submit" data-dismiss="modal" class="btn btn-submit" ng-click="saveLocation()">Add Location</button>
                       	</p>-->
                         <div class="form-group">
                            <div class="text-right">
                                <a class="btn btn-orange">Save &amp; Continue</a>
                            </div>
                        </div><!-- end .form-group -->
                    </form>
</div>