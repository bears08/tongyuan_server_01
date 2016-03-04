package com.tongyuan.man.controller;

import com.tongyuan.core.domain.Category;
import com.tongyuan.core.domain.Product;
import com.tongyuan.core.service.CategoryService;
import com.tongyuan.core.service.ProductService;
import com.tongyuan.man.dto.Result;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhangxh on 16-1-18.
 */
@Controller
public class ProductController {
    @Resource
    private ProductService productService;

    @Resource
    private CategoryService categoryService;

    @RequestMapping("/product/list.do")
    public String list(HttpServletRequest request, HttpServletResponse response,Model model){

        List<Product> productList = productService.selectAll();
////                new ArrayList<Product>();
//        Product product = new Product();
//        product.setId(1234);
//        product.setName("醋溜白菜");
////        DecimalFormat decimalFormat = new DecimalFormat("0.00");
//        product.setPrice(12.20f);
//        product.setCategoryName("清湿清热");
//        product.setDetail("白菜得秋气最重，补肺，酸补肝.");
//        productList.add(product);
        model.addAttribute(productList);
        List<Category> categoryList = categoryService.selectAll();
        model.addAttribute(categoryList);

        return "product";
    }

    @ResponseBody
    @RequestMapping("/product/add.do")
    public Result add(@RequestBody Product product, HttpServletRequest request, HttpServletResponse response,Model model){
        if (product != null && product.getName() != null){
            productService.insert(product);
        }
        Result result= new Result();
        result.setFlag(true);
        result.setMsg("添加成功");
        return result;
    }

    @ResponseBody
    @RequestMapping("/product/update.do")
    public Result update(@RequestBody Product product, HttpServletRequest request, HttpServletResponse response,Model model){
        if (product != null && product.getName() != null){
            productService.update(product);
        }
        Result result= new Result();
        result.setFlag(true);
        result.setMsg("添加成功");
        return result;
    }


}
