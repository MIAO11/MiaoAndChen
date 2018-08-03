package com.example.demo1.controller;

import com.example.demo1.domain.User;
import com.example.demo1.repostitory.UserDao;
import com.example.demo1.util.ExcelTool;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiImplicitParams;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Api(value = "用户管理API",description="用户管理")
@RestController
public class HelloController {
    @Autowired
    UserDao userDao;

    @ApiOperation(value = "创建用户", notes = "创建用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "email", value = "用户邮箱", required = true, dataType = "String"),
            @ApiImplicitParam(name = "name", value = "用户姓名", required = true, dataType = "String"),
    })
    @PostMapping(value = "/api/v1/test/addUser")
    public String saveOne(@RequestParam("name") String name, @RequestParam("email") String email) {
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
    @ApiOperation(value = "获取用户列表", notes = "获取用户列表")
    @GetMapping(value = "/api/v1/test/userList")
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
    @ApiOperation(value = "删除用户", notes = "根据url的id来指定删除用户")
    @ApiImplicitParam(name = "id", value = "用户ID", required = true, dataType = "Long", paramType = "path")
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
    @ApiOperation(value = "更新信息", notes = "根据url的id来指定更新用户信息")
    @ApiImplicitParam(name = "id", value = "用户ID", required = true, dataType = "Long")
    @PutMapping(value = "/api/v1/test/update")
    public String update(@RequestParam("id") Integer id,
                         @RequestParam("email") String email,
                         @RequestParam("name") String name) {
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
    @ApiOperation(value = "获取用户详情", notes = "根据url的id来获取指定用户详情")
    @ApiImplicitParam(name = "id", value = "用户ID", required = true, dataType = "Long", paramType = "path")
    @GetMapping(value = "/api/v1/test/detail/{id}")
    public Optional<User> findDetailById(@PathVariable("id") Long id) {
        User user = new User();
        user.setId(id);
        Example<User> example = Example.of(user);
        return userDao.findOne(example);
    }

    @ApiOperation(value = "获取商品列表", notes = "获取商品列表")
    @ApiImplicitParam()
    @GetMapping(value = "/api/v1/test/getSpList")
    public List getSpList() {
        List list=new ArrayList();
        File f1 = new File("20180803.xls");
        try {
            list= ExcelTool.readExcel(f1);
            System.out.println(ExcelTool.readExcel(f1));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InvalidFormatException e) {
            e.printStackTrace();
        }
        return list;
    }


}
