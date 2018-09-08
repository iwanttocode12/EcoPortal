<%@page import="com.ecoportal.model.Project"%>
<%@page import="com.ecoportal.model.Tester"%>
<%@page import="com.ecoportal.model.TestCase"%>
<%@ page import="java.util.ArrayList" %>
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
	   <h2> Statistics for <%=((Project) session.getAttribute("myproject")).getPname()%> </h2> 
	   
	    <% ArrayList<TestCase> cases = (ArrayList<TestCase>) session.getAttribute("cases");
		   ArrayList<TestCase> passCases = new ArrayList<TestCase>();
		   ArrayList<TestCase> failCases = new ArrayList<TestCase>();
	       for(int i=0; i<cases.size(); i++){  
	         if(cases.get(i).getStatus().equals("Pass")) {
	        	 passCases.add(cases.get(i));
	         } else {
	        	 failCases.add(cases.get(i));
	         }
	       }
	    %>  
	    
	   <select class="custom-select">
	    <option value="all" selected>Show All</option>
	    <option value="distable">Show Distribution Tables</option>
  		<option value="progresbar">Show Progress bar only</option>
  		<option value="bargraph">Show Bar graph only</option>	
	   </select>
	    
	   <div class="distable con"> 
	     <h2> Distribution Tables</h2> 
	    <div class="con">
	     <h4> <%=passCases.size() %> test <%if (passCases.size() == 1) {%> case <% }else {%>cases <% } %>passed</h4>
	     <% if (passCases.size() != 0)  {%>
	     <div class="view-all"> <a>Show Pass cases</a></div> 
	     <div class="scrolltable">
	       <table id="mytable">
	         <tr>
	           <th>#</th>
	           <th>Test Cases</th>
	         </tr>       
	         <tr>
            <% for (int i=0; i< passCases.size(); i++) {%>
	           <td><%=i+1 %></td>
	           <td><%=cases.get(i).getTestcase() %></td>
	         </tr>
	        <% } %>
	       </table>
	     </div>	 
	     <% } %>  
	     </div>
	  
	     <div class="con">
	     <h4> <%=failCases.size() %> test <%if (failCases.size() == 1) {%> case <% }else {%>cases <% } %>failed</h4>
	     <% if (failCases.size() != 0)  {%>
	     <div class="view-all"> <a>Show Fail cases</a></div>  
	     <div class="scrolltable">
	       <table id="mytable">
	         <tr>
	           <th>#</th>
	           <th>Test Cases</th>
	         </tr>       
	         <tr>
            <% for (int i=0; i< failCases.size(); i++) {%>
	           <td><%=i+1 %></td>
	           <td><%=cases.get(i).getTestcase() %></td>
	         </tr>
	        <% } %>
	       </table>
	     </div>	
	     <% } %>
	    </div>
	   </div>
	   
	   <div class="progbar con"> 
	     <h2> Progress Bar </h2>             
	     <ul class="statspage">
	       <li>
	         <div class="wrap-big">   
     	       <div class="progress-radial-big progress-<%=((Project) session.getAttribute("myproject")).getPassstat()%>">
     		     <div class="overlay"> <%=((Project) session.getAttribute("myproject")).getPassstat()%>
     		     % Pass</div>
     	       </div>
     	     </div>
	      </li>  
          <li>
            <div class="wrap-big">   
     	      <div class="progress-radial-big progress-<%=((Project) session.getAttribute("myproject")).getFailstat()%>">
     		    <div class="overlay"><%=((Project) session.getAttribute("myproject")).getFailstat()%>
     		    % Fail</div>
     	      </div>
     	    </div>
	      </li>               
	     </ul>
	   </div><!-- progbar -->
	   <!--  
	   <div class="piechar con">
	     <h2> Pie Chart </h2>
	     <ul class="statspage">
	       <li>
	         <div class="wrap-big">   
     	       <div class="progress-radial-big progress-<%//=((Project) session.getAttribute("myproject")).getPassstat()%>">
     		     <div class="overlay-trans"><%//=((Project) session.getAttribute("myproject")).getPassstat()%>
     		     % Pass</div>
     	       </div>
     	     </div>
	      </li>  
          <li>
            <div class="wrap-big">   
     	      <div class="progress-radial-big progress-<%//=((Project) session.getAttribute("myproject")).getFailstat()%>">
     		    <div class="overlay-trans"><%//=((Project) session.getAttribute("myproject")).getFailstat()%>
     		     % Fail</div>
     	      </div>
     	    </div>
	      </li>               
	     </ul>
	   </div> <!-- piechart -->
	   <div class="bargraph con">
	     <h2> Bar Graph </h2> 
	     <div class="skilcon">
		   <div class="skilbox">
	         <p> Pass </p>
			 <p> <%=((Project) session.getAttribute("myproject")).getPassstat()%>% </p>
			 <div class="skill">
			   <div class="skill_level-<%=((Project) session.getAttribute("myproject")).getPassstat()%>"></div>
		    </div><!-- skill -->
		  </div><!-- skillbox -->
	      <div class="skilbox">
		    <p> Fail </p>
		    <p> <%=((Project) session.getAttribute("myproject")).getFailstat()%>% </p>
		    <div class="skill">
		      <div class="skill_level-<%=((Project) session.getAttribute("myproject")).getFailstat()%>"></div>
		    </div><!-- skill -->
		  </div><!-- skillbox -->
		</div><!-- skillcon -->
       </div><!-- baargraph -->
	   <div class="view-all"> <a href="projectpast.jsp"> Back to <%=((Project) session.getAttribute("myproject")).getPname()%> Page</a></div> 
     </div><!-- maincon -->
   </div><!-- main -->
   <script src="./js/jquery.js"></script>
   <script src="./js/stats.js"></script>
   <% } %>
</body>
</html>