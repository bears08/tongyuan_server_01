package com.tongyuan.man.controller;

import com.tongyuan.core.domain.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhangxh on 16-1-18.
 */
@Controller
public class ProductController {
//    @Resource
//    private HomeService homeService;

    @RequestMapping("/product/list.do")
    public String list(HttpServletRequest request, HttpServletResponse response,Model model){
        List<Product> productList = new ArrayList<Product>();
        Product product = new Product();
        productList.add(product);
        product.setId(1234);
        product.setName("醋溜白菜");
        product.setPrice(new BigDecimal(12.20));
        product.setCategoryName("清湿清热");
        product.setDetail("白菜得秋气最重，补肺，酸补肝.");
        return "product";
    }

    @ResponseBody
    @RequestMapping("/product/add.do")
    public String add(HttpServletRequest request, HttpServletResponse response,Model model){
        return "{'flag':'true'}";
    }


}
