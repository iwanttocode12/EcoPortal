package com.ecoportal.dao;

import java.sql.*;
import java.util.ArrayList;

import com.ecoportal.model.Project;
import com.ecoportal.model.Admin;;



public class AdminDao {


	public Admin verifyAdmin(String name, String pass) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testportaldb", "root", "College2o16!");
			String sql = "select * from Admin where aname=? and pass=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, name);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				Admin user = new Admin();
				user.setAid(rs.getInt("aid"));
				user.setName(rs.getString("aname"));
				user.setPass(rs.getString("pass"));
				return user;	
			} 
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public ArrayList<Project> getProjects(int aid){
		ArrayList<Project> projects = new ArrayList<Project>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testportaldb", "root", "College2o16!");
			String sql = "select * from project where aid =?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, aid);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Project project = new Project();
				project.setPid(rs.getInt("pid"));
				project.setPname(rs.getString("pname"));
				projects.add(project);
			} 
			rs.close();
			return projects;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}	
	
}


