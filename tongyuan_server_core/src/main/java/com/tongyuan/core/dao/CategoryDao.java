package com.tongyuan.core.dao;

import com.tongyuan.core.domain.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hanfei on 16/1/30.
 */
@Component
public class CategoryDao {
    private String sql_insert ="insert into ty_category(category_name,category_level, " +
            "category_state,category_parent_id,category_parent_name,category_pic,category_pic_small," +
            "category_summary,category_detail,category_sold_start,category_sold_end,category_is_recommend," +
            "category_sort,operator_id,operator_name,create_date,update_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),now()); ";
    @Resource
    private JdbcTemplate jdbcTemplate;

    public int insert(final Category category){
        jdbcTemplate.update(sql_insert,new Object[]{category.getName(),category.getLevel(),category.getState(),
                category.getParentId(),category.getParentName(),category.getPic(),category.getPicSmall(),category.getSummary(),
                category.getDetail(),category.getSoldStart(),category.getSoldEnd(),category.getIsRecommend(),category.getSort(),
                category.getOperatorId(),category.getOperatorName()
        });
        return 0;
    }

    public List<Category> selectAll(){
//        jdbcTemplate.queryForList()
        return null;
    }
}
