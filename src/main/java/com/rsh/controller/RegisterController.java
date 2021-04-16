package com.rsh.controller;

import com.rsh.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/register")
public class RegisterController {
    private RegisterService registerService;

    @Autowired
    public void setRegisterService(RegisterService registerService) {
        this.registerService = registerService;
    }

    @RequestMapping(value = "/checkIdRepeat.do")
    @ResponseBody
    public String checkUserId(@RequestParam String userId,
                            @RequestParam String signUpCode){
//        System.out.println("check user id in controller");

        return registerService.checkUserId(userId, signUpCode);
    }

    @RequestMapping(value = "/signUp.do")
    @ResponseBody
    public String signUp(@RequestParam Map<String, String> paramMap){
//        System.out.println("sign up in controller");

        String userid = paramMap.get("userid");
        String password = paramMap.get("password");
        String username = paramMap.get("username");
        boolean sex = paramMap.get("sex").equals("男");
        String signup_code = paramMap.get("signup_code");

        return registerService.signUp(userid, password, username, sex, signup_code);
    }

    @RequestMapping(value = "/logIn.do")
    @ResponseBody
    public String signIn(@RequestParam Map<String, String> paramMap, HttpServletRequest request){
//        System.out.println("sign in in controller");

        String userid = paramMap.get("userid");
        String password = paramMap.get("password");
        String status = paramMap.get("status");

        HttpSession session = request.getSession();
        return registerService.signIn(session, userid, password, status);
    }
}


