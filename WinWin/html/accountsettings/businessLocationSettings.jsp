<div class="tab-pane" id="businessLocations">
    <div class="col-sm-9 content-right">
        <button type="button" class="navbar-toggle pull-left">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="col-xs-12 contact-info">
             <div class="relative-top">
                <h2>Manage Locations</h2>
                <p class="text-right">
                	<a class="btn-additional-contact" data-toggle="modal" data-target="#addLocation">
                		<span class="glyphicon glyphicon-plus"></span> Add Location
                	</a>
                </p>
            </div>
            <form role="form">
               <table class="table contacts-table">
                    <tr ng-repeat="location in locations">
                        <td class="text-muted">{{location.name}}</td>
                        <td>{{location.city}}</td>
                        <td>{{location.zip}}</td>
                        <td class="controls">
                            <ul class="list-inline">
                                <li><a href="" class="edit-link" data-toggle="modal" ng-click="applyLocation(location)" data-target="#addLocation">edit</a></li>
                                <li><a href="" class="delete-icon" data-toggle="modal" data-target="#removeLocation" ng-click="applyLocationToRemove(location)"><span class="glyphicon glyphicon-trash"></span></a></li>
                            </ul>
                        </td>
                    </tr>
                </table>
            </form>
        </div><!-- end .contact-info -->
    </div><!-- end .content-right -->
</div><!-- end .tab-pane -->
<%@ include file="../modals/addLocation.html" %>
<%@include file="../modals/alerts/removeLocationAlert.html"%>