<%@page import="com.ecoportal.model.Admin"%>
<%@page import="com.ecoportal.model.Tester"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=( (Admin) session.getAttribute("user")).getName() %> Workspace</title>
<link rel="stylesheet" type="text/css" href="./css/normalize.css">
<link rel="stylesheet" type="text/css" href="./css/NewFile.css">
</head>
<body>
     <%
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
         response.setHeader("Pragma", "no-cache"); 
         response.setHeader("Expires", "0"); 
         
         if(session.getAttribute("type") != "Admin"){
    	     response.sendRedirect("login.jsp");
    	 } else {%>
     <h1> Hello <%=((Admin) session.getAttribute("user")).getName() %> </h1>
     <br>
     Select the Tester you'd like to review:
     <table border="0">
         <tbody>
             <tr>
                <td>
                    <% 
                    ArrayList<Tester> testers = (ArrayList<Tester>) session.getAttribute("testers");      
                    for(int i=0; i<testers.size(); i++) { %>
                    <form action= "getreport" method="post">
                         <input type="hidden" value="<%=testers.get(i).getName()%>" name= "tname">
                         <button type="submit" value="<%=testers.get(i).getTid()%>" name="tid"><%=testers.get(i).getName()%></button> <br>
                    </form>
                     <%}%>    
               </td>
           </tr>
        </tbody>
    </table> 
    <% } %> 
</body>
</html>