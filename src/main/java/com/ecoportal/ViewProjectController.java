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
import com.ecoportal.model.Tester;

@WebServlet("/viewproject")
/**
 * Servlet implementation class ViewProjectController
 */
public class ViewProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("yes");
		
		int pid = Integer.parseInt(request.getParameter("pid"));
        String pname = (String) request.getParameter("pname");
		
	        
	    ProjectDao pDao = new ProjectDao();
	    //ArrayList<Tester> testers = pDao.getTester(pid);
	   
	    HttpSession session = request.getSession();
	    session.setAttribute("testers", testers);
	    session.setAttribute("pid", pid);
	    session.setAttribute("pname", pname);
	    RequestDispatcher rd = request.getRequestDispatcher("testerlist.jsp");
	    rd.forward(request, response);
	}

}
