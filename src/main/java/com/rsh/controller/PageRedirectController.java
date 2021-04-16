package com.rsh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PageRedirectController {
    @GetMapping("/")
    public String index1() {
        return "login";
    }

    @GetMapping("/index")
    public String index2() {
        return "login";
    }

    @GetMapping("/logout")
    public String logOut(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("student") != null)
            session.removeAttribute("student");
        else if (session.getAttribute("teacher") != null)
            session.removeAttribute("teacher");
        return "login";
    }

    @GetMapping("/stu/{path}")
    public String redirectStu(@PathVariable String path, HttpServletRequest request){
        HttpSession session = request.getSession();
        if (session.getAttribute("student") == null){
            System.out.println("User Student does not sign in, redirect to the login page");
            return "redirect:/index";
        }
        System.out.println("redirect: /stu/" + path);
        return "/stu/" + path;
    }

    @GetMapping("/tea/{path}")
    public String redirectTea(@PathVariable String path, HttpServletRequest request){
        HttpSession session = request.getSession();
        if (session.getAttribute("teacher") == null){
            System.out.println("User Teacher does not sign in, redirect to the login page");
            return "redirect:/index";
        }
        System.out.println("redirect: /tea/" + path);
        return "/tea/" + path;
    }
}
