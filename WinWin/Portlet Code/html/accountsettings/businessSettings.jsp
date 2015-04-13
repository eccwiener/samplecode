<%@page import="com.liferay.portal.model.User"%>
<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>

<portlet:actionURL name="uploadImage" var="uploadImageURL"/>

<%
	User user = td.getUser();
	System.out.println("portrait url: " + user.getPortraitURL(td));
%>
<div class="tab-pane active" id="businessProfile">
	<div class="col-sm-9 content-right">
	    <button type="button" class="navbar-toggle pull-left" data-toggle="collapse" data-target="#account-settings-navbar-collapse">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	    </button>
	    <div class="col-xs-12" id="saveBusinessInformationSuccessful" style="display:none;">
        	<div class="alert alert-success" role="alert" style="margin-top: 15px;">
      			 Business Information successfully saved. 
  			</div>
 		</div>     
	    <div class="col-xs-12">
            <h2>Edit Business Information</h2>
            <div class="bordered-block">
                <div class="row">
                    <div class="col-sm-5">
                        <img src="{{business.logo}}" class="logo-img img-responsive" width="234" height="190"/>
                        <form id="imgForm" name="imgForm" method="post" action="<%=uploadImageURL.toString()%>" enctype="multipart/form-data">
                        
                        <div class="messaging">		    		
					    	<span class="media-button" ng-if="!imageUploaded">
					    		<img src="/WinWinTheme-theme/images/assets/messaging/icon-img-white.png"> 
					    		Upload Logo
					    		<input type="file" accept="image/*" ng-disabled="imageUploaded" onclick="this.value=null" ng-file-select="uploadImage($files)">
					    	</span>
				    	</div>
							<!--<input type="submit" name="submit" value="Upload Logo" class="upload-logo">-->
                            <!--
                        <a href="#" onClick="$('#imgForm').submit()" class="upload-logo">
                            <span>
                                <span class="glyphicon glyphicon-camera">
                                </span>
                            </span>
                            Upload Logo
                        </a>
                        -->
						</form>
                    </div>
                    <div class="col-sm-7">
                        <h4>Need a New Logo Design?</h4>
                            <div class="price-info">
                              <img src="/WinWinTheme-theme/images/assets/verification/only-149.png" id="only-149"/>
                            </div>
                            <!-- Start Image Carousel with Logos -->
                            <div class="account-settings-slider">
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                          <!-- Indicators -->
                      <!--    <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                          </ol>
                            -->
                          <!-- Wrapper for slides -->
                          <div class="carousel-inner"> <!--Slide 1 active --> 
                            <div class="item active"> 
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/BlackGoldEnergy.jpg" class="img-responsive" id="logo-slide"/>
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/BPWatchExperts.jpg" class="img-responsive" id="logo-slide"/>
                            </div>
                            <div class="item"> <!-- Slide 2 -->
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/CurryKebobHouse.jpg" class="img-responsive" id="logo-slide"/>
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/FrankRoccoPhotography.jpg" class="img-responsive" id="logo-slide"/>
                            </div>
                            <div class="item"> <!-- Slide 3 -->
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/GoldCoastCigar.jpg" class="img-responsive" id="logo-slide"/>
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/KBBicycleRepair.jpg" class="img-responsive" id="logo-slide"/>
                            </div>
                              <div class="item"> <!-- Slide 4 -->
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/LaParma.jpg" class="img-responsive" id="logo-slide"/>
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/MDTravelSources.jpg" class="img-responsive" id="logo-slide"/>
                            </div>
                             <div class="item"> <!-- Slide 5 -->
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/OldThymeBrickandButter.jpg" class="img-responsive" id="logo-slide"/>
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/YohannaFlamencoDance.jpg" class="img-responsive" id="logo-slide"/>
                            </div>

                            <div class="item"> <!-- Slide 6 -->
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/BeachBurgersAndGrille.jpg" class="img-responsive" id="logo-slide"/>
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/BullBusterCafe.jpg" class="img-responsive" id="logo-slide"/>
                            </div>
                            <div class="item"> <!-- Slide 7 -->
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/CoolLinesUSA.jpg" class="img-responsive" id="logo-slide"/>
                              <img src="/WinWinTheme-theme/images/assets/account-settings/logos/LegacyCustomApparel.jpg" class="img-responsive" id="logo-slide"/>
                            </div>
                          </div>

                          <!-- Controls -->
                          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" id="control-left ">
                          <!-- <span class="glyphicon glyphicon-chevron-left"></span> -->
                          <img src="/WinWinTheme-theme/images/Arrow.jpg" />
                          </a>
                          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" id="control-right">
                         <!--  <span class="glyphicon glyphicon-chevron-right"></span>    --> 
                          <img src="/WinWinTheme-theme/images/Arrow.jpg" />
                          </a>
                        </div>

                            </div>
                       <!-- <ul class="list-inline logo-suggestion">
                            <li><img src="/WinWinTheme-theme/images/assets/account-settings/need-a-logo-example-1.jpg" class="img-responsive" /></li>
                            <li><img src="/WinWinTheme-theme/images/assets/account-settings/need-a-logo-example-2.jpg" class="img-responsive" /></li>
                        </ul> -->

                        <p class="text-center"><a href="#" class="btn-orange" data-toggle="modal" data-target="#createLogo" ng-click="initCreateLogoRequest()">Create Logo</a></p>
                    </div>
                </div>
            </div>
    		<form role="form" name="profileForm" novalidate>
                <div class="form-group" ng-class="{'has-feedback': profileForm.businessName.$valid}">
                    <label for="businessName">Business Name:</label>
                    <input type="text" class="form-control" name="businessName" id="businessName" ng-model="business.name">
                                     
                    <p class="text-danger" ng-show="profileForm.businessName.$invalid && !profileForm.businessName.$pristine">Business Name is required</p>
                    <p class="text-danger" ng-show="profileForm.businessName.$error.minlength">Business Name must be atleast 2 characters long</p>
                    <p class="text-danger" ng-show="profileForm.businessName.$error.pattern">Must contain only alpha numeric values</p>
                    <span
                            ng-show="profileForm.businessName.$valid"
                            ng-class="{'hidden': profileForm.businessName.$invalid}"
                            class="glyphicon glyphicon-ok form-control-feedback"></span>
                </div>
        		<div class="form-group" id="businessDescription">
                    <label for="businessDescription">Business Description:</label>                                                    
               		<textarea class="form-control" rows="10" ng-model="business.aboutUs" name="businessDescription" id="businessDescription" > </textarea>
                </div>

				<div class="form-group" id="awards">
                    <label for="awards">Awards:</label>
                    <textarea class="form-control" rows="10" ng-model="business.awards" name="awards" id="awards" > </textarea>
                </div>

                <div class="form-group">
                    <label>Social Media:</label>
                    <div class="social-field" ng-class="{'has-feedback': profileForm.facebook.$valid}">
                        <img src="/WinWinTheme-theme/images/assets/account-settings/facebook-icon.png" />
                        <div class="input-field">
                            <input name="facebook" type="text" name="facebook" class="form-control" 
                                    ng-model="business.facebook"
                                    
                            >
                            <p class="text-danger" ng-show="profileForm.facebook.$error.pattern && !profileForm.facebook.$pristine">
                            	Enter a valid Facebook address ex: www.facebook.com/username
                            </p>
                        </div>
                    </div>
                    <div class="social-field">
                    	<img src="/WinWinTheme-theme/images/assets/account-settings/twitter-icon.png" />
                    	<div class="input-field">
                    		<input name="twitter" type="text" name="twitter" class="form-control" 
                                   ng-model="business.twitter"
                                   
                            >
                            <p class="text-danger" ng-show="profileForm.twitter.$error.pattern && !profileForm.twitter.$pristine">
                            	Enter a valid Twitter address ex: www.twitter.com/username
                            </p>

                    	</div>
                    </div>
                    <div class="social-field">
                    	<img src="/WinWinTheme-theme/images/assets/account-settings/linkedIn-icon.png" />
                    	<div class="input-field">
                    		<input type="text" name="linkedIn"  class="form-control" 
                                  ng-model="business.linkedin"
                                 
                        >
                        <p class="text-danger" ng-show="profileForm.linkedIn.$error.pattern && !profileForm.linkedIn.$pristine">
                        	Enter a valid Linkedin address ex: www.linkedin.com/username
                        </p>

                    	</div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Business Tour:</label>
                    <div class="social-field">
                    	<img src="/WinWinTheme-theme/images/assets/account-settings/youtube-icon.png" />
                    	<div class="input-field">
                    		<input  type="text" name="youtube" class="form-control" 
                            ng-model="business.videoTourURL"
                           
                         >
                         <p class="text-danger" ng-show="profileForm.youtube.$error.pattern && !profileForm.youtube.$pristine">
                         	Enter a valid youtube url. A valid URL formats include: www.youtube.com/watch?v=1SqBdS0XkV4 and www.youtube.be/1SqBdS0XkV4
                         </p>
                        </div>
                    </div>
                </div>
                
                   <button style="display:none;"><div class="tourPopup">
                <h3>WinWin Business Tour:</h3>
                <img src="WinWinTheme-theme/images/assets/virtualTour.jpg">
                </div></p>
                </button>

                 <div class="btn-content text-center">
                    <a onClick="$('profileForm').reset();" class="close-panel btn-cancel">Reset</a>
                  <button type="submit" ng-click='saveProfile()' class="btn-save" ng-disabled="profileForm.$invalid">Save</button>
           		</div>
                <div class="justify-container">
                    <label style="cursor:auto;">Add Products or Services:</label> 
                    <a href="#" class="btn-add-product" data-toggle="modal" data-target="#addProduct">
                            <span class="glyphicon glyphicon-plus"></span>
                            Add Products/Services
                    </a>
                </div>
                <table class="table products-table">
                    <p class="bordered-title borderless"><span>Products</span></p>
                    <tr ng-repeat="product in businessProducts">
                        <td class="text-muted">{{product.productName}}</td>
                        <td>{{product.productDescription}}</td>
                        <td class="controls">
                            <ul class="list-inline">
                                <li><a href="" class="edit-link" data-toggle="modal" ng-click="applyProduct(product)" data-target="#addProduct">edit</a></li>
                                <li><a href="" class="delete-icon" data-toggle="modal" data-target="#removeProdServ" ng-click="applyProductToRemove(product)"><span class="glyphicon glyphicon-trash"></span></a></li>
                            </ul>
                        </td>
                    </tr>
                </table>
                <table class="table products-table services-table">
                    <p class="bordered-title borderless"><span>Services</span></p>
                    <tr ng-repeat="service in businessServices">
                        <td class="text-muted">{{service.serviceName}}</td>
                        <td>{{service.serviceDescription}}</td>
                        <td class="controls">
                            <ul class="list-inline">
                                <li><a href="" class="edit-link" data-toggle="modal" ng-click="applyService(service)" data-target="#addProduct">edit</a></li>
                                <li><a href="" class="delete-icon" data-toggle="modal" data-target="#removeProdServ" ng-click="applyServiceToRemove(service)"><span class="glyphicon glyphicon-trash"></span></a></li>
                            </ul>
                        </td>
                    </tr>
                </table>
        	</form>
		</div>
	</div>
</div><!-- end #businessProfile -->
<%@include file="../modals/addProductService.html"%>
<%@include file="../modals/alerts/removeProductAlert.html"%>
<%@include file="../modals/createLogo.html"%>