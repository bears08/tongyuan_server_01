package com.tongyuan.man.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zhangxh on 16-1-18.
 */
@Controller
public class CompanyController {
//    @Resource
//    private HomeService homeService;

    @RequestMapping("/company/store.do")
    public String store(HttpServletRequest request, HttpServletResponse response){
        return "store";
    }
    @RequestMapping("/company/merchant.do")
    public String merchant(HttpServletRequest request, HttpServletResponse response){
        return "merchant";
    }
}
