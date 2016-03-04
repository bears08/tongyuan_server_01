package com.tongyuan.core.dao;

import com.tongyuan.core.domain.Product;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hanfei on 16/1/30.
 */
@Component
public class ProductDao {

    private String sql_insert ="insert into ty_product(product_name,product_price,product_discount, " +
            "product_state,product_num,product_category_id,product_category_name,product_unit," +
            "product_pic,product_pic_small,product_element,product_function," +
            "product_summary,product_detail,product_sold_start,product_sold_end," +
            "product_is_reserve,product_is_recommend," +
            "product_sort,operator_id,operator_name,create_date,update_date)" +
            " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),now()); ";

  private String sql_update ="update ty_product  set product_name=?,product_price=?,product_discount =?, " +
            "product_state=?,product_num =?,product_category_id =?,product_category_name=?," +
          "product_unit=?,product_pic=?,product_pic_small=?,product_element=?,product_function=?," +
            "product_summary=?,product_detail=?,product_sold_start=?,product_sold_end=?," +
          "product_is_reserve = ? ,product_is_recommend=?," +
            "product_sort=?,operator_id=?,operator_name=?,update_date=now() where product_id=? ; ";

    private String sql_select_all = "select * from ty_product ";
    private String sql_select_all_on_sell = "select * from ty_product where product_state=1";
    @Resource
    private JdbcTemplate jdbcTemplate;
    private List<Product> list ;
    public int insert(final Product product){
        jdbcTemplate.update(sql_insert, new Object[]{product.getName(), product.getPrice(), product.getDiscount(),
                product.getState(),
                product.getNum(), product.getCategoryId(), product.getCategoryName(),product.getUnit(),
                product.getPic(), product.getPicSmall(), product.getElement(),product.getFunction(),
                product.getSummary(),product.getDetail(), product.getSoldStart(), product.getSoldEnd(), product.getIsReserve(),
                product.getIsRecommend(), product.getSort(),
                product.getOperatorId(), product.getOperatorName()
        });
        return 0;
    }
    public int update(final Product product){
        jdbcTemplate.update(sql_update, new Object[]{product.getName(), product.getPrice(), product.getDiscount(),
                product.getState(),
                product.getNum(), product.getCategoryId(), product.getCategoryName(),product.getUnit(),
                product.getPic(), product.getPicSmall(), product.getElement(),product.getFunction(),
                product.getSummary(),product.getDetail(), product.getSoldStart(), product.getSoldEnd(), product.getIsReserve(),
                product.getIsRecommend(), product.getSort(),
                product.getOperatorId(), product.getOperatorName(),product.getId()
        });
        return 0;
    }

    public List<Product> selectAll(){
        list = new ArrayList<Product>();
        jdbcTemplate.query(sql_select_all, new RowCallbackHandler() {

            @Override
            public void processRow(ResultSet rs) throws SQLException {
                Product product = new Product();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));
                product.setPrice(rs.getFloat("product_price"));
                product.setDiscount(rs.getFloat("product_discount"));
                product.setState(rs.getString("product_state"));
                product.setNum(rs.getInt("product_num"));
                product.setScore(rs.getInt("product_score"));
                product.setCategoryId(rs.getInt("product_category_id"));
                product.setCategoryName(rs.getString("product_category_name"));
                product.setUnit(rs.getString("product_unit"));
                product.setPic(rs.getString("product_pic"));
                product.setPicSmall(rs.getString("product_pic_small"));
                product.setElement(rs.getString("product_element"));
                product.setFunction(rs.getString("product_function"));
                product.setSummary(rs.getString("product_summary"));
                product.setDetail(rs.getString("product_detail"));
                product.setSoldStart(rs.getTimestamp("product_sold_start"));
                product.setSoldEnd(rs.getTimestamp("product_sold_end"));
                product.setIsReserve(rs.getInt("product_is_reserve"));
                product.setIsRecommend(rs.getInt("product_is_recommend"));
                product.setSort(rs.getInt("product_sort"));
                product.setOperatorId(rs.getInt("operator_id"));
                product.setOperatorName(rs.getString("operator_name"));
                product.setCreateDate(rs.getTimestamp("create_date"));
                product.setUpdateDate(rs.getTimestamp("update_date"));
                list.add(product);
            }
        });
        return list;
    }

}
