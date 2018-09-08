package com.ecoportal.dao;

import java.sql.Connection;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecoportal.model.TestCase;


public class ProjectDao {

	
	public ArrayList<TestCase> getProject(int pid, int tid){
		ArrayList<TestCase> cases = new ArrayList<TestCase>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testportaldb", "root", "College2o16!");
			String sql = "select a.*, b.* from (select * from testcase where pid=?) a "
					+ "inner join (select * from teststatus where testerid=?) b "
					+ "on a.tcid=b.tcid";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, pid);
		    st.setInt(2, tid);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				TestCase tc = new TestCase();
				tc.setTcid(rs.getInt("tcid"));
				tc.setTestcase(rs.getString("testcase"));
				tc.setExResults(rs.getString("exresults"));
				tc.setStatus(rs.getString("status"));
				tc.setComment(rs.getString("comment"));
				cases.add(tc);
			} 
		    con.close();
		    st.close();
			rs.close();
			return cases;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public void saveProj(String proj, int tid, int pid){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testportaldb", "root", "College2o16!");	
			String[] listS = proj.split(";;");
			boolean comp = false;
			if ("Submit".equals(listS[0])) {
		        comp = true;
			}
		    String myCase = listS[1];
		    String[] percent = myCase.split(" ");
		    int passstat = Integer.parseInt(percent[0]);
		    int pendstat = Integer.parseInt(percent[1]);
		    int failstat = Integer.parseInt(percent[2]);
		    
			String sql = "update Role set passstat=?, failstat=?, pendstat=?, recdate=?, completed=? where testerid=? and pid=?";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, passstat);
			st.setInt(2, failstat);
			st.setInt(3, pendstat);
			st.setInt(6, tid);
			st.setInt(7, pid);
			st.setBoolean(5, comp);
			String today = formatter.format(Calendar.getInstance().getTime());
			java.sql.Timestamp curdate = java.sql.Timestamp.valueOf(today);
			st.setTimestamp(4, curdate) ;
			st.executeUpdate();

			sql = "update Teststatus set status=?, comment=? where testerid=? and tcid=?";
	        for(int i=2; i<listS.length; i++) {
	        	String myStatus = listS[i];
	        	String[] stat = myStatus.split("~");
	        	int tcid = Integer.parseInt(stat[0]);
	        	String status = stat[1];
	        	String comment = "";
	        	if (stat.length == 3) {
	        	  comment = stat[2];
	        	}  	
	        	st = con.prepareStatement(sql);
				st.setString(1, status);
				st.setString(2, comment);
				st.setInt(3, tid);
				st.setInt(4, tcid);
				st.executeUpdate();
	        }
		    con.close();
		    st.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	/*public ArrayList<Tester> getTester(int pid){
		ArrayList<Tester> testers = new ArrayList<Tester>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testportaldb", "root", "College2o16!");
			String sql = "select * from role "
					+ "inner join tester"
					+ " on role.testerid=tester.testerid"
					+ " and pid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, pid);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Tester tc = new Tester();
				tc.setTid(rs.getInt("testerid"));
				tc.setName(rs.getString("testerName"));
				testers.add(tc);
			} 
			rs.close();
			return testers;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int createProject(String name, int aid) {
	    return 1;	
	}
	
	public void createTester(String name, String password, String email) {
		
	}
	
	public ArrayList<TestCase> createTest(String testcase, String expRes) {
		return null;
		
	}
	
	
	public void addTester(int tid, int pid) {
		
	}*/
	
}
