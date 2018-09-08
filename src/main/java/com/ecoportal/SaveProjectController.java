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
import com.ecoportal.dao.TesterDao;
import com.ecoportal.model.Project;
import com.ecoportal.model.Tester;

@WebServlet("/savetest")
/**
 * Servlet implementation class SaveProjectController
 */
public class SaveProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        
		HttpSession session = request.getSession();
        int tid = ((Tester) session.getAttribute("user")).getTid();
        int pid = ((Project) session.getAttribute("myproject")).getPid();
       
        String statuslist = request.getParameter("statuslist");
        ProjectDao pDao = new ProjectDao();
        pDao.saveProj(statuslist, tid, pid);
        
        TesterDao tDao = new TesterDao();
		ArrayList<Project> projects = tDao.getProjects(tid);
		session.setAttribute("projects", projects);
	    RequestDispatcher rd = request.getRequestDispatcher("tester.jsp");
	    rd.forward(request, response);
	}

}
