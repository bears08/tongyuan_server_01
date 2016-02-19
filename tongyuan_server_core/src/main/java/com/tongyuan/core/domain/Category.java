package com.tongyuan.core.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by hanfei on 16/1/26.
 * CREATE TABLE IF NOT EXISTS `ty_category` (
 `category_id` int(12)  AUTO_INCREMENT,
 `category_name` varchar(500)  COMMENT '商品名称',
 `category_state` varchar(32)  COMMENT '状态,上架在售,售罄,下架',
 `category_score` int(12)  COMMENT '商品分类评分',
 `category_parent_id` int(12)  COMMENT '商品分类父ID',
 `category_parent_name` varchar(50)  COMMENT '商品分类父名称',
 `category_pic` varchar(200)  COMMENT '图片',
 `category_pic_small` varchar(200)  COMMENT '小图',
 `category_summary` varchar(500)  COMMENT '分类简介',
 --  产品详情页是否做成article
 `category_detail` varchar(500)  COMMENT '分类详情',
 `category_sold_start` datetime  COMMENT '开始出售时间',
 `category_sold_end` datetime  COMMENT '停止出售时间',
 --  产品上架地区或店铺
 `category_is_recommend` int(12) default '0' COMMENT '是否推荐,推荐的商品出现在今日里面',
 `category_sort` int(10)  COMMENT '商品排序字段',
 `operator_id` int(12)  COMMENT '操作员ID',
 `operator_name` varchar(50)  COMMENT '操作员名称',

 `create_date` datetime COMMENT '创建日期',
 `update_date` datetime COMMENT '更新日期',

 PRIMARY KEY (`category_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Category implements Serializable {
    private int id;
    private String name;
    private String level;
    private String state;
    private String score;
    private int parentId;
    private String parentName;
    private String pic;
    private String picSmall;
    private String summary;
    private String detail;
    private Date soldStart;
    private Date soldEnd;
    private int isRecommend;
    private int sort;
    private int operatorId;
    private String operatorName;
    private Date createDate;
    private Date updateDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getPicSmall() {
        return picSmall;
    }

    public void setPicSmall(String picSmall) {
        this.picSmall = picSmall;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getSoldStart() {
        return soldStart;
    }

    public void setSoldStart(Date soldStart) {
        this.soldStart = soldStart;
    }

    public Date getSoldEnd() {
        return soldEnd;
    }

    public void setSoldEnd(Date soldEnd) {
        this.soldEnd = soldEnd;
    }

    public int getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(int isRecommend) {
        this.isRecommend = isRecommend;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public void setOperatorId(int operatorId) {
        this.operatorId = operatorId;
    }

    public int getSort() {
        return sort;
    }

    public int getOperatorId() {
        return operatorId;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
