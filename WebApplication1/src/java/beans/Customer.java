package beans;

import java.util.*;
import java.text.*;
import java.sql.*;


public class Customer {
  private String email;
  private String password;
  private String id;
  private String username;
  private String phone;


  public Customer() {
    setEmail(email);
    setPassword(password);
    setId(id);
    setUsername(username);
    setPhone(phone);
  }
  

  public String getEmail() {
    return(email);
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return(password);
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getId() {
    return(id);
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getUsername() {
    return(username);
  }

  public void setUsername(String username) {
    this.username = username;
  }  
  
  public String getPhone() {
	return(phone);
  }

  public void setPhone(String phone) {
	this.phone = phone;
  } 
  
     
}
