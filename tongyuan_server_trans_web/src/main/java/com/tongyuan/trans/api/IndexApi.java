package com.tongyuan.trans.api;

import com.tongyuan.core.service.HomeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zhangxh on 15-12-28.
 */
@ResponseBody
@Controller
public class IndexApi {
    @Resource
    private HomeService homeService;

    @RequestMapping("/index.api")
    public String getUserAnalyse(HttpServletRequest request, HttpServletResponse response){
        System.out.println("index.api------------------------------------");
        homeService.doService();
        return "index.api";
    }

}
