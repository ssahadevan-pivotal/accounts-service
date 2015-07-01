package org.example.accounts.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="account")
public class Account implements Serializable {
    private static final long serialVersionUID = 1L;
 
    @Id
    @GeneratedValue
    private long id;
 
    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String lastName;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String username;
 
    public String getName() { return name; }
 
    public void setName(String name) { this.name = name; }

    public String getLastName() { return lastName; }
 
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }
 
    public void setEmail(String email) { this.email = email; }

    public String getUsername() { return username; }
 
    public void setUsername(String username) { this.username = username; }

    public long getId() { return id; }
 
    public void setId(long id) { this.id = id; }
 
}
