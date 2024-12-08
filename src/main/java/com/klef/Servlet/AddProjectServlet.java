package com.klef.Servlet;

import com.klef.DAO.ProjectDAO;
import com.klef.Project;
import com.klef.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;
@WebServlet("/addProject")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,  // 10 MB
        maxFileSize = 1024 * 1024 * 50,        // 50 MB
        maxRequestSize = 1024 * 1024 * 100)    // 100 MB
public class AddProjectServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String visibility = request.getParameter("visibility");

        // Retrieve the logged-in user from the session
        User loggedInUser = (User) request.getSession().getAttribute("user");

        if (loggedInUser != null) {
            // Create the project object
            Project project = new Project();
            project.setTitle(name);
            project.setDescription(description);
            project.setStatus(status);
            project.setVisibility(visibility);
            project.setCreatedAt(new Date());

            // Associate the project with the logged-in user
            project.setUser(loggedInUser);

            // Handle file upload
            Part filePart = request.getPart("media"); // "media" is the input field name
            if (filePart != null && filePart.getSize() > 0) {
                // Define a path to store uploaded files, e.g., inside a "uploads" directory
                String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs(); // Create the directory if it does not exist
                }

                // Get the submitted file name
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                // Validate the file type (image or video)
                String fileType = filePart.getContentType();
                if (fileType.startsWith("image/") || fileType.startsWith("video/")) {
                    // Construct the full file path
                    String filePath = uploadDir + File.separator + fileName;

                    // Write the uploaded file to the disk
                    filePart.write(filePath);

                    // Save the file path in the project object
                    project.setMediaPath("uploads/" + fileName); // Save relative path to the database
                } else {
                    request.setAttribute("error", "Only images and videos are allowed!");
                    request.getRequestDispatcher("addProject.jsp").forward(request, response);
                    return;
                }
            }

            // Save the project using ProjectDAO
            ProjectDAO projectDAO = new ProjectDAO();
            projectDAO.saveProject(project);

            // Redirect to a project listing page or a success page
            response.sendRedirect("myProjects.jsp");
        } else {
            // Redirect to login page if user is not logged in
            response.sendRedirect("login.jsp");
        }
    }
}
