package com.example.demo1;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by 340092 on 2017/11/20.
 */
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    // The user email
    @NotNull
    private String email;
    // The user name
    @NotNull
    private String name;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User(@NotNull String email, @NotNull String name) {
        this.email = email;
        this.name = name;
    }
    public User() {

    }
    public User(@NotNull Long id, @NotNull String email, @NotNull String name) {
        this.email = email;
        this.name = name;
    }
}
