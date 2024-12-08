package com.klef.DAO;

import com.klef.Project;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.klef.HibernateUtil;

import java.util.List;

public class ProjectDAO {

    // Save a new project
    public void saveProject(Project project) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(project);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    // Update an existing project
    public boolean updateProject(Project project) {
        Transaction transaction = null;
        boolean isUpdated = false;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(project);
            transaction.commit();
            isUpdated = true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
        return isUpdated;
    }

    // Fetch a project by ID
    public Project getProjectById(int id) {
        Project project = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            project = session.get(Project.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return project;
    }

    // Fetch all projects by user ID (combined implementation)
    public List<Project> getProjectsByUserId(int userId) {
        List<Project> projects = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Project WHERE userId = :userId";
            Query<Project> query = session.createQuery(hql, Project.class);
            query.setParameter("userId", userId);
            projects = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return projects;
    }

    // Get all projects
    public List<Project> getAllProjects() {
        List<Project> projects = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            projects = session.createQuery("FROM Project", Project.class).list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return projects;
    }

    // Delete a project by ID
    public boolean deleteProject(int projectId) {
        Transaction transaction = null;
        boolean isDeleted = false;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Project project = session.get(Project.class, projectId);
            if (project != null) {
                session.delete(project);
                transaction.commit();
                isDeleted = true;
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
        return isDeleted;
    }
}
