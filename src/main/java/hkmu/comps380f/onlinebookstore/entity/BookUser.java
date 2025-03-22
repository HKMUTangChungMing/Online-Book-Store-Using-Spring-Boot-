package hkmu.comps380f.onlinebookstore.entity;

import jakarta.persistence.*;

import java.io.Serializable;
/**
 * User entity class
 *
 */
@Entity
@Table(name ="bookuser")
public class BookUser implements Serializable {
    /**
     * user id
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    /**
     * user account
     */
    private String username;
    /**
     * user password
     */
    private String password;
    /**
     * user role
     * user
     * admin
     */
    private String role;
    /**
     * User full name
     */
    private String realname;
    /**
     * User email
     */
    private String email;
    /**
     * User address
     */
    private String address;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }
}
