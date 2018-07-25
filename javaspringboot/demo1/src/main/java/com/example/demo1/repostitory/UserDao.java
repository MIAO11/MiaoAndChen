package com.example.demo1.repostitory;

import com.example.demo1.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface UserDao  extends CrudRepository<User, Long> ,JpaRepository<User,Long> {
    public User findByEmail(String email);

}
