package com.example.demo1.controller;

import com.example.demo1.domain.User;
import com.example.demo1.repostitory.UserDao;
import com.example.demo1.util.SortTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import springfox.documentation.annotations.ApiIgnore;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller
public class PageController {
    @Autowired
    UserDao userDao;

    @ApiIgnore//使用该注解忽略这个API
    @RequestMapping("/home")
    public String hello(Map<String,Object> map){
        User user = new User("miao","2");
        map.put("user",user);
        List<User> userslist = new ArrayList<>();
        userslist=userDao.findAll(SortTools.basicSort());
        map.put("userList",userslist);
        return "home";
    }
}
