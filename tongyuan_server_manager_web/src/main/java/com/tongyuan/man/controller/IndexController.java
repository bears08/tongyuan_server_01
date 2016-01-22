package com.tongyuan.man.controller;

import com.tongyuan.core.service.HomeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zhangxh on 16-1-18.
 */
@Controller
public class IndexController {
//    @Resource
//    private HomeService homeService;

    @RequestMapping("/index.do")
    public String getUserAnalyse(HttpServletRequest request, HttpServletResponse response){
        return "index";
    }
}
