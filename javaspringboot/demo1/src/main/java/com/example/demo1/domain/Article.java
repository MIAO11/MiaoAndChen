package com.example.demo1.domain;
import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


@Entity
public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 自增长策略
    @Column(name = "id", nullable = false)
    private Long id;
    @NotEmpty(message = "标题不能为空")
    @Size(min = 2, max = 50)
    @Column(nullable = false, length = 50) // 映射为字段，值不能为空
    private String title;
//    @Lob  // 大对象，映射 MySQL 的 Long Text 类型
//    @Basic(fetch = FetchType.LAZY) // 懒加载
//    @NotEmpty(message = "内容不能为空")
//    @Size(min = 2)
//    @Column(nullable = false) // 映射为字段，值不能为空
//    private String content;//文章全文内容
    @ManyToOne(cascade={CascadeType.MERGE,CascadeType.REFRESH},optional=false)//可选属性optional=false,表示author不能为空。删除文章，不影响用户
    @JoinColumn(name="author_id")//设置在article表中的关联字段(外键)
    private Author author;//所属作者

    public Article() {

    }
}
