<%@page import="com.ecoportal.model.Project"%>
<%@page import="com.ecoportal.model.Tester"%>
<%@page import="com.ecoportal.model.TestCase"%>
<%@ page import="java.util.ArrayList" %>
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
<title><%=((Tester) session.getAttribute("user")).getName() %> Workspace</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/stats.css">
</head>
<body>
     <%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
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
	    <li class="dropdown current">
	       <a class="dropbtn">My Projects</a>
		    <div class="dropdown-content">
			    <a href="tester.jsp">Current Projects</a>
			    <a href="testerpast.jsp">Past Projects</a>
			</div>
		</li>
		<li class="dropdown-long"><a href="tester.jsp">Current Projects</a></li>
	    <li class="dropdown-long"><a href="testerpast.jsp">Past Projects</a></li>
	    <li><a href="profile.jsp">Profile</a></li>
	    <li><a href="#">Chat</a></li>
	    <li><a href="logout">Logout</a></li>
      </ul> <!--/.nav-->
    </div> <!--/.navbar-->
  </div> <!--/.main-header-->
   
   <div class="main stay-fix clearfix">
     <div class="main-con">
       <div class="con">
	     <h2> <%=((Project) session.getAttribute("myproject")).getPname()%> </h2>
	     <p> It is a long established fact that a reader will be distracted by the readable content of a 
	         page when looking at its layout. </p>
               <div class="count"> 
               <p> Date Completed: <%=((Project) session.getAttribute("myproject")).getRecdate()%> </p>
               </div>                
	     <ul class="stats">
	       <li>
	         <div class="wrap">   
     	       <div class="progress-radial progress-<%=((Project) session.getAttribute("myproject")).getPassstat()%>">
     		     <div class="overlay"> <div><span class="pa"><%=((Project) session.getAttribute("myproject")).getPassstat()%>
     		       <input type="hidden" name="passstat" value="<%=((Project) session.getAttribute("myproject")).getPassstat()%>">
     		     </span>%</div> Pass</div>
     	       </div>
     	     </div>
	      </li>  
          <li>
            <div class="wrap">   
     	      <div class="progress-radial progress-<%=((Project) session.getAttribute("myproject")).getFailstat()%>">
     		    <div class="overlay"> <div><span class="fa"><%=((Project) session.getAttribute("myproject")).getFailstat()%>
     		      <input type="hidden" name="failstat" value="<%=((Project) session.getAttribute("myproject")).getFailstat()%>">
     		    </span>%</div> Fail</div>
     	      </div>
     	    </div>
	      </li>               
	     </ul>
	     <div class="view-all"><a href="stats.jsp"> View Full Stats </a></div>
	   </div>
	   <div class="test-cases">
	     <div class="con">
	       <h2> Test Cases</h2>
	       
	       <select class="custom-select">
	    	<option value="all" selected>Show All test cases</option>
  			<option value="Pass">Show Pass test cases only</option>
  			<option value="Fail">Show Fail test cases only</option>
	  	   </select>
	       
	       <div class="scrolltable">
	         <table id="mytable">
	           <tr>
	             <th>#</th>
	             <th>Test Cases</th>
	             <th>Expected Results</th> 
	             <th>Status </th>
	             <th>Comment</th>
	           </tr>
	           <%
	            ArrayList<TestCase> cases = (ArrayList<TestCase>) session.getAttribute("cases");
	            for(int i=0; i<cases.size(); i++){       
	            %>
	           <tr>
	             <td><%=i+1 %></td>
	             <td class="pending"><%=cases.get(i).getTestcase() %>
	               <input type="hidden" name="tcid" value="<%=cases.get(i).getTcid()%>">
	             </td>
	             <td><%=cases.get(i).getExResults() %></td> 
	             <td><%=cases.get(i).getStatus()%></td>
	             <td><%=cases.get(i).getComment()%></td>
	           </tr>
	           <% } %>
	         </table>
	       </div>
           <% } %>
           <div class="view-all"><a href="testerpast.jsp">Back</a></div>
	     </div>
	   </div>
     </div>	
   </div>
   <script src="./js/jquery.js"></script>
   <script src="./js/myapp2.js"></script>
</body>
</html>