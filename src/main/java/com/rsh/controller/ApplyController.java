package com.rsh.controller;

import com.rsh.service.ApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/apply")
public class ApplyController {
    private ApplyService applyService;

    @Autowired
    public void setApplyService(ApplyService applyService) {
        this.applyService = applyService;
    }

    @RequestMapping("/insert.do")
    @ResponseBody
    public String insert(@RequestParam String tid,
                         @RequestParam String sid) {
        return applyService.insert(Integer.parseInt(tid), sid);
    }

    @RequestMapping("/agree.do")
    @ResponseBody
    public String agree(@RequestParam String tid,
                        @RequestParam String sid){
        return applyService.agree(Integer.parseInt(tid), sid);
    }

    @RequestMapping("/refuse.do")
    @ResponseBody
    public String refuse(@RequestParam String tid,
                         @RequestParam String sid){
        return applyService.refuse(Integer.parseInt(tid), sid);
    }

    @RequestMapping("/confirm.do")
    @ResponseBody
    public String confirm(@RequestParam String tid,
                          @RequestParam String sid){
        return applyService.confirm(Integer.parseInt(tid), sid);
    }
}
