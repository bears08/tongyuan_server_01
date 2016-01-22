package com.tongyuan.trans.controller;

import com.tongyuan.core.service.HomeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zhangxh on 15-12-28.
 */
@Controller
public class FinishController {
    @Resource
    private HomeService homeService;

    @RequestMapping("/finish.do")
    public String getUserAnalyse(HttpServletRequest request, HttpServletResponse response){
        return "finish";
    }

}
