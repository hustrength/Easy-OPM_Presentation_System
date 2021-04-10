package com.rsh.service;

import com.rsh.mapper.EasyOpmMapper;
import com.rsh.mapper.StuMapper;
import com.rsh.mapper.TeaMapper;
import com.rsh.model.Student;
import com.rsh.model.Teacher;
import org.springframework.stereotype.Service;


@Service("registerService")
public class RegisterService {
    private final StuMapper stuMapper = EasyOpmMapper.getStuMapper();
    private final TeaMapper teaMapper = EasyOpmMapper.getTeaMapper();

    public String checkUserId(String userId, String signUpCode) {
        if (signUpCode.isEmpty()) {
            Student stu = stuMapper.queryById(userId);
            return stu == null ? "true" : "false";
        } else {
            Teacher tea = teaMapper.queryById(userId);
            return tea == null ? "true" : "false";
        }
    }

    public String signUp(String userId, String password, String username, boolean sex, String signUpCode) {
        if (signUpCode.isEmpty()) {

            Student student = new Student(userId, password, sex, username);

            boolean rs = stuMapper.insertOne(student);
            return rs ? "success" : "fail";
        } else {                            //教师注册
            if (!"N88".equals(signUpCode)) {
                return "error_code";
            }

            Teacher teacher = new Teacher(userId, password, username);

            boolean rs = teaMapper.insertOne(teacher);
            return rs ? "success" : "fail";
        }
    }

    public String signIn(String userId, String password, String status){
        if (status.equals("stu")){
            Student stu = stuMapper.queryById(userId);
            if (stu != null && password.equals(stu.getPassword()))
                return "success";
        }else {
            Teacher tea = teaMapper.queryById(userId);
            if (tea != null && password.equals(tea.getPassword()))
                return "success";
        }
        return "fail";
    }
}
