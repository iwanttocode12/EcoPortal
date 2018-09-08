<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/normalize.css">
<link rel="stylesheet" type="text/css" href="./css/NewFile.css">
<title>Tester Login</title>
</head>

<body>
      
        <% 
        try {
			Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testportaldb", "root", "College2o16!");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select testerName from Tester"); 
        %>
        <table border="0">
            <thead>
                <tr>
                    <h1> Welcome to the Ecobank Testing Portal Login Screen </h1>   
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Please Login in below:</td>
                </tr>
                <tr>
                    <td>
                        <form action= "login" method="post">
                            Select Tester Name: <select name="testerName"> 
                            <% while(rs.next()) { %>
                                <option value="<%=rs.getString("testerName")%>"><%=rs.getString("testerName")%>
                                </option>
                            <%}%> 
                            </select> <br>
                            Enter Password  <input type="password" name="pass"> <br>
                            <input type="submit"> 
                            <input type="reset"> 
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
        <%
        } catch(Exception e) {
             out.println(e);
        }
        %>
</body>
</html>