
           <form>
                <input type="radio" ng-model="regType" value="employee">Employee<br>
                <input type="radio" ng-model="regType" value="business">Business<br>
            </form>

                <div ng-show="regType != 'business'">
                    <%@include file="employee-tabs.jsp" %>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="tab-content">
                                <%@include file="employee.jsp"%>
                                <%@include file="employeeLogin.jsp"%>
                                <%@include file="checkEmail.jsp" %>
                            </div><!-- end .tab-content -->
                        </div><!-- end .col-sm-12 -->
                    </div><!-- end .row -->

                </div><!-- employee  workflow -->


                <div ng-show="regType == 'business'">

                    <%@include file="business-tabs.jsp" %>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="tab-content">
                                <%@include file="businessInfo.jsp"%>
                                <%@include file="locations.jsp"%>
                                <%@include file="departments.jsp" %>
                                <%@include file="employees.jsp" %>
                                <%@include file="verifyEmail.jsp" %>
                            </div><!-- end .tab-content -->
                        </div><!-- end .col-sm-12 -->
                    </div><!-- end .row -->

                </div><!-- bus workflow -->
