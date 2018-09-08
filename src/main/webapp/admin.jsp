<%@page import="com.ecoportal.model.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecoportal.model.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link rel="stylesheet" type="text/css" href="./css/stats.css">
  <title>My Dashboard</title>
</head>
<body>
  <% 
      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
      response.setHeader("Pragma", "no-cache"); 
      response.setHeader("Expires", "0"); 
      if(session.getAttribute("type") != "Admin"){
 	     response.sendRedirect("login.jsp");
 	 } else {%>
 
  <header class="main-header clearfix">
    <div class="container">
      <h1> Ecobank TestPortal</h1>
	  <h4> Ecobank The PanAfrican Bank  </h4>
	</div> <!--/.container-->
    <div class="navbar clearfix">
      <ul class="nav">
	    <li class="current"><a href="admin.jsp">My Dashboard</a></li>
	    <li><a href="tester.jsp">My Projects</a></li>
	    <li><a href="#">My Planner</a></li>
	    <li><a href="#">Chat</a></li>
	    <li><a href="logout">Logout</a></li>
      </ul> <!--/.nav-->
    </div> <!--/.navbar-->
  </header> <!--/.main-header-->
  
  <div class="main clearfix">
    <div class="main-content">
      <div class="intro con">

        <h2> Welcome <%=((Admin) session.getAttribute("user")).getName() %> </h2>
        
        <p>It is a long established fact that a reader will be distracted by the readable content of a 
        page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less 
        normal distribution of letters, as opposed to using 'Content here, content here', making it look 
        like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum 
        as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in 
        their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on 
        purpose (injected humour and the like). </p>
      </div> <!--/.intro-->
      <div class="cur-proj con">
        <h2> Projects </h2>
        <ul class="projects">
           <% 
             ArrayList<Project> projects = (ArrayList<Project>) session.getAttribute("projects");      
             for(int i=0; i<projects.size(); i++) { %>
               <li class="clearfix">
               <img src="http://placeimg.com/100/100/people" alt="Profile Picture"class="proj-link">
               <form action= "getproject" method="post">
                 <input type="hidden" value="<%=projects.get(i).getPname()%>" name=pname>
                 <button type="submit" value="<%=projects.get(i).getPid()%>" name="pid"><%=projects.get(i).getPname()%></button>
               </form>
             </li>
           <%}%>      
        </ul>
      </div> <!--/.cur-proj-->
      <div class="past-proj con">
        <h2> Past Projects </h2>
        <ul class="projects">
          <%     
             for(int i=0; i<projects.size(); i++) { %>
               <li class="clearfix">
                 <img src="http://placeimg.com/100/100/people" alt="Profile Picture"class="proj-link">
                 <form action= "getproject" method="post">
                   <input type="hidden" value="<%=projects.get(i).getPname()%>" name=pname>
                   <button type="submit" value="<%=projects.get(i).getPid()%>" name="pid"><%=projects.get(i).getPname()%></button>
                 </form>
               </li>
           <%}%>       
        </ul>
      </div> <!--/.past-proj-->
    </div> <!--/.main-content-->
    <div class="side-bar">
      <div class="notifications con">
        <h2> Notification </h2>
        <ol>
          <li> Notification 1 </li>
          <li> Notification 2 </li>
          <li> Notification 3 </li>
          <li> Notification 4 </li>
          <li> Notification 5 </li>      
        </ol>
      </div> <!--/.notifications-->
      <div class="deadlines con">
        <h2> Upcoming Deadlines </h2>
        <ol>
          <li> Deadline 1 </li>
          <li> Deadline 2 </li>
          <li> Deadline 3 </li>
          <li> Deadline 4 </li>
          <li> Deadline 5 </li>      
        </ol>
      </div> <!--/.deadlines-->
    </div> <!--/.side-bar-->
  </div> <!--/.main-->
<% } %>
  <script src="./js/jquery.js"></script>
  <script src="./js/myapp.js"></script>
</body>
</html>