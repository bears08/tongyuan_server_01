package com.tongyuan.core.service;

import com.tongyuan.core.dao.CategoryDao;
import com.tongyuan.core.domain.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hanfei on 16/1/30.
 */
@Service
public class CategoryService {
    @Resource
    private CategoryDao categoryDao;

    public int insert(Category category){
        categoryDao.insert(category);
        return 0;
    }

    public List<Category> selectAll(){
//        categoryDao.
        return null;
    }
}
