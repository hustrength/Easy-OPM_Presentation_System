package com.rsh.service;

import com.rsh.mapper.EasyOpmMapper;
import com.rsh.mapper.StuMapper;
import com.rsh.mapper.TeaMapper;
import com.rsh.model.Student;
import com.rsh.model.Teacher;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class UserService {
    private final StuMapper stuMapper = EasyOpmMapper.getStuMapper();
    private final TeaMapper teaMapper = EasyOpmMapper.getTeaMapper();

    public String changePassword(HttpSession session, String newPassword){
        Student stu = (Student) session.getAttribute("student");
        if (stu != null) {
            stu.setPassword(newPassword);
            return stuMapper.updateOne(stu) ? "success" : "fail";
        } else {
            Teacher tea = (Teacher) session.getAttribute("teacher");
            if (tea != null){
                tea.setPassword(newPassword);
                return teaMapper.updateOne(tea) ? "success" : "fail";
            }else return "fail";
        }
    }
}
