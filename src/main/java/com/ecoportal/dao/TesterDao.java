package com.ecoportal.dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import java.util.ArrayList;
import java.util.Calendar;

import com.ecoportal.model.Project;
import com.ecoportal.model.Tester;


public class TesterDao {


	public Tester verifyTester(String name, String pass) {
		//Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testportaldb", "root", "College2o16!");
			String sql = "select * from Tester where testerName=? and password=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, name);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				Tester user = new Tester();
				user.setTid(rs.getInt("testerid"));
				user.setName(rs.getString("testerName"));
				user.setPass(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				return user;	
			}
			con.close();
		    st.close();
		    rs.close();
		} catch (Exception e) {
			System.out.println(e);
		} /*finally {
			if (con != null) {
			    con.close();
			}
		}*/
		return null;
	}
	
	public ArrayList<Project> getProjects(int tid){
		ArrayList<Project> projects = new ArrayList<Project>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testportaldb", "root", "College2o16!");
			String sql = "select * from role "
					+ "inner join project"
					+ " on role.pid=project.pid"
					+ " and testerid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, tid);
			ResultSet rs = st.executeQuery();	
			System.out.println(rs);
			while(rs.next()) {
				Project project = new Project();
				project.setPid(rs.getInt("pid"));
				project.setPname(rs.getString("pname"));
				project.setPendstat(rs.getInt("pendstat"));
				project.setPassstat(rs.getInt("passstat"));
				project.setFailstat(rs.getInt("failstat"));
				project.setCompleted(rs.getBoolean("completed"));
				SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
				project.setSubdate(formatter.format(rs.getDate("subdate")));		
				SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				
			    Date firstDate = sdf.parse(sdf.format(Calendar.getInstance().getTime()));
			    Date secondDate = sdf.parse(sdf.format(rs.getDate("subdate")));
			 
			    long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
			    long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
			    formatter = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
				project.setRecdate(formatter.format(rs.getTimestamp("recdate")));
				project.setDaysLeft((int) diff);
				projects.add(project);
			} 
		    con.close();
		    st.close();
			rs.close();
			return projects;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}	
	
}
