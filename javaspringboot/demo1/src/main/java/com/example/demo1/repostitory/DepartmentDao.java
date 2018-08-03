package com.example.demo1.repostitory;

import com.example.demo1.domain.Department;
import org.springframework.data.jpa.repository.JpaRepository;



public interface DepartmentDao extends JpaRepository<Department, Integer>{

}
