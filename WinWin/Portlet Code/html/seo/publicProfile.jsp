<%@page import="com.liferay.portal.kernel.util.PropsUtil"%>
<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@page import="com.winwin.entities.membership.model.Location"%>
<%@page import="com.winwin.entities.membership.model.Business"%>
<%@page import="com.winwin.entities.membership.model.Industry"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places,visualization&v=3"></script>

<portlet:defineObjects />

<%
	Business business = (Business) request.getAttribute("business");
	Location location = (Location) request.getAttribute("location");
	Industry industry = (Industry) request.getAttribute("industry");
	String iconUri = (String) request.getAttribute("iconUri");
	
	
	String logo = business.getLogo();
	ThemeDisplay td = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
	boolean signedIn = td.isSignedIn();
%>
  <div class="row">
        <div class="col-lg-8">
            <div class="profile public" data-id="<%=business.getBusinessId()%>">
                <div class="content-left col-sm-12">
                    <div class="row">
                        <div class="text-left back">
                            <a href="/seo" class="btn btn-primary"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
                        </div>
                        <div class="col-sm-5">
                            <div class="row">
                            <%
                            if (signedIn) {
                                %>
                        		<a href="/profile?businessId=<%=business.getBusinessId()%>">
                            	<img class="img-responsive" src="<%=business.getLogo()%>" />
                            	</a>
                                <%	
                            }
                            else {
                                %>
                            	<img class="img-responsive" src="<%=business.getLogo()%>" />
                                <%	
                            }
                            %>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="row">
                                <h3 class="title"><%=business.getName()%></h3>
                                <div class="info clearfix"><img class="pull-left" src="<%=iconUri%>" />
                                    <div class="text-content">
                                        <p>Industry - <%=industry.getName()%></p>

                                        <p>Location - <%=location.getCity()%>, <%=location.getState()%></p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row info-div">
                        <h4>About <%=business.getName()%></h4>

                        <div class="readmore">
                            <div class="about"><p><%=business.getAboutUs()%></p></div>
                            <div class="noAbout">
                                <p>This organization is a member of WinWinUSA.com, the fast growing B2B social media platform designed to help businesses, non-profits and government agencies connect, communicate and collaborate. </p>       
                                <p>WinWin is a community of engaged organizations searching for new opportunities to increase revenue, decrease expenses, fill capacity and grow. </p>      
                                <p>Create a profile today and join our dynamic community!  Visit WinWinUSA.com. </p>
                            </div>
                        </div>

                        <hr>

                    </div>

                    <div class="row listing">
                        <div class="col-sm-5">
                            <div class="row">
                                <h5 class="title"><%=business.getName()%></h5>
                                <ul class="list-unstyled">
                                    <li><small><%=location.getStreet()%></small></li>
                                    <li><small><%=location.getCity()%>, <%=location.getState()%></small></li>
                                    <li><small><%=business.getPhone()%></small></li>
                                    <li><small><%=business.getWebsite()%></small></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-7">
                        <!--
                            <div class="row">
                                <iframe
                                    id="publicMap"
                                    height="200"
                                    frameborder="0" style="border:0"
                                    src= >
                                </iframe>
                            </div>
                        -->                        
						<div class="row">
							<div id="map-canvas" style="width:320px; height:200px;"></div>
						</div>                        
                    </div>

                </div>
            </div>
            <!-- end .profile -->
        </div>
<!--start connect bottom of public profile --> 
        <div class="public profile connect">
          <h3>How can we Connect with <a href="/profile?businessId=<%=business.getBusinessId()%>"><%=business.getName()%></a>?</h3>

          <div class="row">
            <div class="col-sm-6 col-md-4">
              <div class="thumbnail">
                             <%
                            if (signedIn) {
                                %>
                                <a href="/profile?businessId=<%=business.getBusinessId()%>">
                                <img class="img-responsive" src="/WinWinTheme-theme/images/2.0/videopage/video-slider/alliances.jpg" />
                                 <div class="caption">
                                   <h5>Form An Alliance With <%=business.getName()%></h5>
                                 </div>
                                </a>
                                <%  
                            }
                            else {
                                %>
                                <a href="/business-name" target="_blank">
                                <img class="img-responsive" src="/WinWinTheme-theme/images/2.0/videopage/video-slider/alliances.jpg" />
                                 <div class="caption">
                                   <h5>Form An Alliance With <%=business.getName()%></h5>
                                 </div>
                                </a>
                                <%  
                            }
                            %>              
              </div>
            </div>

            <div class="col-sm-6 col-md-4">
              <div class="thumbnail">
                            <%
                            if (signedIn) {
                                %>
                                <a href="/profile?businessId=<%=business.getBusinessId()%>">
                                <img class="img-responsive" src="/WinWinTheme-theme/images/2.0/videopage/video-slider/B2B.jpg" />
                                 <div class="caption">
                                   <h5>Exchange Goods And Services</h5>
                                    </div>
                                </a>
                                <%  
                            }
                            else {
                                %>
                                <a href="/business-name" target="_blank">
                                <img class="img-responsive" src="/WinWinTheme-theme/images/2.0/videopage/video-slider/B2B.jpg" />
                                 <div class="caption">
                                   <h5>Exchange Goods And Services</h5>
                                 </div>
                                </a>
                                <%  
                            }
                            %>    
              </div>
            </div>

            <div class="col-sm-6 col-md-4">
              <div class="thumbnail">
                            <%
                            if (signedIn) {
                                %>
                                <a href="/profile?businessId=<%=business.getBusinessId()%>">
                                <img class="img-responsive" src="/WinWinTheme-theme/images/2.0/videopage/video-slider/Co-op.jpg" />
                                 <div class="caption">
                                   <h5>Help Each Other Market Your Business</h5>
                                    </div>
                                </a>
                                <%  
                            }
                            else {
                                %>
                                <a href="/business-name" target="_blank">
                                <img class="img-responsive" src="/WinWinTheme-theme/images/2.0/videopage/video-slider/Co-op.jpg" />
                                 <div class="caption">
                                   <h5>Help Each Other Market Your Business</h5>
                                    </div>
                                </a>
                                <%  
                            }
                            %>    
              </div>
              </div>
            </div>
          </div>
        </div>


    <script type="text/javascript">

        jQuery(".join-today").show();
        //var busId = jQuery(".public").data("id");
        //var isPubPage = location.hostname+"/seo?businessId="+busId;
        
        var bounds = new google.maps.LatLngBounds();	
		var map = null;	
		var infoWindow = new google.maps.InfoWindow();	
		var markerIcon = "/WinWinTheme-theme/images/assets/map_marker.png";
		
		map = new google.maps.Map(document.getElementById('map-canvas'), 
			{
	         	center: new google.maps.LatLng(<%=location.getLatittude()%>, <%=location.getLongitude()%>),
	         	zoom: 10
	     	}
		);
		
		var loc = new google.maps.LatLng(<%=location.getLatittude()%>, <%=location.getLongitude()%>);
	
	    new google.maps.Marker({
	        map: map,
	        position: loc,
	        icon: markerIcon,
	        title: '<%=business.getName()%>'
	    });
	
	    bounds.extend(loc);
        /*
        var str =   "<%=location.getStreet()%>";
       
        var map = "https://www.google.com/maps/embed/v1/place?key=<%=PropsUtil.get("google.maps.key")%>&q="+str.replace(/\s+/g, "+")+",<%=location.getCity()%>,<%=location.getState()%>+<%=location.getZip()%>"
        document.getElementById("publicMap").setAttribute("src", map);
        */
        //console.log(isPubPage.length != 0 );

    </script>

