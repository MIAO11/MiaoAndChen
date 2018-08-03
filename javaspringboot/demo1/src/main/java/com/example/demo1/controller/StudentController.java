package com.example.demo1.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import com.example.demo1.domain.Student;
import com.example.demo1.repostitory.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 多表 CRUD 注意点：
 * ① Select：JPA findOne 会同时查询外键值对应表的记录的其他属性（优点）
 * ② Delete、Update、Insert 同单表 CRUD
 * @author linhongcun
 *
 */
@RestController
@RequestMapping("/student")
@EnableSwagger2
public class StudentController {

    @Autowired
    private StudentDao studentDao;

    /**
     * 1、查
     * @param id
     * @return
     */
    @GetMapping("/get/{id}")
    public Optional<Student> getStudentById(@PathVariable Integer id) {
//        Student student=new Student();
//        student.setId(id);
//        Example<Student> example = Example.of(student);
//        studentDao.findById(id);
        return     studentDao.findById(id);
    }

    /**
     * 2、增
     * @param student
     * @return
     */
    @PostMapping("/insert")
    public Student insertStudent(Student student) {
        studentDao.save(student);
        return student;
    }

    /**
     * 3、删
     * @param id
     * @return
     */
    @DeleteMapping("/delete/{id}")
    public String deleteStudentById(@Valid @PathVariable Integer id, BindingResult bindingResult) {
//        Student student = studentDao.findOne(id);
//        studentDao.delete(id);
        return "";
    }

    /**
     * 4、改
     * @param student
     * @return
     */
    @PutMapping("/update")
    public Student updateStudent(Student student) {
        studentDao.save(student);
        return student;
    }

    /**
     * 5、全
     * @return
     */
    @GetMapping("/all")
    public List<Student> getAllStudents() {
        return studentDao.findAll();
    }
}