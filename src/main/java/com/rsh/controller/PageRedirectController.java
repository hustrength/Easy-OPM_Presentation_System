package com.rsh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class PageRedirectController {
    @GetMapping("/")
    public String index() {
        return "login";
    }

    @GetMapping("/redirect/{path1}/{path2}")
    public String redirect(@PathVariable String path1, @PathVariable String path2) {
        System.out.println("!!!");
        return path1 + '/' + path2;
    }
}
