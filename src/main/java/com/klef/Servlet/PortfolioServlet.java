package com.klef.Servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PortfolioServlet")
public class PortfolioServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/sppdb";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "TrTs@2006";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if ("edit".equals(action)) {
                editPortfolio(request, response);
            } else if ("delete".equals(action)) {
                deletePortfolio(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action: " + action);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }

    private void editPortfolio(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String bio = request.getParameter("bio");
        String degree = request.getParameter("degree");
        String university = request.getParameter("university");
        String graduationDate = request.getParameter("graduationDate");
        String skills = request.getParameter("skills");
        String projects = request.getParameter("projects");
        String certificates = request.getParameter("certificates");
        String achievements = request.getParameter("achievements");
        String resume = request.getParameter("resume");

        String sql = "UPDATE portfolio_information SET name = ?, email = ?, bio = ?, degree = ?, university = ?, graduation_date = ?, skills = ?, projects = ?, certificates = ?, achievements = ?, resume = ? WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, bio);
            preparedStatement.setString(4, degree);
            preparedStatement.setString(5, university);
            preparedStatement.setString(6, graduationDate);
            preparedStatement.setString(7, skills);
            preparedStatement.setString(8, projects);
            preparedStatement.setString(9, certificates);
            preparedStatement.setString(10, achievements);
            preparedStatement.setString(11, resume);
            preparedStatement.setInt(12, id);

            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Portfolio updated successfully.");
            } else {
                System.out.println("Portfolio not found for update.");
            }
        } catch (SQLException e) {
            throw new IOException("Error updating portfolio: " + e.getMessage(), e);
        }

        response.sendRedirect("portfolio.jsp");
    }

    private void deletePortfolio(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        String sql = "DELETE FROM portfolio_information WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);

            int rowsDeleted = preparedStatement.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Portfolio deleted successfully.");
            } else {
                System.out.println("Portfolio not found for deletion.");
            }
        } catch (SQLException e) {
            throw new IOException("Error deleting portfolio: " + e.getMessage(), e);
        }

        response.sendRedirect("portfolio.jsp");
    }
}
