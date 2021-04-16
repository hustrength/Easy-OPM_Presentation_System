package com.rsh.service;

import com.rsh.mapper.ApplyMapper;
import com.rsh.mapper.EasyOpmMapper;
import com.rsh.mapper.StuTeamMapper;
import com.rsh.model.Apply;
import com.rsh.model.Student;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ApplyService {
    private final ApplyMapper applyMapper = EasyOpmMapper.getApplyMapper();
    private final StuTeamMapper stuTeamMapper = EasyOpmMapper.getStuTeamMapper();

    public String insert(Student applicant, int tid, String sid) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("TID", tid);
        paramMap.put("ApplicantID", applicant.getStuID());
        Integer applyStatus = applyMapper.isApplied(paramMap);
        if (applyStatus != null && applyStatus != 0) {
            return "applied";
        }

        Apply apply = new Apply(sid, tid, 0);
        return applyMapper.insertOne(apply) ? "success" : "fail";
    }

    public String agree(int tid, String sid) {
        if (stuTeamMapper.isVacant(tid) == 0)
            return "full";

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("TID", tid);
        paramMap.put("ACT", -1);     // decrease the vacant position
        if (!stuTeamMapper.updateVacantPos(paramMap))
            return "fail";

        paramMap.clear();
        paramMap.put("TID", tid);
        paramMap.put("SID", sid);
        paramMap.put("POS", true);
        if (!stuTeamMapper.insertStuToTeam(paramMap))
            return "fail";

        paramMap.clear();
        paramMap.put("TID", tid);
        paramMap.put("NewStatus", 1);
        paramMap.put("ApplicantID", sid);
        if (!applyMapper.updateApplyStatus(paramMap))
            return "fail";

        return "success";
    }

    public String refuse(int tid, String sid) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("TID", tid);
        paramMap.put("NewStatus", 2);
        paramMap.put("ApplicantID", sid);
        return applyMapper.updateApplyStatus(paramMap) ? "success" : "fail";
    }

    public String confirm(int tid, String sid) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("TID", tid);
        paramMap.put("ApplicantID", sid);
        return applyMapper.deleteApply(paramMap) ? "success" : null;
    }
}
