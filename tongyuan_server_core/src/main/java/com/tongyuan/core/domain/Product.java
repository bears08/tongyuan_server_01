package com.tongyuan.core.domain;

/*
CREATE TABLE IF NOT EXISTS `ty_product` (
  `product_id` int(12)  AUTO_INCREMENT,
  `product_name` varchar(500)  COMMENT '商品名称',
  `product_price` decimal(10,2)  COMMENT '单价',
  `product_discount` int(12) default '1' COMMENT '商品折扣',
  `product_state` varchar(32)  COMMENT '状态,上架在售,售罄,下架',
  `product_num` int(12)  COMMENT '商品数量',
  `product_score` int(12)  COMMENT '商品评分',
  `product_category_id` int(12)  COMMENT '商品分类ID',
  `product_category_name` varchar(50)  COMMENT '商品分类名称',
  `product_unit` varchar(10)  COMMENT '单位,件,克,份',
  `product_pic` varchar(200)  COMMENT '图片',
  `product_pic_small` varchar(200)  COMMENT '小图',
  `product_element` varchar(500)  COMMENT '产品的成分,组成',
  `product_function` varchar(500)  COMMENT '产品的功能,推荐',
  `product_summary` varchar(500)  COMMENT '产品简介',
--  产品详情页是否做成article
  `product_detail` varchar(500)  COMMENT '产品详情',
  `product_sold_start` datetime  COMMENT '开始出售时间',
  `product_sold_end` datetime  COMMENT '停止出售时间',
  `product_is_reserve` tinyint(1) DEFAULT '0' COMMENT '是否需要预定,默认不需要预定',
--  产品上架地区或店铺
  `product_is_recommend` int(12) default '0' COMMENT '是否推荐,推荐的商品出现在今日里面',
  `product_sort` int(10)  COMMENT '商品排序字段',
  `operator_id` int(12)  COMMENT '操作员ID',
  `operator_name` varchar(32)  COMMENT '操作员名称',

  `creat_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Product  implements Serializable{
    private Integer id;
    private String name;
    private BigDecimal price;
    private float discount;
    private String state;
    private Integer num;
    private Integer score;
    private Integer categoryId;
    private String categoryName;
    private String unit;
    private String pic;
    private String picSmall;
    private String element;
    private String function;
    private String summary;
    private String detail;
    private Date soldStart;
    private Date soldEnd;
    private Boolean isReserve;
    private Boolean isRecommend;
    private Integer sort;
    private Integer operatorId;
    private String operatorName;
    private Date creatDate;
    private Date updateDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
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

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
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

    public Boolean getIsReserve() {
        return isReserve;
    }

    public void setIsReserve(Boolean isReserve) {
        this.isReserve = isReserve;
    }

    public Boolean getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Boolean isRecommend) {
        this.isRecommend = isRecommend;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Date getCreatDate() {
        return creatDate;
    }

    public void setCreatDate(Date creatDate) {
        this.creatDate = creatDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public Integer getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }
}