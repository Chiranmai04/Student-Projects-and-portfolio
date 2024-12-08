package com.klef.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.klef.DAO.ProjectDAO;

@WebServlet("/deleteProject")
public class DeleteProjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        ProjectDAO projectDAO = new ProjectDAO();

        // Call the DAO to delete the project
        boolean isDeleted = projectDAO.deleteProject(projectId);

        if (isDeleted) {
            // Redirect back to the projects page after successful deletion
            response.sendRedirect("myProjects.jsp");
        } else {
            // Handle failure scenario
            response.getWriter().println("Failed to delete project. Try again.");
        }
    }
}
