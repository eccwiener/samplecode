<%@page import="com.liferay.portal.kernel.json.JSONObject"%>
<%
	JSONObject json = (JSONObject) request.getAttribute("percentComplete");
%>

<div class="clearfix row">
    <h3 class="progress-info pull-left">Profile completion: <%=json.getString("percentComplete")%>%</h3>
    <ul class="list-inline profile-items">
        <li class="<%=(json.getBoolean("logo")) ? "completed" : "incomplete" %>"><a href="#businessProfile" data-toggle="tab">Logo</a></li>
        <li class="<%=(json.getBoolean("aboutUs")) ? "completed" : "incomplete" %>"><a href="#businessProfile" data-toggle="tab">About Info</a></li>
        <li class="<%=(json.getBoolean("productsServices")) ? "completed" : "incomplete" %>"><a href="#businessProfile" data-toggle="tab" >Products/Services</a></li>
        <li class="<%=(json.getBoolean("imagesVideo")) ? "completed" : "incomplete" %>"><a href="/profile#media" >Photos</a></li>
        <li class="<%=(json.getBoolean("verified")) ? "completed" : "not-verifed" %>"><a href="#verifyCenter" data-toggle="tab">Verification</a></li>
    </ul>
</div>

<progressbar class="progress progress-striped active" value="<%=json.getString("percentComplete")%>"></progressbar>
