<%@ page import="java.sql.*, com.klef.Project, com.klef.DAO.ProjectDAO" %>
<%
    // Retrieve form parameters
    String projectIdParam = request.getParameter("projectId");
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String status = request.getParameter("status");
    String visibility = request.getParameter("visibility");

    boolean updateSuccess = false;

    try {
        if (projectIdParam != null && !projectIdParam.isEmpty()) {
            int projectId = Integer.parseInt(projectIdParam);

            // Initialize ProjectDAO and Project objects
            ProjectDAO dao = new ProjectDAO();
            Project project = dao.getProjectById(projectId);

            if (project != null) {
                // Set the updated values to the project object
                project.setTitle(title);
                project.setDescription(description);
                project.setStatus(status);
                project.setVisibility(visibility);

                // Update the project in the database
                updateSuccess = dao.updateProject(project);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (updateSuccess) {
        // Redirect or display success message
        out.println("<h2>Project updated successfully!</h2>");
        out.println("<a href='myProjects.jsp'>Back to Projects</a>");
    } else {
        // Display error message
        out.println("<h2>Failed to update project. Please try again.</h2>");
        out.println("<a href='editProject.jsp?projectId=" + projectIdParam + "'>Back to Edit Project</a>");
    }
%>
