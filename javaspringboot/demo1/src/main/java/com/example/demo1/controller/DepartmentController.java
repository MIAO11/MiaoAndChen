package com.example.demo1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo1.domain.Department;
import com.example.demo1.domain.Student;
import com.example.demo1.repostitory.DepartmentDao;
import com.example.demo1.repostitory.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
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
 * ① Delete：宿舍的一条记录id作为学生外键属性值时不能删除
 * ② Insert、Update、Select 同单表 CRUD
 * @author linhongcun
 *
 */
@RestController
@RequestMapping("/department")
@EnableSwagger2
public class DepartmentController {

    @Autowired
    private DepartmentDao departmentDao;

    @Autowired
    private StudentDao studentDao; // 删除检查是否存在关系

    /**
     * 1、查
     * @param id
     * @return
     */
    @GetMapping("/get/{id}")
    public Department getDepartmentById(@PathVariable Integer id) {
        Department department=new Department();
        department.setId(id);
        Example<Department> departmentExample = Example.of(department);
        return departmentDao.findOne(departmentExample).orElse(null);
    }

    /**
     * 2、删：这个要特别注意，其他的没什么好讲的
     * @param id
     * @return
     */
    @DeleteMapping("/delete/{id}")
    public Map<String, Object> deleteDeparmentById(@PathVariable Integer id) {
//        Department department = departmentDao.findOne(id);
        Department department=new Department();
        department.setId(id);
        Example<Department> departmentExample = Example.of(department);
        department=departmentDao.findOne(departmentExample).orElse(null);
        Map<String, Object> map = new HashMap<String, Object>();
        List<Student> studentsByDepartmentId = studentDao.getStudentsByDepartmentId(id);
        if (studentsByDepartmentId.size() == 0) {
            departmentDao.deleteById(id);
            map.put("status", true);
            map.put("msg", "删除成功");
            map.put("data", department);
        } else {
            map.put("status", false);
            map.put("msg", "不能删除，因存在关联关系");
        }
        return map;
    }

    /**
     * 3、改
     * @param department
     * @return
     */
    @PutMapping("/update")
    public Department updateDepartment(Department department) {
        departmentDao.save(department);
        return department;
    }

    /**
     * 4、增
     * @param department
     * @return
     */
    @PostMapping("/insert")
    public Department insertDepartment(Department department) {
        departmentDao.save(department);
        return department;
    }

    /**
     * 5、全
     * @return
     */
    @GetMapping("/all")
    public List<Department> getAllDepartments() {
        return departmentDao.findAll();
    }

}
