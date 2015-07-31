    <%@page import="com.winwin.portlet.membership.util.BusinessComparer"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.SortedSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.winwin.entities.membership.service.RegionLocalServiceUtil"%>
    <%@page import="com.winwin.entities.membership.model.Region"%>
    <%@page import="com.winwin.entities.membership.model.Location"%>
    <%@page import="com.winwin.portlet.membership.util.MembershipUtil"%>
    <%@page import="org.apache.commons.logging.LogFactory"%>
    <%@page import="org.apache.commons.logging.Log"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="com.winwin.entities.membership.service.BusinessLocalServiceUtil"%>
    <%@page import="com.winwin.entities.membership.model.Business"%>
    <%@page import="java.util.HashMap"%>
    <%@page import="java.util.Map"%>
    <%@page import="com.winwin.entities.membership.service.IndustryLocalServiceUtil"%>
    <%@page import="com.winwin.entities.membership.model.Industry"%>
    <%@page import="java.util.List"%>
    <%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
    <%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

    <portlet:defineObjects />
    <portlet:actionURL name="filter" var="filterURL"/>

    <%
	Log log = LogFactory.getLog("SEO portlet - view.jsp");

	List<Industry> industries = IndustryLocalServiceUtil.getIndustries(0, IndustryLocalServiceUtil.getIndustriesCount());
	List<Region> regions = RegionLocalServiceUtil.getRegions(0, RegionLocalServiceUtil.getRegionsCount());

	Map<Long, Industry> industryMap = new HashMap<Long, Industry>();
	Map<Long, Set<Business>> businessMap = new HashMap<Long, Set<Business>>();

	long industryId = -1;
	long regionId = -1;

	try
	{
		industryId = Long.parseLong((String) request.getAttribute("industryId"));
	}
	catch(NumberFormatException nfe)
	{
		// do nothing
	}

	try
	{
		regionId = Long.parseLong((String) request.getAttribute("regionId"));
	}
	catch(NumberFormatException nfe)
	{
		//do nothing
	}

	//log.info("industryId: " + industryId);
	//log.info("regionId: " + regionId);

	for(Industry industry : industries)
	{
		if (industryId >= 0 && industry.getIndustryId() != industryId)
			continue;

		industryMap.put(industry.getIndustryId(), industry);
		businessMap.put(industry.getIndustryId(), new TreeSet<Business>(new BusinessComparer()));
	}

	List<Business> allBusinesses = BusinessLocalServiceUtil.getBusinesses(0, BusinessLocalServiceUtil.getBusinessesCount());

	for (Business business : allBusinesses)
	{
		
		// ignore deleted entries
		if ("D".equalsIgnoreCase(business.getStatus())) {
			continue;
		}
		
		if (industryId >= 0 && business.getIndustryId() != industryId)
			continue;

		if (business.getName() == null || business.getName().trim().length() == 0)
			continue;
		
		if (!industryMap.containsKey(business.getIndustryId()))
		{
			log.info("no industry id for businessId: " + business.getBusinessId() + " and industryId: " + business.getIndustryId());
			continue;
		}

		if (regionId >= 0)
		{
			Location location = MembershipUtil.getLocationByBusinessId(business.getBusinessId());

			if (regionId != MembershipUtil.getRegionIdByState(location.getState()))
				continue;
		}

		businessMap.get(business.getIndustryId()).add(business);
	}
%>
        <div class="pull-right seo-filter">
        <div class="content-filter">
        <aui:form  cssClass="form-inline" action="<%=filterURL.toString()%>">
        <div class="form-group">
        <aui:select cssClass="form-control" name="industryId" id="Industry" label="Industry">
        <option value="All" <%=(industryId == -1) ? "selected" : "" %>>Pick an  Industry</option>
            <%
	                   		for(Industry industry : industries)
	                   		{
	                   			%>
        <option value="<%=industry.getIndustryId()%>" <%=(industry.getIndustryId() == industryId) ? " selected" : "" %>><%=industry.getName()%></option>
            <%
	                   		}
	                   	%>
        <!--
        <option value="1">Agriculture</option>
        <option value="5">Construction &amp; Manufacturing</option>
        <option value="15">Education</option>
        <option value="7">Energy &amp; Defense</option>
        <option value="8">Entertainment</option>
        <option value="11">Finance</option>
        <option value="10">Food &amp; Beverage</option>
        <option value="18">Government</option>
        <option value="16">Health Care</option>
        <option value="13">Media &amp; Communication</option>
        <option value="3">Moving &amp; Storage</option>
        <option value="17">Non-Profit</option>
        <option value="14">Professional Services</option>
        <option value="22">Property Management</option>
        <option value="21">Real Estate</option>
        <option value="19">Retail</option>
        <option value="33">Sports</option>
        <option value="12">Technology</option>
        <option value="2">Transportation</option>
        <option value="9">Travel</option>
        <option value="20">Wholesale</option>
        -->
        </aui:select>
        </div>
        <div class="form-group">
        <aui:select cssClass="form-control" name="regionId" id="Region" label="Region">
        <option value="All" <%=(regionId == -1) ? "selected" : "" %>>Region</option>
            <%
	                   		for(Region region : regions)
	                   		{
	                   			%>
        <option value="<%=region.getRegionId()%>" <%=(region.getRegionId() == regionId) ? " selected" : "" %>><%=region.getName()%></option>
            <%
	                   		}
	                   	%>
        <!--
        <option value="24">Central</option>
        <option value="25">Mid-Atlantic</option>
        <option value="26">Mountain</option>
        <option value="27">Northeast</option>
        <option value="28">Southeast</option>
        <option value="29">Plains</option>
        <option value="30">West</option>
        -->
        </aui:select>
        </div>
        <div class="form-group">
            <div class="control-group">
                <aui:button cssClass="btn btn-warning" type="submit" value="Filter"/>
            </div>
        </div>
        </aui:form>
        </div><!-- end .content-filter -->
        </div>
            <%

	for (Industry industry : industryMap.values())
	{
		%>
        <div class="clearfix seoAll">
            <div class="text-left">
                <h2 class="page-header"><%=industry.getName()%></h2>
                <logic:empty param="<%= industry.getName() %>"></logic:empty>
            </div>
        </div>
            <%

		Set<Business> businesses = businessMap.get(industry.getIndustryId());

		for(Business business : businesses)
		{
			%>
        <div class="col-lg-6">
            <ul class="list-unstyled">
                <li>
                    <a href="/seo?businessId=<%=business.getBusinessId()%>"><%=business.getName()%></a>
                </li>
            </ul>
        </div>
            <%
		}
	}
%>
