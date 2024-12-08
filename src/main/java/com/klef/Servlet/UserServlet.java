
package com.klef.Servlet;
import com.klef.DAO.UserDAO;
import com.klef.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewusers")
public class UserServlet extends HttpServlet {

    // Handle GET requests to view users
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create UserDAO instance
        UserDAO userDAO = new UserDAO();
        
        // Fetch all users from the database
        List<User> users = userDAO.getAllUsers();
        
        // Set the users as a request attribute
        request.setAttribute("users", users);
        
        // Forward the request to the JSP page to display users
        request.getRequestDispatcher("/viewusers.jsp").forward(request, response);
    }
}
