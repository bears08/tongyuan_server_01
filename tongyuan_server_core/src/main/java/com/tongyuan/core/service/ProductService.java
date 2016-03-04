package com.tongyuan.core.service;

import com.tongyuan.core.dao.CategoryDao;
import com.tongyuan.core.dao.ProductDao;
import com.tongyuan.core.domain.Category;
import com.tongyuan.core.domain.Product;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hanfei on 16/1/30.
 */
@Service
public class ProductService {
    @Resource
    private ProductDao productDao;

//    @Resource
//    private CategoryDao categoryDao;

    public int insert(Product product){
        productDao.insert(product);
        return 0;
    }
    public int update(Product product){
        productDao.update(product);
        return 0;
    }

    public List<Product> selectAll(){
        return productDao.selectAll();
    }

//    public List<Product> selectAllOnSell(){
//        return productDao.selectAllOnSell();
//    }


}
