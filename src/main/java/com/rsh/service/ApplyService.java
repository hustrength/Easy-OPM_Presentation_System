package com.rsh.service;

import com.rsh.mapper.ApplyMapper;
import com.rsh.mapper.EasyOpmMapper;
import com.rsh.model.Apply;
import com.rsh.model.Student;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service("applyService")
public class ApplyService {
    private final ApplyMapper applyMapper = EasyOpmMapper.getApplyMapper();

    public String insert(Student applicant, int tid, String sid){
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("TID", tid);
        paramMap.put("ApplicantID", applicant.getStuID());
        if (applyMapper.isApplied(paramMap) != 0){
            return "applied";
        }

        Apply apply = new Apply(sid, tid, 0);
        return applyMapper.insertOne(apply)? "success" : "fail";
    }
}
