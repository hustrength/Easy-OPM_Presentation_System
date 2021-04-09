package com.rsh.service;

import com.rsh.mapper.StuMapper;
import com.rsh.mapper.TeaMapper;
import com.rsh.model.Student;
import com.rsh.model.Teacher;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;


@Service("registerService")
public class RegisterService {
    private final ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-beans.xml");
    private final StuMapper stuMapper = (StuMapper) applicationContext.getBean("stuMapper");
    private final TeaMapper teaMapper = (TeaMapper) applicationContext.getBean("teaMapper");

    public String checkUserId(String userId, String signUpCode) {
        if (signUpCode.isEmpty()) {
            Student stu = stuMapper.queryById(userId);
            return stu == null ? "true" : "false";
        } else {
            Teacher tea = teaMapper.queryById(userId);
            return tea == null ? "true" : "false";
        }
    }

    public String signUp(String id, String password, String username, boolean sex, String signUpCode) {
        if (signUpCode.isEmpty()) {

            Student student = new Student(id, password, sex, username);

            boolean rs = stuMapper.insertOne(student);
            return rs ? "success" : "fail";
        } else {                            //教师注册
            if (!"N88".equals(signUpCode)) {
                return "error_code";
            }

            Teacher teacher = new Teacher(id, password, username);

            boolean rs = teaMapper.insertOne(teacher);
            return rs ? "success" : "fail";
        }
    }
}
