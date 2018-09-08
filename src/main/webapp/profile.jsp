<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Profile</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/stats.css">
</head>
<body>
     <% 
      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
      response.setHeader("Pragma", "no-cache"); 
      response.setHeader("Expires", "0"); 
      if(session.getAttribute("type") != "Tester"){
 	     response.sendRedirect("login.jsp");
 	  } else {%>
 
  <div class="main-header keep-fix clearfix">
    <div class="container">
      <h1> Ecobank TestPortal</h1>
	  <h4> Ecobank The PanAfrican Bank  </h4>
	</div> <!--/.container-->
    <div class="navbar clearfix">
      <ul class="nav">
	    <li><a href="dashboard.jsp">My Dashboard</a></li>
	    <li class="dropdown">
	       <a class="dropbtn">My Projects</a>
		    <div class="dropdown-content">
			    <a href="tester.jsp">Current Projects</a>
			    <a href="testerpast.jsp">Past Projects</a>
			</div>
		</li>
		<li class="dropdown-long"><a href="tester.jsp">Current Projects</a></li>
	    <li class="dropdown-long"><a href="testerpast.jsp">Past Projects</a></li>
	    <li class="current"><a href="profile.jsp">Profile</a></li>
	    <li><a href="#">Chat</a></li>
	    <li><a href="logout">Logout</a></li>
      </ul> <!--/.nav-->
    </div> <!--/.navbar-->
  </div> <!--/.main-header-->
  <% } %>
</body>
</html>