<div class="tab-pane" id="employees">
                    <form id="add-employee" action="" method="post" novalidate>
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="Email Address" autocomplete="off">
                            <label class="error error-existing-email">An account with this email address already exists. Please enter a different email address.</label>
                        </div>
                        <div class="form-group">
                            <label for="emp_first_name">First Name</label>
                            <input type="text" name="first_name" class="form-control" id="emp_first_name" placeholder="First Name" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="emp_last_name">Last Name</label>
                            <input type="text" name="last_name" class="form-control" id="emp_last_name" placeholder="Last Name" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="emp_dept">Employee Department</label>
                            <input type="text" name="dept_name" class="form-control" id="emp_dept" placeholder="Employee's Department" autocomplete="off">
                        </div>
                        <!--<p class="text-right">
                            <a href="#" data-dismiss="modal" class="btn-cancel">Cancel</a>
                            <button type="submit" class="btn btn-submit">Add Employee</button>
                        </p>-->
                 <div class="form-group">
                    <div class="text-right">
                        <a class="btn btn-orange">Save &amp; Continue</a>
                    </div>
                </div><!-- end .form-group -->
                    </form>
</div>