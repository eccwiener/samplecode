<%@page import="com.winwin.entities.membership.model.Location"%>
<%@page import="com.winwin.entities.membership.service.persistence.BusinessFinderUtil"%>
<%@page import="com.winwin.entities.membership.service.persistence.BusinessFinderImpl"%>
<%@page import="com.winwin.entities.membership.service.BusinessLocalServiceUtil"%>
<%@page import="com.winwin.portlet.membership.util.MembershipUtil"%>
<%@page import="com.winwin.entities.membership.model.Business"%>
<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<%
	ThemeDisplay td = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);	
	String businessId = (String) request.getAttribute("businessId");
	
	Business myBusiness = (Business) request.getAttribute("myBusiness");
	Business business = (Business) request.getAttribute("business");
	
	boolean isAlly = (Boolean) request.getAttribute("isAlly");
	boolean hasProfileLogo = false;
	
	String profileLogo = (business != null) ? business.getBusinessProfileLogoUrl() : null;
	
	if (profileLogo != null && profileLogo.trim().length() > 0)
		hasProfileLogo = true;
	
	//System.out.println("business: " + businessId + ", myBusiness: " + myBusiness.getBusinessId() + ", isAlly: " + isAlly + ", hasProfileLogo: " + hasProfileLogo + ", profileLogo: " + profileLogo);
%>

<script type="text/javascript" src="/Events-portlet/js/jquery.min.js"></script>

<div ng-controller="ProfileCntrl">
    <div class="profile" ng-cloak>
        <div class="content-left col-sm-12">
            <%@include file="profileTop.jsp" %>
                <div class="col-sm-11">
                <div class="row">
                    <%@include file="tabs.jsp" %>
                    <div class="tab-content">
                        <%@include file="activity.jsp" %>
                        <%@include file="alliances.jsp" %>
                        <%@include file="posts.jsp" %>
                        <%@include file="media.jsp" %>
                        <%@include file="productsServices.jsp" %>
                        <%@include file="awards.jsp" %>
                    </div><!-- end .tab-content -->
                </div><!-- end .row -->
            </div><!-- end .col-sm-11 -->
        </div><!-- end .content-left/col-sm-12 -->
    </div><!-- end .profile -->
    
	<div class="modal fade" id="businessSendMessageModal" tabindex="-1" role="dialog" aria-labelledby="businessSendMessageModalLabel" aria-hidden="true" style="display: none;">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></span></button>
	        <h4 class="modal-title" id="businessSendMessageModalLabel">Send Message to Business</h4>
	      </div>
	      <div class="modal-body">
	        <div class="row">
	          <div>To: {{newBusinessMessage.business.name}}</div>
	        </div>
	        <div class="row">
	          <textarea class="form-control" rows="5" placeholder="Message to Business" ng-model="newBusinessMessage.message"></textarea>
	        </div>
	      </div>
	      <div class="modal-footer"> <!-- Modal Footer -->
	        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal" ng-click="sendBusinessMessage()" ng-disabled="newBusinessMessage.message.length < 3">Post</button>
	      </div>
	    </div>
	  </div>
	</div>    
    
</div> <!-- end .ProfileCntrl -->

<script type="text/javascript">
    var userId=<%=td.getUserId()%>;
    var businessId=<%=businessId%>;
    var myBusinessId=<%=myBusiness.getBusinessId()%>;
    
    <%
    if (hasProfileLogo)
    {    	
    	%>
    		//alert('current src: ' + $('#profileCover').attr('src'));
    		
    		//alert('apply profile cover: <%=profileLogo%>');
    		
    		$('#profileCover').attr('src', '<%=profileLogo%>');
    		$('#profileCover').toggle();
    		//alert('applied profile cover: ' + $('#profileCover').attr('src'));
    	<%
    }
    else
    {
    	%>
    		$('#noProfileCover').toggle();
    	<%
    }
    %>
</script>