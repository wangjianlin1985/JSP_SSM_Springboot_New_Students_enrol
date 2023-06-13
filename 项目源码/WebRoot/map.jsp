<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Article" %>
<%@ page import="com.chengxusheji.po.ArticleClass" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>查看文章详情</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"  onload="InitMap();"> 
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li> 
  		<li class="active">学校地图查看</li>
	</ul>
	<div class="row bottom15">  
		<div class="col-md-12 col-xs-12">
			<div id="allmap" style="height:500px;"></div>
		</div>
	</div> 
</div> 
<jsp:include page="footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=uOqdzZgQFY83xmQ4bqIQlixR"></script>
<script language="javascript">
 
 BMap.Point.prototype.toString = function(){
	 return "经度=" + this.lng + ",纬度=" + this.lat;
 }
 
 function InitMap() { 
    // 百度地图API功能
	var map = new BMap.Map("allmap");  
	var point = new BMap.Point(120.653666,31.234409);   //苏州吴城应用技术学校
	map.centerAndZoom(point, 18);
	map.enableScrollWheelZoom();  
	map.addEventListener("click",function(event) { 
		alert(event.point);		
	});

	//创建小图标
	var myIcon = new BMap.Icon('<%=basePath%>images/icon.jpg', new BMap.Size(40,40),{anchor:new BMap.Size(20,20),imageOffset:new BMap.Size(0,0)});
 
	var markerOptions = {
		//enableMassClear : false
		enableDragging: true,
		//enableClicking: true,
		//raiseOnDrag: true,
		//draggingCursor: "wait",
		//rotation: 30,
		title: "这是咱们学校",
	};
		 
	var marker = new BMap.Marker(point,markerOptions);

	
	marker.addEventListener("click",function(event) {
		//alert("图像标注被点击了！");
		
		console.log(event.type);
		console.log(event.target.point);		
	});
	map.addOverlay(marker);
 }
 </script>

<script>
var basePath = "<%=basePath%>";
$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
 })
 </script> 
</body>
</html>

