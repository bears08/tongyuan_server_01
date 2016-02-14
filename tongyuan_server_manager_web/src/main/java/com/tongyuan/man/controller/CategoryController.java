package com.tongyuan.man.controller;

import com.tongyuan.core.domain.Category;
import com.tongyuan.core.domain.Product;
import com.tongyuan.core.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhangxh on 16-1-18.
 */
@Controller
public class CategoryController {

    @Resource
    @Qualifier("categoryService")
    private CategoryService categoryService;

    @RequestMapping("/category/list.do")
    public String list(HttpServletRequest request, HttpServletResponse response,Model model){
//        List<Product> productList = new ArrayList<Product>();
//        Product product = new Product();
//        product.setId(1234);
//        product.setName("醋溜白菜");
////        DecimalFormat decimalFormat = new DecimalFormat("0.00");
//        product.setPrice(12.20f);
//        product.setCategoryName("清湿清热");
//        product.setDetail("白菜得秋气最重，补肺，酸补肝.");
//        productList.add(product);
//        model.addAttribute(productList);
        List<Category> categoryList = new ArrayList<Category>();
        Category category = new Category();
        category.setId(876);
        category.setName("健胃补脾");
        category.setOperatorName("菲菲");
        categoryList.add(category);
        model.addAttribute(categoryList);
        return "category";
    }

    @ResponseBody
    @RequestMapping("/category/add.do")
    public String add(@RequestBody Category category ,HttpServletRequest request){
        if (category != null && category.getName() != null){
            System.out.println("--------------11111-----");
            categoryService.insert(category);
        }
        String name = request.getParameter("name");
        if(name != null){
            System.out.println("-------------22222---"+name);
        }
        Category c = new Category();
        c.setName("平肝补肝");
        c.setOperatorName("阎锡山");
        categoryService.insert(c);
        return "{'flag':'true'}";
    }


}
