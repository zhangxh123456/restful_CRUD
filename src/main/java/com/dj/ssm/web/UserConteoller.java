package com.dj.ssm.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserQuery;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/users")
public class UserConteoller {

    @Autowired
    private UserService userService;

    /**
     * 注册信息   添加
     * @param user
     * @return
     */
    @PostMapping
    public ResultModel registerUser(User user){
        try {
            user.setCreateTime(new Date());
            userService.save(user);
            return new ResultModel().success(user);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }

    }

    /**
     * 登陆   查询
     * @param userName
     * @param userPwd
     * @return
     */
    @PostMapping("/list")
    @CrossOrigin
    public ResultModel getUser(String userName, String userPwd){
        try {
            QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
            queryWrapper.eq("user_name", userName);
            queryWrapper.eq("user_pwd", userPwd);
            User user = userService.getOne(queryWrapper);
            return new ResultModel().success(user);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }

    }


    /**
     * 展示   条件查询    分页
     * @param userQuery
     * @return
     */

    @PostMapping("/list2")
    public ResultModel showUser(UserQuery userQuery){
            try {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            if (!StringUtils.isEmpty(userQuery.getUserName())){
                queryWrapper.like("user_name", userQuery.getUserName());
            }
            if (null != userQuery.getStartAge() ){
                queryWrapper.ge("user_age", userQuery.getStartAge());
            }
            if (null != userQuery.getEndAge() ){
                queryWrapper.le("user_age", userQuery.getEndAge());
            }
            if (null != userQuery.getUserSex() && !userQuery.getUserSex().isEmpty() ){
            queryWrapper.in("user_sex", userQuery.getUserSex());
            }
            List<User> list = userService.list(queryWrapper);
            return new ResultModel().success(list);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }



    /**
     * 通过id进行删除
     * @param id
     * @return
     */
    @DeleteMapping
    public ResultModel delete(Integer id){
        try {
            userService.removeById(id);
            return new ResultModel().success(id);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 通过id查询
     * @param id
     * @return
     */
    @GetMapping
    public ResultModel get(Integer id){
        try {
            User user = userService.getById(id);
            return new ResultModel().success(user);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }


    /**
     * 通过id进行修改
     * @param user
     * @return
     */
    @PutMapping
    public ResultModel update(User user){
        try {
            userService.updateById(user);
            return new ResultModel().success(user);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 跳转页面携带参数
     * @param params
     * @return
     */
    @PostMapping("/list03")
    public ResultModel getUser(@RequestParam Map<String, String> params){
        try {



            QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
            queryWrapper.eq("user_name", params.get("userName"));
            queryWrapper.eq("user_pwd", params.get("userPwd"));
            User user = userService.getOne(queryWrapper);
            return new ResultModel().success(user);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }

    }

}
