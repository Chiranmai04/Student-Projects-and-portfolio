package com.klef.Servlet;

import com.klef.Project;
import com.klef.DAO.ProjectDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/projects")
public class ProjectServlet extends HttpServlet {

    private ProjectDAO projectDAO = new ProjectDAO();

    // Handles GET requests to fetch projects by user ID
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("userProjects".equals(action)) {
            String userIdParam = request.getParameter("userId");
            if (userIdParam == null || userIdParam.isEmpty()) {
                response.getWriter().write("User ID is missing.");
                return;
            }

            try {
                int userId = Integer.parseInt(userIdParam);
                List<Project> projects = projectDAO.getProjectsByUserId(userId);

                // Add the projects to request attributes to display in JSP
                request.setAttribute("projects", projects);
                request.getRequestDispatcher("/myProjects.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.getWriter().write("Invalid user ID.");
            }
        }
    }

    // Handles POST requests to add a new project
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addProject".equals(action)) {
            String userIdParam = request.getParameter("userId");

            if (userIdParam == null || userIdParam.isEmpty()) {
                response.getWriter().write("User ID is missing.");
                return;
            }

            try {
                int userId = Integer.parseInt(userIdParam);
                String projectName = request.getParameter("name");
                String projectDescription = request.getParameter("description");

                // Create new project and set data
                Project project = new Project();
                project.setTitle(projectName);
                project.setDescription(projectDescription);
                project.setId(userId);

                // Save the project using DAO
                projectDAO.saveProject(project);

                // Redirect back to success page
                response.sendRedirect("projectSuccess.jsp");
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.getWriter().write("Invalid user ID.");
            }
        }
    }
}
