package com.tongyuan.core.service;

import com.tongyuan.core.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by zhangxh on 15-12-28.
 */
@Service
public class HomeService {
    @Autowired
    private UserDao userDao;

    public void doService(){
        userDao.insert(null);
    }
}
