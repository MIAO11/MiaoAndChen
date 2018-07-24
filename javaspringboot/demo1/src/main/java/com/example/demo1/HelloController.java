package com.example.demo1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Optional;


@RestController
public class HelloController {
    @Autowired
    UserDao userDao;

    @PostMapping(value="/api/v1/test/addUser")
    public String saveOne(@RequestParam("name") String name,@RequestParam("email") String email){
       User user = new User();
       user.setEmail(email);
       user.setName(name);
       userDao.save(user);
        return "添加用户成功";
    }

    /**
     * @Description: 查询所有用户列表
     * @Param: id
     * @return:
     * @Author: miao
     * @Date: 2018/7/23
     */
    @RequestMapping(value = "/api/v1/test/userList")
    public List<User> getUserList() {
        List list = userDao.findAll();
        return userDao.findAll();
    }

    /**
     * @Description: 通过id  删除 user
     * @Param: id
     * @return:
     * @Author: miao
     * @Date: 2018/7/23
     */
    @DeleteMapping(value = "/api/v1/test/delById/{id}")
    public String delById(@PathVariable("id") Long id) {
        try {
            userDao.deleteById(id);
            return "删除成功";
        } catch (Exception ex) {
            return ex.toString();
        }
    }

    /**
     * @Description: 更新user
     * @Param: user 类属性
     * @return:
     * @Author: miao
     * @Date: 2018/7/23
     */
    @PutMapping(value = "/api/v1/test/update")
    public String update(@RequestParam("id") Integer id,
                         @RequestParam("email") String email,
                         @RequestParam("name") String name) {
        System.out.println(id);
        System.out.println(email);
        System.out.println(name);
        try {
            User user = new User();
            user.setId(id.longValue());
            user.setEmail(email);
            user.setName(name);
            userDao.save(user);
            return "更新成功";
        } catch (Exception ex) {
            return ex.toString();
        }
    }
    /**
     * @Description: 根据 id 获取详情
     * @Param: user 类属性
     * @return:
     * @Author: miao
     * @Date: 2018/7/23
     */
    @GetMapping(value="/api/v1/test/detail/{id}")
    public Optional<User> findDetailById(@PathVariable("id") Long id){
        User user = new User();
        user.setId(id);
        Example<User> example = Example.of(user);
        return userDao.findOne(example);
    }


}
