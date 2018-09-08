<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create New Project</title>
<link rel="stylesheet" type="text/css" href="./css/normalize.css">
<link rel="stylesheet" type="text/css" href="./css/NewFile.css">
</head>
<body>
     <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
       response.setHeader("Pragma", "no-cache"); 
       response.setHeader("Expires", "0"); %>
       
       <form action= "addproject" method="post">
           Enter Project Name: <input type="text" name="pname">
           Choose Testers:<input type="checkbox" name="testers">
       </form>
</body>
</html>