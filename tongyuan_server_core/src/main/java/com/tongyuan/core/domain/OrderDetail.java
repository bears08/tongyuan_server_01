package com.tongyuan.core.domain;

import java.math.BigDecimal;
import java.util.Date;
/*
CREATE TABLE IF NOT EXISTS `ty_order_detail` (
  `order_detail_id` int(12)  AUTO_INCREMENT,
  `order_id` int(12)  COMMENT '所属订单id',
  `user_id` int(12)  COMMENT '用户id',
  `user_name` varchar(50)  COMMENT '用户姓名',
  `user_sex` tinyint(1)  COMMENT '性别',
  `user_phone` varchar(20)  COMMENT '手机',
  `user_address` varchar(200)  COMMENT '配送地址',
  `product_id` int(12)  COMMENT '商品ID',
  `product_name` varchar(500)  COMMENT '商品名称',
  `product_discount` float(4,2) default '1' COMMENT '商品折扣',
  `product_price` decimal(10,2)  COMMENT '单价',
  `product_discount` float(4,2) default '1' COMMENT '商品折扣',
  `product_num` int(12)  COMMENT '商品数量',
  `order_time` datetime  COMMENT '下单时间',
  `product_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总金额',
  `product_discount_amount` decimal(10,2) DEFAULT '0.00' COMMENT '优惠金额',
  `product_pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单支付金额',
  `order_detail_beta` varchar(255)  COMMENT '订单备注',
  `order_detail_state` varchar(20)  COMMENT '状态',
  `creat_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

--  如果发生了单品退款
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class OrderDetail {
    private Integer id;
    private Integer orderId;
    private Integer userId;
    private String userName;
    private Boolean userSex;
    private String userPhone;
    private String userAddress;
    private Integer productId;
    private String productName;
    private BigDecimal productPrice;
    private Float productDiscount;
    private Integer productNum;
    private Date orderTime;
    private BigDecimal productAmount;
    private BigDecimal productDiscountAmount;
    private BigDecimal productPayAmount;
    private String orderDetailBeta;
    private String orderDetailState;
    private Date createDate;
    private Date updateDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Boolean getUserSex() {
        return userSex;
    }

    public void setUserSex(Boolean userSex) {
        this.userSex = userSex;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public Float getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(Float productDiscount) {
        this.productDiscount = productDiscount;
    }

    public Integer getProductNum() {
        return productNum;
    }

    public void setProductNum(Integer productNum) {
        this.productNum = productNum;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public BigDecimal getProductAmount() {
        return productAmount;
    }

    public void setProductAmount(BigDecimal productAmount) {
        this.productAmount = productAmount;
    }

    public BigDecimal getProductDiscountAmount() {
        return productDiscountAmount;
    }

    public void setProductDiscountAmount(BigDecimal productDiscountAmount) {
        this.productDiscountAmount = productDiscountAmount;
    }

    public BigDecimal getProductPayAmount() {
        return productPayAmount;
    }

    public void setProductPayAmount(BigDecimal productPayAmount) {
        this.productPayAmount = productPayAmount;
    }

    public String getOrderDetailBeta() {
        return orderDetailBeta;
    }

    public void setOrderDetailBeta(String orderDetailBeta) {
        this.orderDetailBeta = orderDetailBeta;
    }

    public String getOrderDetailState() {
        return orderDetailState;
    }

    public void setOrderDetailState(String orderDetailState) {
        this.orderDetailState = orderDetailState;
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
}