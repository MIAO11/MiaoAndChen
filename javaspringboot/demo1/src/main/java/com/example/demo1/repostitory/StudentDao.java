package com.example.demo1.repostitory;

import java.util.List;

import com.example.demo1.domain.Student;
import com.example.demo1.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


public interface StudentDao extends CrudRepository<Student, Integer>, JpaRepository<Student, Integer> {

    @Query(value="select * from t_student where department_id=?1",nativeQuery=true)
    List<Student> getStudentsByDepartmentId(Integer id);
}
