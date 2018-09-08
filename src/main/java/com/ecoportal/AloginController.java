package com.ecoportal;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

import com.ecoportal.dao.AdminDao;
import com.ecoportal.model.Admin;
import com.ecoportal.model.Project;

/**
 * Servlet implementation class TloginController
 */
@WebServlet("/alogin")
public class AloginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String aname = request.getParameter("adminName");
        String pass = request.getParameter("pass");
 
        AdminDao aDao = new AdminDao();
        Admin user = aDao.verifyAdmin(aname, pass);
        
        if (user != null) {
              	
        	HttpSession session = request.getSession();
        	session.setAttribute("user", user);
        	session.setAttribute("type", "Admin");
        	
        	ArrayList<Project> projects = aDao.getProjects(user.getAid());
        	
        	session.setAttribute("projects", projects);
    		RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
    		rd.forward(request, response); 
        }
        
        else {
    		RequestDispatcher rd = request.getRequestDispatcher("alogin.jsp");
    		rd.forward(request, response); 
        }
	}

}

