<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="login-screen">
  <div class="main-header">
    <div class="container">
	  <h1> Ecobank TestPortal</h1>
	  <h4> Ecobank The PanAfrican Bank  </h4>
	     <!-- 
		      <ul class="jumboText">
		      	<li> Lorem Ipsum is simply dummy text of the printing </li>
		      	<li> It is a long established fact that a reader </li>
		      	<li> Neque porro quisquam est qui dolorem ipsum quia dolor sit amet </li>
		      	<li> Ecobank The PanAfrican Bank </li>
		      </ul>
	      -->
    </div>
  </div>
   
  <% if(request.getAttribute("message") == null) {
	  request.setAttribute("message", " ");
  }%> 
   
  <div class="main container clearfix">
    <form action="alogin" method="post" class="login">
	  <h2> Admin Login </h2>
	  <div class="formcontainer">
        <label for="tname">Username</label>
		<input type="text" id="tname" name="adminName">
	  </div>
	  <div class="formcontainer">
	    <label for="pass">Password</label>
	   	<input type="password" id="pass" name="pass">
	  </div>
	  <div class="formcontainer clearfix">
	   	<input type="submit" value="Login" >
	  </div>
	  <div class="admin-link"><a href="login.jsp">I am an Tester</a></div>
	  <div class="pop-up"><%=request.getAttribute("message")%></div>
    </form>
  </div>
  <script src="./js/jquery.js"></script>
  <script src="./js/myapp.js"></script>
</body>
</html>