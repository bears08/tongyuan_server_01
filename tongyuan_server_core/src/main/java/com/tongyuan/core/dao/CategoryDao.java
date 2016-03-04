package com.tongyuan.core.dao;

import com.tongyuan.core.domain.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

  private String sql_update ="update ty_category  set category_name=?,category_level =?, " +
            "category_state=?,category_parent_id =?,category_parent_name=?,category_pic=?,category_pic_small=?," +
            "category_summary=?,category_detail=?,category_sold_start=?,category_sold_end=?,category_is_recommend=?," +
            "category_sort=?,operator_id=?,operator_name=?,update_date=now() where category_id=? ; ";

    private String sql_select_all = "select * from ty_category ";
    private String sql_select_all_on_sell = "select * from ty_category where category_state=1";
    @Resource
    private JdbcTemplate jdbcTemplate;
    private List<Category> list ;
    public int insert(final Category category){
//        DataSource dataSource = jdbcTemplate.getDataSource();
        jdbcTemplate.update(sql_insert, new Object[]{category.getName(), category.getLevel(), category.getState(),
                category.getParentId(), category.getParentName(), category.getPic(), category.getPicSmall(), category.getSummary(),
                category.getDetail(), category.getSoldStart(), category.getSoldEnd(), category.getIsRecommend(), category.getSort(),
                category.getOperatorId(), category.getOperatorName()
        });
        return 0;
    }
    public int update(final Category category){
//        System.out.println("update------------------"+category.getId());
        jdbcTemplate.update(sql_update, new Object[]{category.getName(), category.getLevel(), category.getState(),
                category.getParentId(), category.getParentName(), category.getPic(), category.getPicSmall(), category.getSummary(),
                category.getDetail(), category.getSoldStart(), category.getSoldEnd(), category.getIsRecommend(), category.getSort(),
                category.getOperatorId(), category.getOperatorName(), category.getId()
        });
        return 0;
    }

    public List<Category> selectAll(){
        list = new ArrayList<Category>();
        jdbcTemplate.query(sql_select_all, new RowCallbackHandler() {

            @Override
            public void processRow(ResultSet rs) throws SQLException {
                Category category = new Category();
                category.setId(rs.getInt("category_id"));
                category.setName(rs.getString("category_name"));
                category.setLevel(rs.getString("category_level"));
                category.setState(rs.getString("category_state"));
                category.setPic(rs.getString("category_pic"));
                category.setPicSmall(rs.getString("category_pic_small"));
                category.setSummary(rs.getString("category_summary"));
                category.setDetail(rs.getString("category_detail"));
                category.setSoldStart(rs.getTimestamp("category_sold_start"));
                category.setSoldEnd(rs.getTimestamp("category_sold_end"));
                category.setIsRecommend(rs.getInt("category_is_recommend"));
                category.setSort(rs.getInt("category_sort"));
                category.setOperatorId(rs.getInt("operator_id"));
                category.setOperatorName(rs.getString("operator_name"));
                category.setCreateDate(rs.getTimestamp("create_date"));
                category.setUpdateDate(rs.getTimestamp("update_date"));
                list.add(category);
            }
        });
        return list;
    }


    public List<Category> selectAllOnSell(){
        list = new ArrayList<Category>();
        jdbcTemplate.query(sql_select_all_on_sell, new RowCallbackHandler() {

            @Override
            public void processRow(ResultSet rs) throws SQLException {
                Category category = new Category();
                category.setId(rs.getInt("category_id"));
                category.setName(rs.getString("category_name"));
                category.setLevel(rs.getString("category_level"));
                category.setState(rs.getString("category_state"));
                category.setPic(rs.getString("category_pic"));
                category.setPicSmall(rs.getString("category_pic_small"));
                category.setSummary(rs.getString("category_summary"));
                category.setDetail(rs.getString("category_detail"));
                category.setSoldStart(rs.getTimestamp("category_sold_start"));
                category.setSoldEnd(rs.getTimestamp("category_sold_end"));
                category.setIsRecommend(rs.getInt("category_is_recommend"));
                category.setSort(rs.getInt("category_sort"));
                category.setOperatorId(rs.getInt("operator_id"));
                category.setOperatorName(rs.getString("operator_name"));
                category.setCreateDate(rs.getTimestamp("create_date"));
                category.setUpdateDate(rs.getTimestamp("update_date"));
                list.add(category);
            }
        });
        return list;
    }
}
