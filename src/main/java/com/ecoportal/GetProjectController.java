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
import com.ecoportal.model.Project;
import com.ecoportal.model.TestCase;
import com.ecoportal.model.Tester;


@WebServlet("/getproject")
/**
 * Servlet implementation class GetProjectController
 */
public class GetProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String stringProj = request.getParameter("myproject");
		Project myProject = new Project();
		myProject.clone(stringProj);
		int pid = myProject.getPid();
        
		HttpSession session = request.getSession();
        int tid = ((Tester) session.getAttribute("user")).getTid();
        	        
	    ProjectDao pDao = new ProjectDao();
	    ArrayList<TestCase> cases = pDao.getProject(pid, tid);
	    
	    session.setAttribute("cases", cases);
	    session.setAttribute("myproject", myProject);
	    if (myProject.isCompleted()) {
		    RequestDispatcher rd = request.getRequestDispatcher("projectpast.jsp");
		    rd.forward(request, response);
	    } else {
		    RequestDispatcher rd = request.getRequestDispatcher("project.jsp");
		    rd.forward(request, response);	    	
	    }
	        
	}

}
