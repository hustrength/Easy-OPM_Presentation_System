package com.rsh.controller;

import com.rsh.model.Teacher;
import com.rsh.service.CompetitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/competition")
public class CompetitionController {
    private CompetitionService competitionService;

    @Autowired
    public void setCompetitionService(CompetitionService competitionService) {
        this.competitionService = competitionService;
    }

    @RequestMapping("/release.do")
    @ResponseBody
    public String release(@RequestParam Map<String, String> paramMap, HttpServletRequest request){
        String cName = paramMap.get("CName");
        String cIntro = paramMap.get("CIntro");

        HttpSession session = request.getSession();
        Teacher tea = (Teacher) session.getAttribute("teacher");

        return competitionService.release(tea.getTeaID(), cName, cIntro);
    }

    @RequestMapping("/update.do")
    @ResponseBody
    public String update(@RequestParam String CName,
                         @RequestParam String CIntro,
                         @RequestParam String CID){
        return competitionService.update(Integer.parseInt(CID), CName, CIntro);
    }

    @RequestMapping("/delete.do")
    @ResponseBody
    public String delete(@RequestParam String CID){
        return competitionService.delete(Integer.parseInt(CID));
    }
}
