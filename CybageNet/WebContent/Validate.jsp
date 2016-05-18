<%@page import="com.connection.Connection1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.connection.*" %>
<%@ page errorPage="Error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%!HashMap<String, Date> map;%>
<%!Connection con; %>
<%!Statement st; %>
<%!ResultSet rs; %>
<%!RequestDispatcher rd; %>
<%
String name=request.getParameter("uname");
String pass=request.getParameter("pass");
pageContext.setAttribute("uname",name,PageContext.SESSION_SCOPE);
	con=Connection1.getCon();
	st=con.createStatement();
	rs=st.executeQuery("select * from login where uname='"+name+"'and pass='"+pass+"'");
	%><c:if test="${map==null}">  
	<%
	 map=new HashMap<String, Date>();
	%></c:if>
	<%Date d=new Date(session.getCreationTime());
	
		if(rs.next())
		{
			pageContext.setAttribute("uname",PageContext.SESSION_SCOPE); 
	
			String type=rs.getString(3);%>
		
			<c:choose>
				<c:when test="${type=='admin'}">
				<%map.put(name, d);
				session.setAttribute("map", map);
				%><jsp:forward page="AdminHome.jsp"></jsp:forward>
				</c:when>
				<%-- <c:when test="${type==user}">
				<%map.put(name, d);
				session.setAttribute("map", map);
				%><jsp:forward page="UserHome.jsp"></jsp:forward>
				</c:when> --%>
				<c:otherwise>
				<jsp:forward page="UserHome.jsp"></jsp:forward>
				</c:otherwise>
			</c:choose>
			<%-- <c:if test="${type==admin}"> 
				<%map.put(name, d);
				session.setAttribute("map", map);
				%><jsp:forward page="AdminHome.jsp"></jsp:forward>
			</c:if>
		<c:elseif test="${type==user}">
			
				map.put(name, d);
				session.setAttribute("map", map);%>
				<jsp:forward page="UserHome.jsp"></jsp:forward>
			</c:elseif>
			<c:else test="${type==null}">
				<jsp:forward page="Relogin.jsp"></jsp:forward>
				</c:else> --%>
		<%}
		else
		{
		%>
			<jsp:forward page="Error.jsp"></jsp:forward>
		<%	
		} 
%>

 </body>
</html>