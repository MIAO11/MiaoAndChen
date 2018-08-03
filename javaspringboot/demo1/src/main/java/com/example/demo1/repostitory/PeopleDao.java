package com.example.demo1.repostitory;

import com.example.demo1.domain.People;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;

@Transactional
public interface  PeopleDao extends JpaRepository<People,Integer> {
    public People save(People people);

    public People findByName(String name);

}
