<div class="tab-pane" id="businessDepartments">
    <div class="col-sm-9 content-right">
        <button type="button" class="navbar-toggle pull-left">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="col-xs-12 contact-info">
             <div class="relative-top">
                <h2>Manage Departments</h2>
                <p class="text-right">
                	<a class="btn-additional-contact" data-toggle="modal" data-target="#addDepartment">
                		<span class="glyphicon glyphicon-plus"></span> Add Department
                	</a>
                </p>
            </div>
            <form role="form">
                <table class="table contacts-table">
                    <tr ng-repeat="department in departments">
                        <td class="text-muted">{{department.departmentName}}</td>
                        <td class="controls">
                            <ul class="list-inline">
                                <li>
                                	<a href="" class="edit-link" data-toggle="modal" ng-click="applyDepartment(department)" data-target="#addDepartment">
                                		Edit
                                	</a>
                                </li>
                                <li>
                                	<a href="" class="delete-icon" data-toggle="modal" data-target="#removeDepartment" ng-click="applyDepartmentToRemove(department)">
                                		<span class="glyphicon glyphicon-trash"></span>
                                	</a>
                                </li>
                            </ul>
                        </td>
                    </tr>
                </table>
            </form>
        </div><!-- end .contact-info -->
    </div><!-- end .content-right -->
</div><!-- end .tab-pane -->
<%@ include file="../modals/addDepartment.html" %>
<%@include file="../modals/alerts/removeDepartmentAlert.html"%>