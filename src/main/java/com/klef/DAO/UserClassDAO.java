package com.klef.DAO;

import com.klef.UserClass;
import java.util.HashMap;
import java.util.Map;

public class UserClassDAO {

    // Hardcoded user credentials
    private static final Map<String, String> adminUsers = new HashMap<>();
    
    static {
        // Adding some sample usernames and passwords
        adminUsers.put("admin1", "admin1pass");
        adminUsers.put("admin2", "admin2pass");
        adminUsers.put("superadmin", "superSecret");
    }

    // Method to validate a user’s credentials against hardcoded values
    public UserClass validateUser(String username, String password) {
        if (adminUsers.containsKey(username) && adminUsers.get(username).equals(password)) {
            // Create a new UserClass object to represent the valid user
            UserClass user = new UserClass();
            user.setUsername(username);
            user.setPassword(password);
            return user;
        } else {
            return null; // Login failed
        }
    }
}