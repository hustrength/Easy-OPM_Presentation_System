package com.rsh.controller;

import com.rsh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/changePassword.do")
    @ResponseBody
    public String changePassword(@RequestParam String newPassword, HttpServletRequest request) {
        HttpSession session = request.getSession();
        return userService.changePassword(session, newPassword);
    }
}
