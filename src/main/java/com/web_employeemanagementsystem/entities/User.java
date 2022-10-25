
package com.web_employeemanagementsystem.entities;


public class User{
    
    private int user_id;
    private String user_name;
    private String user_email;
    private String user_pwd;
    private String user_type;

    public User(int user_id, String user_name, String user_email, String user_pwd, String user_type) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_pwd = user_pwd;
        this.user_type = user_type;
    }

    public User(String user_name, String user_email, String user_pwd, String user_type) {
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_pwd = user_pwd;
        this.user_type = user_type;
    }

    public User() {
    }

    public int getUser_id() {
        return user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_pwd() {
        return user_pwd;
    }

    public void setUser_pwd(String user_pwd) {
        this.user_pwd = user_pwd;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email + ", user_pwd=" + user_pwd + ", user_type=" + user_type + '}';
    }
    
        
    
}
