<%@page import="com.ecoportal.model.Tester"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecoportal.model.Project"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Calendar"%>
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
	    <li class="current"><a href="dashboard.jsp">My Dashboard</a></li>
	    <li class="dropdown">
	       <a class="dropbtn">My Projects</a>
		    <div class="dropdown-content">
			    <a href="tester.jsp">Current Projects</a>
			    <a href="testerpast.jsp">Past Projects</a>
			</div>
		</li>
		<li class="dropdown-long"><a>Current Projects</a></li>
	    <li class="dropdown-long"><a>Past Projects</a></li>
	    <li><a href="profile.jsp">Profile</a></li>
	    <li><a href="#">Chat</a></li>
	    <li><a href="logout">Logout</a></li>
      </ul> <!--/.nav-->
    </div> <!--/.navbar-->
  </div> <!--/.main-header-->
  
  <div class="main stay-fix clearfix">
    <div class="main-content">
      <div class="intro con">

        <h2> Welcome <%=((Tester) session.getAttribute("user")).getName() %> </h2>
        
        <p>It is a long established fact that a reader will be distracted by the readable content of a 
        page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less 
        normal distribution of letters, as opposed to using 'Content here, content here', making it look 
        like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum 
        as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in 
        their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on 
        purpose (injected humour and the like). </p>
      </div> <!--/.intro-->
      <div class="cur-proj con">
        <h2> Current Projects </h2>
        <ul class="projects">
           <% 
             int count = 0;
             ArrayList<Project> projects = (ArrayList<Project>) session.getAttribute("projects");      
             for(int i=0; i<projects.size(); i++) { %>
               <% if (!(projects.get(i).isCompleted())) {
               count++;%>
               <li class="projlist clearfix">
                 <form action= "getproject" method="post">
	                <div class="wrap">   
	     	          <div class="progress-radial progress-<%=projects.get(i).getPendstat()%>">
	     		      <div class="overlay"> <div><%=projects.get(i).getPendstat()%>%</div> Complete </div>
	     	        </div>
	                </div>
	                  <div class="wrap">   
     	                <div class="progress-radial progressred-<%=(100 - projects.get(i).getPendstat())%>">
     		          <div class="overlayred"> <div><%=(100 - projects.get(i).getPendstat())%>%</div> Pending</div>
     	            </div>
     	          </div>
     	          <div>
	                <img src="images/mydoc.png" alt="Profile Picture"class="proj-link">        
	                <input type="hidden" value="<%=projects.get(i).toString()%>" name="myproject">
	                <h2><%=projects.get(i).getPname()%></h2>
	              </div>
	              <div class="count-down"> <p>DUE DATE: <%=projects.get(i).getSubdate()%> <span>
	                <%=projects.get(i).getDaysLeft() %> days left</span></p> 
	                <h6> Last Edited: <%=projects.get(i).getRecdate()%> </h6>
	              </div>
                </form>
             </li>
           <%}}%>      
        </ul>
         <% if(count > 0) {%>
        <div class="view-all"><a href="tester.jsp"> View all Current Projects </a></div>
         <% } else { %>
        <p class="parblue"> No Current Projects </p>
        <% } %>
      </div> <!--/.cur-proj-->
      <div class="past-proj con">
        <h2> Past Projects </h2>
        <ul class="projects">
          <%            
             count = 0;
             for(int i=0; i<projects.size(); i++) { %>
               <% if (projects.get(i).isCompleted()) {
               count++;%>
               <li class="projlist clearfix">
                 <form action= "getproject" method="post">
	               <div class="wrap">   
	     	         <div class="progress-radial progress-<%=projects.get(i).getPassstat()%>">
	     		       <div class="overlay"> <div><%=projects.get(i).getPassstat()%>%</div> Pass</div> 
	     		     </div>
	     	       </div>
     	           <div>
	                 <img src="images/mydoc.png" alt="Profile Picture"class="proj-link">        
	                 <input type="hidden" value="<%=projects.get(i).toString()%>" name="myproject">
	                 <h2><%=projects.get(i).getPname()%></h2>
	               </div>
	               <div class="count-down"> <p> DATE COMPLETED: <%=projects.get(i).getRecdate()%> </p> </div>
                 </form>
               </li>
           <%}}%>       
        </ul>
        <% if(count > 0) {%>
        <div class="view-all"><a href="testerpast.jsp"> View all Past Projects </a></div>
        <% } else { %>
        <p class="parblue"> No Past Projects </p>
        <% } %>
      </div> <!--/.past-proj-->
    </div> <!--/.main-content-->
    <div class="side-bar">
      <div class="notifications con">
        <h2> Notification </h2>
        <ol>
          <li> A.R.T. is now added to your projects </li>   
        </ol>
      </div> <!--/.notifications-->
      <div class="deadlines con">
        <h2> Upcoming Deadlines </h2>
        <ol>
          <li> A.R.T. - 18-08-2018 </li>    
        </ol>
      </div> <!--/.deadlines-->
    </div> <!--/.side-bar-->
  </div> <!--/.main-->
<% } %>
  <script src="./js/jquery.js"></script>
  <script src="./js/app.js"></script>
</body>
</html>