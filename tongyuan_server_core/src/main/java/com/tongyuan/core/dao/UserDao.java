package com.tongyuan.core.dao;

import com.tongyuan.core.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

/**
 * Created by zhangxh on 15-12-28.
 */
@Component
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    public int insert(User user){
        String sql = "insert into t_user (id,name) values('4','xiongxiong'); ";
        jdbcTemplate.execute(sql);
        return 0;
    }
}
