<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<style>

label {
    font-family: sans-serif;
    display: block;
    margin: 10px;
    padding-left: 34px;
    padding-top: 30px;
}
label.login {
    padding-left: 73px;
    float: left;
}
label.logout {
    padding-right: 78px;
    float: right;
}
span.heading {
    font-family: cursive;
    font-style: italic;
    font-size: 30px;
    padding-left: 100px;
    padding-top: 10px;
    width: 300px;
    position: absolute;
}
span{
font-size:20px;
display:inline-block;
width:140px;
}

div.wrapper {
    background-color: bisque;
    border-radius: 10px;
    border-color: red;
    border-width: 3px;
    border-style: solid;
    width: 400px;
    height: 200px;
    margin: auto;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
}
h2.heading{

top: 0;
bottom: 0;
left: 0;
right: 0;
}
body
{
background-color: rgba(0,0,0,0,5);
}
input.btn {
border: 0;
background-color: #3bab53;
width: 80px;
height: 30px;
font-size: 16px;
color: white;
}

</style>

</head>
<body>
<div class="wrapper">
<form method="post" action="BookDetails.jsp">
<span class="heading">Welcome <%String username=(String) pageContext.getAttribute("uname",PageContext.SESSION_SCOPE);
out.println(username);%></span>
<br><br><label><span>Book Name : </span><input type="text" name="bname" required></label>
<label class="login"><input class="btn" type="submit" value="Search"></label>


</form>
<form method="post" action="Logout.jsp">
<label class="logout"><input class="btn" type="submit" value="Logout"/></label>
</form>
</div>
</body>
</html>