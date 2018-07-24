package com.example.demo1;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;

@Transactional
public interface UserDao  extends CrudRepository<User, Long> ,JpaRepository<User,Long> {
    public User findByEmail(String email);

}
