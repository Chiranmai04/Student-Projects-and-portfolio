package com.klef.DAO;

import com.klef.User;
import com.klef.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class UserDAO {

    // Method to save a new user to the database
    public void saveUser(User user) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(user);  // Save the user object
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();  // Rollback in case of an error
            }
            e.printStackTrace();
        }
    }

    // Method to retrieve all users from the database
    public List<User> getAllUsers() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List<User> users = null;

        try {
            transaction = session.beginTransaction();
            // Query to get all users
            Query<User> query = session.createQuery("FROM User", User.class);
            users = query.list();  // Retrieve the list of users
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();  // Rollback in case of an error
            }
            e.printStackTrace();
        } finally {
            session.close();  // Close session to avoid memory leaks
        }

        return users;
    }
}
