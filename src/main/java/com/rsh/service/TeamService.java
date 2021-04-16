package com.rsh.service;

import com.rsh.mapper.EasyOpmMapper;
import com.rsh.mapper.StuTeamMapper;
import com.rsh.model.Student;
import com.rsh.model.Team;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TeamService {
    private final StuTeamMapper stuTeamMapper = EasyOpmMapper.getStuTeamMapper();

    public String deleteGps(int tid, String captain_id) {
        List<Student> allMembers = stuTeamMapper.queryAllMembers(tid);
        for (Student stu : allMembers) {
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("TID", tid);
            paramMap.put("SID", stu.getStuID());
            if (stuTeamMapper.removeStuFromTeam(paramMap))
                System.out.println("Remove member[" + stu.getStuID() + "] from team[" + tid + "] successfully");
            else return "fail";
        }

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("TID", tid);
        paramMap.put("SID", captain_id);
        if (stuTeamMapper.removeStuFromTeam(paramMap))
            System.out.println("Remove captain[" + captain_id + "] from team[" + tid + "] successfully");
        else return "fail";

        return stuTeamMapper.deleteTeamInfo(tid) ? "success" : "fail";
    }

    public String removeMember(int tid, String sid) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("TID", tid);
        paramMap.put("SID", sid);
        if (stuTeamMapper.removeStuFromTeam(paramMap))
            System.out.println("Remove member[" + sid + "] from team[" + tid + "] successfully");
        else return "fail";

        paramMap.clear();
        paramMap.put("TID", tid);
        paramMap.put("ACT", 1);     // increase the vacant position

        return stuTeamMapper.updateVacantPos(paramMap) ? "success" : "fail_to_update_stu_pos";
    }

    public String transferLeader(int tid, String newCaptainId, String oldCaptainId) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("TID", tid);
        paramMap.put("SID", newCaptainId);
        paramMap.put("Pos", false);

        paramMap.clear();
        paramMap.put("TID", tid);
        paramMap.put("Captain_ID", newCaptainId);
        if (!stuTeamMapper.updateCaptain(paramMap))
            return "fail";

        if (stuTeamMapper.updateStuPos(paramMap)) {
            paramMap.clear();
            paramMap.put("TID", tid);
            paramMap.put("SID", oldCaptainId);
            paramMap.put("Pos", true);
            return stuTeamMapper.updateStuPos(paramMap) ? "success" : "fail";
        } else return "fail";
    }

    public String checkTeamName(String teamName){
        Team team = stuTeamMapper.queryTeamByName(teamName);
        return team == null ? "true" : "false";
    }

    public String createTeam(String teamName, int cid, String captain_id, int vacantPos){
        Team team = new Team();
        team.setCaptainID(captain_id);
        team.setCID(cid);
        team.setTName(teamName);
        team.setVacantPos(vacantPos);
        if (!stuTeamMapper.addTeam(team))
            return "fail";

        // set captain
        Map<String, Object> paramMap = new HashMap<>();
        int tid = stuTeamMapper.queryTeamByName(teamName).getTID();
        paramMap.put("TID", tid);
        paramMap.put("SID", captain_id);
        paramMap.put("POS", false);
        if (!stuTeamMapper.insertStuToTeam(paramMap))
            return "fail";

        paramMap.clear();
        paramMap.put("TID", tid);
        paramMap.put("ACT", -1);     // decrease the vacant position

        return stuTeamMapper.updateVacantPos(paramMap) ? "success" : "fail_to_update_stu_pos";
    }
}
