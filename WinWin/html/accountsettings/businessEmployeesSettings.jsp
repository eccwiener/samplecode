<div class="tab-pane" id="businessUsers">
    <div class="col-sm-9 content-right">
        <button type="button" class="navbar-toggle pull-left">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="col-xs-12 contact-info">
             <div class="relative-top">
                <h2>Manage Employees</h2>
                <p class="text-right"><a class="btn-additional-contact" data-toggle="modal" data-target="#addEmp"><span class="glyphicon glyphicon-plus"></span> Add Employee</a></p>
            </div>
            <form role="form">
                <%@include file="includes/manageEmployee/pendingEmployee.jsp"%>
                <%@include file="includes/manageEmployee/currentEmployee.jsp" %>

            </form>
        </div><!-- end .contact-info -->
    </div><!-- end .content-right -->
</div><!-- end .tab-pane -->
<%@ include file="../modals/addEmployee.html" %>
<%@include file="../modals/alerts/removeStaffAlert.html"%>