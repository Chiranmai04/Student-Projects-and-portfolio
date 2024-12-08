package com.klef;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.klef.DAO.ProjectDAO;

@WebServlet("/admin/viewprojects")
public class AdminViewProjectsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProjectDAO projectDAO;

    public void init() {
        projectDAO = new ProjectDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Project> projects = projectDAO.getAllProjects();
        request.setAttribute("projects", projects);
        request.getRequestDispatcher("/viewprojects.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            projectDAO.deleteProject(projectId);
        }
        response.sendRedirect(request.getContextPath() + "/admin/viewprojects");
    }
}
