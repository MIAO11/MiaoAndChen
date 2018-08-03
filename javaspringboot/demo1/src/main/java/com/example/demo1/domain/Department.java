package com.example.demo1.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_department")
public class Department {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(length = 100)
    private String name;

    // 必注、必应主表 Student 属性 Department department;但是造成了JSON 死循环
//  @OneToMany(mappedBy="department")
//  private Set<Student> students=new HashSet<Student>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

//  public Set<Student> getStudents() {
//      return students;
//  }
//
//  public void setStudents(Set<Student> students) {
//      this.students = students;
//  }

    // JPA 必备
    public Department() {
        super();
    }

}
