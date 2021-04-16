package com.rsh.controller;

import com.rsh.model.Student;
import com.rsh.service.ApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/apply")
public class ApplyController {
    private ApplyService applyService;

    @Autowired
    public void setApplyService(ApplyService applyService) {
        this.applyService = applyService;
    }

    @RequestMapping("insertApply.do")
    @ResponseBody
    public String insertApply(@RequestParam int tid,
                              @RequestParam String sid,
                              HttpServletRequest request) {
        HttpSession session = request.getSession();
        Student applicant = (Student) session.getAttribute("student");
        return applyService.insert(applicant, tid, sid);
    }
}
