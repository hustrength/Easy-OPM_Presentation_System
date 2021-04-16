package com.rsh.service;

import com.rsh.mapper.CompetitionMapper;
import com.rsh.mapper.EasyOpmMapper;
import com.rsh.model.Competition;
import org.springframework.stereotype.Service;

@Service
public class CompetitionService {
    private final CompetitionMapper competitionMapper = EasyOpmMapper.getCompetitionMapper();

    public String release(String tid, String CName, String CIntro) {
        Competition competition = new Competition();
        competition.setCName(CName);
        competition.setIntroduction(CIntro);
        competition.setPublisher(tid);

        return competitionMapper.insert(competition) ? "success" : "fail";
    }

    public String update(int cid, String CName, String CIntro){
        Competition competition = new Competition();
        competition.setCName(CName);
        competition.setIntroduction(CIntro);
        competition.setCID(cid);

        return competitionMapper.update(competition) ? "success" : "fail";
    }

    public String delete(int cid){
        return competitionMapper.deleteCompetition(cid) ? "success" : "fail";
    }
}
