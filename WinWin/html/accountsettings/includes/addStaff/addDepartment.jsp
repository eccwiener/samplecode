<div class="modal fade styled-modal win-modal" id="addDepartment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">Add Department</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                	 <form id="add-location" method="post" action="" novalidate>
	                	<div class="form-group" data-type="department">
						    <label for="dept">Department Name</label>
						    <input type="text" class="form-control" name="<portlet:namespace />dept_name" id="dept" placeholder="Department Name" autocomplete="off">
						</div>
						
						<p class="text-right">
	                        	<a href="#" data-dismiss="modal" ng-click='clearDepartmentPopup()' class="close-panel">Cancel</a>
	                        	<button type="submit" data-dismiss="modal" class="btn btn-submit" ng-click="saveDepartment()">Add Department</button>
                       	</p>                                 
                    </form>
                </div>
            </div><!-- end .modal-body -->
        </div><!-- end .modal-content -->
    </div><!-- end .modal-dialog -->
</div><!-- end .modal -->