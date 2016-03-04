package com.tongyuan.man.controller;

import com.tongyuan.core.domain.Category;
import com.tongyuan.core.domain.Product;
import com.tongyuan.core.service.CategoryService;
import com.tongyuan.man.dto.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @Resource(name = "categoryService")
    private CategoryService categoryService;

    @RequestMapping(value = "/category/list.do")
    public String list(HttpServletRequest request, HttpServletResponse response,Model model){
        System.out.println("-----------suansuan-------------------");
        List<Category> categoryList = categoryService.selectAll();
        model.addAttribute(categoryList);
        return "category";
    }


    @RequestMapping(value = "/category/add.do",method = RequestMethod.POST)
    public @ResponseBody Result add(@RequestBody Category category ,HttpServletRequest request){
        if (category != null && category.getName() != null){
            categoryService.insert(category);
        }
        Result result= new Result();
        result.setFlag(true);
        result.setMsg("添加成功");
        return result;
    }
    @RequestMapping(value = "/category/update.do",method = RequestMethod.POST)
    public @ResponseBody Result update(@RequestBody Category category ,HttpServletRequest request){
        if (category != null && category.getName() != null){
            categoryService.update(category);
        }
        Result result= new Result();
        result.setFlag(true);
        result.setMsg("更新成功");
        return result;
    }


}
