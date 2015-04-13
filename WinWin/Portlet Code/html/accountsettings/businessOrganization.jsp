<div class="tab-pane" id="businessOrganization">
    <div class="col-sm-9 content-right">
        <button type="button" class="navbar-toggle pull-left">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="col-xs-12 contact-info">
             <div class="relative-top">
                <h2>Manage Organization</h2>
                <p class="text-center">
                	<a class="btn-default" data-toggle="modal" data-target="#addEmp">
                		<span class="glyphicon glyphicon-plus"></span><strong>Add Employee</strong>
                	</a>
                	<a class="btn-default" data-toggle="modal" data-target="#addDepartment">
                		<span class="glyphicon glyphicon-plus"></span> <strong>Add Department</strong>
                	</a>
                	<a class="btn-default" data-toggle="modal" data-target="#addLocation">
                		<span class="glyphicon glyphicon-plus"></span> <strong>Add Location</strong>
                	</a>
                </p>
            </div>
            <form role="form">
                <%@include file="includes/manageEmployee/pendingEmployee.jsp"%>
                <%@include file="includes/manageEmployee/currentEmployee.jsp" %>
                <%@include file="includes/manageEmployee/employeeHistory.jsp" %>
                <%@include file="includes/manageEmployee/departmentHistory.jsp" %>
                <%@include file="includes/manageEmployee/locationHistory.jsp" %>
            </form>
        </div><!-- end .contact-info -->
    </div><!-- end .content-right -->
</div><!-- end .tab-pane -->
<%@ include file="../modals/addDepartment.html" %>
<%@ include file="../modals/addLocation.html" %>
<%@ include file="../modals/addEmployee.html" %>
<%@ include file="../modals/editEmployee.html" %>
<%@include file="../modals/alerts/removeStaffAlert.html"%>