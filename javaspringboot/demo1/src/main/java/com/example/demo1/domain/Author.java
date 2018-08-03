package com.example.demo1.domain;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * @Description: 在JPA规范中，一对多的双向关系由多端(Article)来维护。
 * 就是说多端(Article)为关系维护端，负责关系的增删改查。
 * 一端(Author)则为关系被维护端，不能维护关系。
 * 一端(Author)使用@OneToMany注释的mappedBy=”author”属性表明Author是关系被维护端。
 * 多端(Article)使用@ManyToOne和@JoinColumn来注释属性 author,@ManyToOne表明Article是多端，
 * @JoinColumn设置在article表中的关联字段(外键)。
 * @Param:
 * @return:
 * @Author: miao
 * @Date: 2018/7/26
 */

@Entity
public class Author {
    @Id // 主键
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 自增长策略
    private Long id; //id
    @NotEmpty(message = "姓名不能为空")
    @Size(min = 2, max = 20)
    @Column(nullable = false, length = 20)
    private String name;//姓名
    @OneToMany(mappedBy = "author", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    //级联保存、更新、删除、刷新;延迟加载。当删除用户，会级联删除该用户的所有文章
    //拥有mappedBy注解的实体类为关系被维护端
    //mappedBy=”author”中的author是Article中的author属性
    private List<Article> articleList;//文章列表

    public Author() {
    }
}
