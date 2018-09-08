package com.ecoportal;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecoportal.dao.ProjectDao;
import com.ecoportal.model.TestCase;
import com.ecoportal.model.Tester;

@WebServlet("/getreport")
/**
 * Servlet implementation class GetReportController
 */
public class GetReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tid = Integer.parseInt(request.getParameter("tid"));
        String tname = (String) request.getParameter("tname");
		
		HttpSession session = request.getSession();
        int pid = (Integer) session.getAttribute("pid");
        

	        
	    ProjectDao pDao = new ProjectDao();
	    ArrayList<TestCase> cases = pDao.getProject(pid, tid);
	    
	    session.setAttribute("cases", cases);
	    session.setAttribute("tid", tid);
	    session.setAttribute("tname", tname);
	    RequestDispatcher rd = request.getRequestDispatcher("report.jsp");
	    rd.forward(request, response);
	}

}
