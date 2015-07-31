<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<portlet:defineObjects />

<%
	String email = (String) request.getAttribute("email");
	String password = (String) request.getAttribute("password");
%>

<script type="text/javascript">
	window.location.href="/signin?autoe=<%=email%>&autop=<%=password%>";
</script>
<!-- redirect user to DASBOARD!! -->