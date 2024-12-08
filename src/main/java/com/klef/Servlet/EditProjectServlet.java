package com.klef.Servlet;

import com.klef.DAO.ProjectDAO;
import com.klef.Project;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editProject")
public class EditProjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectIdParam = request.getParameter("projectId");

        System.out.println("Received projectId: " + projectIdParam); // Debugging

        if (projectIdParam != null && !projectIdParam.isEmpty()) {
            int projectId;
            try {
                projectId = Integer.parseInt(projectIdParam);
                System.out.println("Parsed projectId: " + projectId); // Debugging
            } catch (NumberFormatException e) {
                response.sendRedirect("projectNotFound.jsp");
                return;
            }

            ProjectDAO projectDAO = new ProjectDAO();
            Project project = projectDAO.getProjectById(projectId);

            if (project != null) {
                System.out.println("Project found: " + project.getTitle()); // Debugging
                request.setAttribute("project", project);
                RequestDispatcher dispatcher = request.getRequestDispatcher("editProject.jsp");
                dispatcher.forward(request, response);
            } else {
                System.out.println("Project not found for ID: " + projectId); // Debugging
                response.sendRedirect("projectNotFound.jsp");
            }
        } else {
            System.out.println("Invalid projectId: " + projectIdParam); // Debugging
            response.sendRedirect("projectNotFound.jsp");
        }
    }
}
