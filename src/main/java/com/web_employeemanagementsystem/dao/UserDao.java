package com.web_employeemanagementsystem.dao;

import com.web_employeemanagementsystem.entities.User;
import com.web_employeemanagementsystem.helper.CP;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    public static boolean saveUser(User user) {
        boolean f = false;
        try {
            Connection con = CP.getCon();
            String query = "INSERT INTO users(user_name, user_email, user_pwd, user_type, is_verified) values(?,?,?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getUser_name());
            pstmt.setString(2, user.getUser_email());
            pstmt.setString(3, user.getUser_pwd());
            pstmt.setString(4, user.getUser_type());
            pstmt.setBoolean(5, user.getIs_verified());

            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public static User findUserByEmailAndPwd(String email, String pwd) {
        User user = null;
        try {
            Connection con = CP.getCon();
            String query = "SELECT * FROM USERS WHERE USER_EMAIL= ? AND USER_PWD = ?";

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, pwd);
          

            ResultSet set = pstmt.executeQuery();
            
            while (set.next()) {
                user = new User(set.getInt(1), set.getString(2), set.getString(3), set.getString(4), set.getString(5), set.getBoolean(6));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    
    public static List<User> getUsers()
    {
        List<User> users = new ArrayList<>();
        try {

            Connection con = CP.getCon();
            String query = "SELECT * FROM Users";
            Statement stmt = con.createStatement();
            ResultSet set = stmt.executeQuery(query);
            User user = null;
            while (set.next()) {
                user = new User(set.getInt(1), set.getString(2), set.getString(3), set.getString(4), set.getString(5), set.getBoolean(6));
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    
    public static List<User> getUsersExcludeAdmin()
    {
        List<User> users = new ArrayList<>();
        try {

            Connection con = CP.getCon();
            String query = "SELECT * FROM Users where user_type != 'Admin'";
            Statement stmt = con.createStatement();
            ResultSet set = stmt.executeQuery(query);
            User user = null;
            while (set.next()) {
                user = new User(set.getInt(1), set.getString(2), set.getString(3), set.getString(4), set.getString(5), set.getBoolean(6));
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    
    
    public static boolean promoteToManager(int userID)
    {
        boolean f = false;
        try {
            Connection con = CP.getCon();
            String query = "UPDATE users SET USER_TYPE='Manager' WHERE USER_ID=? ";

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userID);

            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public static boolean demoteToEmployee(int userID)
    {
        boolean f = false;
        try {
            Connection con = CP.getCon();
            String query = "UPDATE users SET USER_TYPE='Employee' WHERE USER_ID=? ";

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userID);

            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
}
