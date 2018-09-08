<%@page import="com.ecoportal.model.TestCase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecoportal.model.Admin"%>
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
         if(session.getAttribute("user") == null){
    	     response.sendRedirect("alogin.jsp");
    	} else {%>
    	
    	<h1> <%=(String) session.getAttribute("pname")%> - <%=(String) session.getAttribute("tname")%>  </h1>
   <h4> </h4>
    <table id="mytable" style="width:100%">
        <tr>
            <th></th>
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
                  <td><%=cases.get(i).getTestcase() %></td>
                  <td><%=cases.get(i).getExResults() %></td> 
                  <td> <%=cases.get(i).getStatus()%> </td>
                  <td><%=cases.get(i).getComment()%></td>
               </tr>
        <% } %>
    </table>
    <% } %>
</body>
</html>