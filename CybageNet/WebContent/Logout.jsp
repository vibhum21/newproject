<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession hs = request.getSession();
String name=(String) hs.getAttribute("uname");
//System.out.println(name);
HashMap<String, Date> map=(HashMap<String, Date>) hs.getAttribute("map");

Iterator<Map.Entry<String, Date>> entries = map.entrySet().iterator();
while (entries.hasNext()) {
    Map.Entry<String, Date> entry = entries.next();
    if(name.equals(entry.getKey()))
    {
    	entries.remove();
    }
}
   
    hs.setAttribute("map", map);
    
    hs.invalidate();
   

 RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
 rd.forward(request, response);  
%>
</body>
</html>