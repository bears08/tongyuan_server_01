<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>交易明细</title>
<link href="<%=root%>/pages/app/resources/css/jquery-ui-themes.css"
	type="text/css" rel="stylesheet" />
<link href="<%=root%>/pages/app/resources/css/axure_rp_page.css"
	type="text/css" rel="stylesheet" />
<link href="<%=root%>/pages/app/files/styles.css" type="text/css"
	rel="stylesheet" />
<link href="<%=root%>/pages/app/files/trade_detail/styles.css" type="text/css"
	rel="stylesheet" />
	<script type="text/javascript" src="<%=root %>/js/jquery/jquery-1.8.3.min.js"></script>
</head>
<body>
	<div style="float: left; width: 100px;">
		<jsp:include page="app_index_men.jsp" flush="true"></jsp:include>
	</div>
	<div
		style="float: left; width: 200px; min-height: 400px; margin-left: 40px; display: inline;">
		<div id="base" class="">
		<div id="u0" class="ax_shape">
        <img id="u0_img" class="img " src="<%=root%>/pages/app/images/licai/u0.png"/>
        <!-- Unnamed () -->
        <div id="u1" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u2" class="ax_shape">
        <img id="u2_img" class="img " src="<%=root%>/pages/app/images/licai/u2.png"/>
        <!-- Unnamed () -->
        <div id="u3" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u4" class="ax_h2">
        <img id="u4_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u5" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">交易明细</span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u6" class="ax_image">
        <img id="u6_img" class="img " src="<%=root%>/pages/app/images/licai/u6.png"/>
        <!-- Unnamed () -->
        <div id="u7" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u8" class="ax_image">
        <img id="u8_img" class="img " src="<%=root%>/pages/app/images/licai/u8.png"/>
        <!-- Unnamed () -->
        <div id="u9" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u10" class="ax_image">
        <img id="u10_img" class="img " src="<%=root%>/pages/app/images/licai/u10.png"/>
        <!-- Unnamed () -->
        <div id="u11" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u12" class="ax_h2">
        <img id="u12_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u13" class="text">
          <p><span>11:56</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u14" class="ax_h2">
        <img id="u14_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u15" class="text">
          <p><span>CB</span></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u16" class="ax_horizontal_line">
        <img id="u16_start" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u16_start"/>
        <img id="u16_end" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u16_end"/>
        <img id="u16_line" class="img " src="<%=root%>/pages/app/images/licai/u16_line.png" alt="u16_line"/>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u17" class="ax_shape">
        <img id="u17_img" class="img " src="<%=root%>/pages/app/images/licai/u17.png"/>
        <!-- Unnamed () -->
        <div id="u18" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u19" class="ax_shape">
        <img id="u19_img" class="img " src="<%=root%>/pages/app/images/licai/u17.png"/>
        <!-- Unnamed () -->
        <div id="u20" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u21" class="ax_shape">
        <img id="u21_img" class="img " src="<%=root%>/pages/app/images/trade_detail/u21.png"/>
        <!-- Unnamed () -->
        <div id="u22" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">主动购买</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u23" class="ax_shape">
        <img id="u23_img" class="img " src="<%=root%>/pages/app/images/trade_detail/u23.png"/>
        <!-- Unnamed () -->
        <div id="u24" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">被动</span><span style="font-family:'ArialMT', 'Arial';font-weight:400;">续投</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u25" class="ax_shape">
        <img id="u25_img" class="img " src="<%=root%>/pages/app/images/trade_detail/u23.png"/>
        <!-- Unnamed () -->
        <div id="u26" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">到期兑付</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u27" class="ax_shape">
        <img id="u27_img" class="img " src="<%=root%>/pages/app/images/open_user/u21.png"/>
        <!-- Unnamed () -->
        <div id="u28" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u29" class="ax_horizontal_line">
        <img id="u29_start" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u29_start"/>
        <img id="u29_end" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u29_end"/>
        <img id="u29_line" class="img " src="<%=root%>/pages/app/images/trade_detail/u29_line.png" alt="u29_line"/>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u30" class="ax_h2">
        <img id="u30_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u31" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">3月期定期理财</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u32" class="ax_h2">
        <img id="u32_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u33" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">6月期定期理财</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u34" class="ax_h2">
        <img id="u34_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u35" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">2015-04-02&nbsp; 12:23:23</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u36" class="ax_h2">
        <img id="u36_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u37" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">2015-04-02&nbsp; 11:11:11</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u38" class="ax_shape">
        <img id="u38_img" class="img " src="<%=root%>/pages/app/images/trade_detail/u38.png"/>
        <!-- Unnamed () -->
        <div id="u39" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u40" class="ax_paragraph">
        <img id="u40_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u41" class="text">
          <p><span>本月</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u42" class="ax_shape">
        <img id="u42_img" class="img " src="<%=root%>/pages/app/images/product_detail/u33.png"/>
        <!-- Unnamed () -->
        <div id="u43" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u44" class="ax_horizontal_line">
        <img id="u44_start" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u44_start"/>
        <img id="u44_end" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u44_end"/>
        <img id="u44_line" class="img " src="<%=root%>/pages/app/images/trade_detail/u29_line.png" alt="u44_line"/>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u45" class="ax_h2">
        <img id="u45_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u46" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">3月期定期理财</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u47" class="ax_h2">
        <img id="u47_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u48" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">6月期定期理财</span></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u49" class="ax_horizontal_line">
        <img id="u49_start" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u49_start"/>
        <img id="u49_end" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u49_end"/>
        <img id="u49_line" class="img " src="<%=root%>/pages/app/images/trade_detail/u29_line.png" alt="u49_line"/>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u50" class="ax_horizontal_line">
        <img id="u50_start" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u50_start"/>
        <img id="u50_end" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u50_end"/>
        <img id="u50_line" class="img " src="<%=root%>/pages/app/images/trade_detail/u29_line.png" alt="u50_line"/>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u51" class="ax_h2">
        <img id="u51_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u52" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">3月期定期理财</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u53" class="ax_h2">
        <img id="u53_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u54" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">3月期定期理财</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u55" class="ax_h2">
        <img id="u55_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u56" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">2015-03-22&nbsp; 11:11:11</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u57" class="ax_h2">
        <img id="u57_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u58" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">2015-03-12&nbsp; 11:11:11</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u59" class="ax_h2">
        <img id="u59_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u60" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">2015-03-02&nbsp; 11:11:11</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u61" class="ax_h2">
        <img id="u61_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u62" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">2015-03-01&nbsp; 11:11:11</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u63" class="ax_shape">
        <img id="u63_img" class="img " src="<%=root%>/pages/app/images/trade_detail/u38.png"/>
        <!-- Unnamed () -->
        <div id="u64" class="text">
          <p><span/></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u65" class="ax_paragraph">
        <img id="u65_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u66" class="text">
          <p><span>3月</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u67" class="ax_h2">
        <img id="u67_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u68" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">1200.00元</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u69" class="ax_h2">
        <img id="u69_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u70" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">购买成功</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u71" class="ax_h2">
        <img id="u71_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u72" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">1200.00元</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u73" class="ax_h2">
        <img id="u73_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u74" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">交易关闭</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u75" class="ax_h2">
        <img id="u75_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u76" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">1200.00元</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u77" class="ax_h2">
        <img id="u77_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u78" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">交易关闭</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u79" class="ax_h2">
        <img id="u79_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u80" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">1200.00元</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u81" class="ax_h2">
        <img id="u81_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u82" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">购买成功</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u83" class="ax_h2">
        <img id="u83_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u84" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">1200.00元</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u85" class="ax_h2">
        <img id="u85_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u86" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">购买成功</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u87" class="ax_h2">
        <img id="u87_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u88" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">1200.00元</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u89" class="ax_h2">
        <img id="u89_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u90" class="text">
          <p><span style="font-family:'ArialMT', 'Arial';font-weight:400;">购买成功</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u91" class="ax_paragraph">
        <img id="u91_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u92" class="text">
          <p><span>查看更多</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u93" class="ax_paragraph">
        <img id="u93_img" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u94" class="text">
          <p><span>默认显示最后</span><span>30</span><span>条的交易记录</span></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u95" class="ax_horizontal_line">
        <img id="u95_start" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u95_start"/>
        <img id="u95_end" class="img " src="<%=root%>/pages/app/resources/images/transparent.gif" alt="u95_end"/>
        <img id="u95_line" class="img " src="<%=root%>/pages/app/images/trade_detail/u95_line.png" alt="u95_line"/>
      </div>

      <!-- Unnamed (Hot Spot) -->
      <div id="u96" class="ax_hot_spot">
      </div>
	</div>
	</div>
</body>