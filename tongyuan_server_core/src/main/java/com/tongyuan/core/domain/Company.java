package com.tongyuan.core.domain;

import java.util.Date;
/*
CREATE TABLE IF NOT EXISTS `ty_company` (
  `company_id` int(12)  AUTO_INCREMENT,
  `company_name` varchar(50) COMMENT '公司名称',
  `company_executive_id` int(12) COMMENT '公司负责人ID',
  `company_executive_name` varchar(50) COMMENT '公司负责人姓名',
  `company_supervisor_id` int(12) COMMENT '公司的上级公司ID',
  `company_supervisor_name` varchar(50) COMMENT '公司的上级公司的名称',
  `company_type` varchar(50) COMMENT '公司的性质,开发公司,餐饮公司,店铺...',
  `company_regdate` datetime COMMENT '注册时间',
  `company_regid` varchar(200) COMMENT '注册编号',
  `company_state` smallint(2)  COMMENT '状态',
  `company_intro` text  COMMENT '介绍',
  `company_linkname` varchar(50)  COMMENT '联系人',
  `company_linktel` varchar(50)  COMMENT '联系人电话',
  `company_tel` varchar(20)  COMMENT '公司电话',
  `company_address` varchar(200)  COMMENT '公司地址',
  `company_area_id` int(10)  COMMENT '地区id',
  `company_area_allid` varchar(50)  COMMENT '地区id全路径',
  `company_area` varchar(50)  COMMENT '所在区域名',
  `company_opentime_start` int(10)  COMMENT '营业开始时间',
  `company_opentime_close` int(10)  COMMENT '营业结束时间',
  `company_pic_small` varchar(100)  COMMENT '公司logo',
  `company_pic` varchar(100)  COMMENT '小图',
  `company_mode` smallint(2)  COMMENT '经营范围',
  `operator_id` int(12)  COMMENT '操作员ID',
  `operator_name` varchar(50)  COMMENT '操作员名称',
  `creat_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Company {
	private Integer id;
	private String name;
	private Integer executiveId;
	private String executiveName;
	private Integer supervisorId;
	private String supervisorName;
	private String type;
	private Date regdate;
	private String regid;
	private Short state;
	private String linkname;
	private String linktel;
	private String tel;
	private String address;
	private Integer areaId;
	private String areaAllid;
	private String area;
	private Integer opentimeStart;
	private Integer opentimeClose;
	private String picSmall;
	private String pic;
	private Short mode;
    private Integer operatorId;
    private String operatorName;
	private Date createDate;
	private Date updateDate;
	private String intro;

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

	public Integer getExecutiveId() {
		return executiveId;
	}

	public void setExecutiveId(Integer executiveId) {
		this.executiveId = executiveId;
	}

	public String getExecutiveName() {
		return executiveName;
	}

	public void setExecutiveName(String executiveName) {
		this.executiveName = executiveName;
	}

	public Integer getSupervisorId() {
		return supervisorId;
	}

	public void setSupervisorId(Integer supervisorId) {
		this.supervisorId = supervisorId;
	}

	public String getSupervisorName() {
		return supervisorName;
	}

	public void setSupervisorName(String supervisorName) {
		this.supervisorName = supervisorName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getRegid() {
		return regid;
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

    public void setRegid(String regid) {
		this.regid = regid;
	}

	public Short getState() {
		return state;
	}

	public void setState(Short state) {
		this.state = state;
	}

	public String getLinkname() {
		return linkname;
	}

	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}

	public String getLinktel() {
		return linktel;
	}

	public void setLinktel(String linktel) {
		this.linktel = linktel;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getAreaId() {
		return areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	public String getAreaAllid() {
		return areaAllid;
	}

	public void setAreaAllid(String areaAllid) {
		this.areaAllid = areaAllid;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Integer getOpentimeStart() {
		return opentimeStart;
	}

	public void setOpentimeStart(Integer opentimeStart) {
		this.opentimeStart = opentimeStart;
	}

	public Integer getOpentimeClose() {
		return opentimeClose;
	}

	public void setOpentimeClose(Integer opentimeClose) {
		this.opentimeClose = opentimeClose;
	}

	public String getPicSmall() {
		return picSmall;
	}

	public void setPicSmall(String picSmall) {
		this.picSmall = picSmall;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Short getMode() {
		return mode;
	}

	public void setMode(Short mode) {
		this.mode = mode;
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

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

}