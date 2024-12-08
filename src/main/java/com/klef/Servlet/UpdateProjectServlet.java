package com.klef.Servlet;

import com.klef.DAO.ProjectDAO;
import com.klef.Project;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateProject")
public class UpdateProjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch form data
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String visibility = request.getParameter("visibility");

        // Update project using DAO
        ProjectDAO projectDAO = new ProjectDAO();
        Project project = projectDAO.getProjectById(projectId);

        if (project != null) {
            project.setTitle(title);
            project.setDescription(description);
            project.setStatus(status);
            project.setVisibility(visibility);

            projectDAO.updateProject(project); // Update project in the database
        }

        // Redirect back to the project list or success page
        response.sendRedirect("myProjects.jsp");
    }
}
