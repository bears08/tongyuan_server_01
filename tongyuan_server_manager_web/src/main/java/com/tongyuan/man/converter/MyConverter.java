package com.tongyuan.man.converter;

import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;

import java.util.List;

/**
 * Created by zhangxh on 16-2-23.
 */
public class MyConverter extends MappingJackson2HttpMessageConverter {
//    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters){

    }
}
