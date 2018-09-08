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

import com.ecoportal.dao.TesterDao;
import com.ecoportal.model.Project;
import com.ecoportal.model.Tester;

/**
 * Servlet implementation class TloginController
 */
@WebServlet("/login")
public class TloginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tname = request.getParameter("testerName");
        String pass = request.getParameter("pass");
 
        TesterDao tDao = new TesterDao();
        Tester user = tDao.verifyTester(tname, pass);
        HttpSession session = request.getSession();
        
        if (user != null) {
        	
        	session.setAttribute("user", user);
        	session.setAttribute("type", "Tester");
        	
        	ArrayList<Project> projects = tDao.getProjects(user.getTid());
        	        	
        	session.setAttribute("projects", projects);
        	request.setAttribute("message", " ");
    		RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
    		rd.forward(request, response); 
        }
        
        else {
        	request.setAttribute("message", "Username and password are incorrect");
    		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    		rd.forward(request, response); 
        }
	}

}
