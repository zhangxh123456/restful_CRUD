package com.dj.ssm.web;

import com.dj.ssm.pojo.User;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserPageController {

    @Autowired
    private UserService userService;

    /**
     * 去注册
     * @return
     */
    @RequestMapping("/toRegister")
    public String toRegister(){
        return "/register";
    }

    /**
     * 去登陆
     * @return
     */
    @RequestMapping("/toLogin")
    public ModelAndView toLogin(String userName, ModelAndView model){
        model.addObject("userName", userName);
        model.setViewName("/login");
        return model;
    }

    /**
     * 去展示
     * @return
     */
    @RequestMapping("/toShow")
    public String toShow(){
        return "/show";
    }

    /**
     * 去修改
     * @return
     */
    @RequestMapping("/toUpdate")
    public String toUpdate(Integer id, Map map){

        User user = userService.getById(id);
        map.put("user", user);

        return "/update";
    }

}
