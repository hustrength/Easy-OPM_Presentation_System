package com.rsh.controller;

import com.rsh.model.Student;
import com.rsh.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/team")
public class TeamController {
    private TeamService teamService;

    @Autowired
    public void setTeamService(TeamService teamService) {
        this.teamService = teamService;
    }

    @RequestMapping("/deleteGps.do")
    @ResponseBody
    public String deleteGps(@RequestParam String tid,
                            @RequestParam String captain_id) {
        return teamService.deleteGps(Integer.parseInt(tid), captain_id);
    }

    @RequestMapping("/removeMember.do")
    @ResponseBody
    public String removeMember(@RequestParam String tid,
                               @RequestParam String sid) {
        return teamService.removeMember(Integer.parseInt(tid), sid);
    }

    @RequestMapping("/transferLeader.do")
    @ResponseBody
    public String transferLeader(@RequestParam String tid,
                                 @RequestParam String newCaptainId,
                                 @RequestParam String oldCaptainId) {
        return teamService.transferLeader(Integer.parseInt(tid), newCaptainId, oldCaptainId);
    }

    @RequestMapping("/quitTeam.do")
    @ResponseBody
    public String quitTeam(@RequestParam String tid,
                           @RequestParam String sid){
        return teamService.removeMember(Integer.parseInt(tid), sid);
    }

    @RequestMapping("/checkTeamName.do")
    @ResponseBody
    public String checkTeamName(@RequestParam String teamName){
        return teamService.checkTeamName(teamName);
    }

    @RequestMapping("/createTeam.do")
    @ResponseBody
    public String createTeam(@RequestParam Map<String, String> paramMap, HttpServletRequest request){
        String teamName = paramMap.get("teamName");
        int cid = Integer.parseInt(paramMap.get("cid"));
        int vacantPos = Integer.parseInt(paramMap.get("vacantPos"));
        HttpSession session = request.getSession();
        Student captain = (Student) session.getAttribute("student");

        return teamService.createTeam(teamName, cid, captain.getStuID(), vacantPos);
    }
}
