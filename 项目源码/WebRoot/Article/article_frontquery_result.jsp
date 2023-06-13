<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Article" %>
<%@ page import="com.chengxusheji.po.ArticleClass" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<Article> articleList = (List<Article>)request.getAttribute("articleList");
    //获取所有的articleClassObj信息
    List<ArticleClass> articleClassList = (List<ArticleClass>)request.getAttribute("articleClassList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    String title = (String)request.getAttribute("title"); //文章标题查询关键字
    ArticleClass articleClassObj = (ArticleClass)request.getAttribute("articleClassObj");
    String addTime = (String)request.getAttribute("addTime"); //添加时间查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>文章查询</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
<body style="margin-top:70px;"> 
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>Article/frontlist">文章信息列表</a></li>
  			<li class="active">查询结果显示</li>
  			<a class="pull-right" href="<%=basePath %>Article/article_frontAdd.jsp" style="display:none;">添加文章</a>
		</ul>
		<div class="row">
			<%
				/*计算起始序号*/
				int startIndex = (currentPage -1) * 5;
				/*遍历记录*/
				for(int i=0;i<articleList.size();i++) {
            		int currentIndex = startIndex + i + 1; //当前记录的序号
            		Article article = articleList.get(i); //获取到文章对象
            		String clearLeft = "";
            		if(i%4 == 0) clearLeft = "style=\"clear:left;\"";
			%>
			<div class="col-md-3 bottom15" <%=clearLeft %>>
			  <a  href="<%=basePath  %>Article/<%=article.getArticleId() %>/frontshow"><img class="img-responsive" src="<%=basePath%><%=article.getArticlePhoto()%>" /></a>
			     <div class="showFields">
			     	<div class="field">
	            		标题:<%=article.getTitle() %>
			     	</div>
			     	<div class="field">
	            		类别:<%=article.getArticleClassObj().getClassName() %>
			     	</div>
			     	<div class="field">
	            		作者:<%=article.getAuthor() %>
			     	</div>
			     	<div class="field">
	            		来源:<%=article.getComeFrom() %>
			     	</div>
			     	<div class="field">
	            		添加时间:<%=article.getAddTime() %>
			     	</div>
			        <a class="btn btn-primary top5" href="<%=basePath %>Article/<%=article.getArticleId() %>/frontshow">详情</a>
			        <a class="btn btn-primary top5" onclick="articleEdit('<%=article.getArticleId() %>');" style="display:none;">修改</a>
			        <a class="btn btn-primary top5" onclick="articleDelete('<%=article.getArticleId() %>');" style="display:none;">删除</a>
			     </div>
			</div>
			<%  } %>

			<div class="row">
				<div class="col-md-12">
					<nav class="pull-left">
						<ul class="pagination">
							<li><a href="#" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							<%
								int startPage = currentPage - 5;
								int endPage = currentPage + 5;
								if(startPage < 1) startPage=1;
								if(endPage > totalPage) endPage = totalPage;
								for(int i=startPage;i<=endPage;i++) {
							%>
							<li class="<%= currentPage==i?"active":"" %>"><a href="#"  onclick="GoToPage(<%=i %>,<%=totalPage %>);"><%=i %></a></li>
							<%  } %> 
							<li><a href="#" onclick="GoToPage(<%=currentPage+1 %>,<%=totalPage %>);"><span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
					<div class="pull-right" style="line-height:75px;" >共有<%=recordNumber %>条记录，当前第 <%=currentPage %>/<%=totalPage %> 页</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-3 wow fadeInRight">
		<div class="page-header">
    		<h1>信息查询</h1>
		</div>
		<form name="articleQueryForm" id="articleQueryForm" action="<%=basePath %>Article/frontlist" class="mar_t15">
			<div class="form-group">
				<label for="title">标题:</label>
				<input type="text" id="title" name="title" value="<%=title %>" class="form-control" placeholder="请输入文章标题">
			</div>
            <div class="form-group" style="display:none;">
            	<label for="articleClassObj_classId">文章类别：</label>
                <select id="articleClassObj_classId" name="articleClassObj.classId" class="form-control">
                	<option value="0">不限制</option>
	 				<%
	 				for(ArticleClass articleClassTemp:articleClassList) {
	 					String selected = "";
 					if(articleClassObj!=null && articleClassObj.getClassId()!=null && articleClassObj.getClassId().intValue()==articleClassTemp.getClassId().intValue())
 						selected = "selected";
	 				%>
 				 <option value="<%=articleClassTemp.getClassId() %>" <%=selected %>><%=articleClassTemp.getClassName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
			<div class="form-group">
				<label for="addTime">添加时间:</label>
				<input type="text" id="addTime" name="addTime" value="<%=addTime %>" class="form-control" placeholder="请输入添加时间">
			</div>
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
</div>
<div id="articleEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;文章信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
      	<form class="form-horizontal" name="articleEditForm" id="articleEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="article_articleId_edit" class="col-md-3 text-right">文章id:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="article_articleId_edit" name="article.articleId" class="form-control" placeholder="请输入文章id" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="article_title_edit" class="col-md-3 text-right">文章标题:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="article_title_edit" name="article.title" class="form-control" placeholder="请输入文章标题">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="article_articleClassObj_classId_edit" class="col-md-3 text-right">文章类别:</label>
		  	 <div class="col-md-9">
			    <select id="article_articleClassObj_classId_edit" name="article.articleClassObj.classId" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="article_articlePhoto_edit" class="col-md-3 text-right">文章主图:</label>
		  	 <div class="col-md-9">
			    <img  class="img-responsive" id="article_articlePhotoImg" border="0px"/><br/>
			    <input type="hidden" id="article_articlePhoto" name="article.articlePhoto"/>
			    <input id="articlePhotoFile" name="articlePhotoFile" type="file" size="50" />
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="article_content_edit" class="col-md-3 text-right">文章内容:</label>
		  	 <div class="col-md-9">
			    <textarea id="article_content_edit" name="article.content" rows="8" class="form-control" placeholder="请输入文章内容"></textarea>
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="article_author_edit" class="col-md-3 text-right">作者:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="article_author_edit" name="article.author" class="form-control" placeholder="请输入作者">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="article_comeFrom_edit" class="col-md-3 text-right">来源:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="article_comeFrom_edit" name="article.comeFrom" class="form-control" placeholder="请输入来源">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="article_addTime_edit" class="col-md-3 text-right">添加时间:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="article_addTime_edit" name="article.addTime" class="form-control" placeholder="请输入添加时间">
			 </div>
		  </div>
		</form> 
	    <style>#articleEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxArticleModify();">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.articleQueryForm.currentPage.value = currentPage;
    document.articleQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.articleQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.articleQueryForm.currentPage.value = pageValue;
    documentarticleQueryForm.submit();
}

/*弹出修改文章界面并初始化数据*/
function articleEdit(articleId) {
	$.ajax({
		url :  basePath + "Article/" + articleId + "/update",
		type : "get",
		dataType: "json",
		success : function (article, response, status) {
			if (article) {
				$("#article_articleId_edit").val(article.articleId);
				$("#article_title_edit").val(article.title);
				$.ajax({
					url: basePath + "ArticleClass/listAll",
					type: "get",
					success: function(articleClasss,response,status) { 
						$("#article_articleClassObj_classId_edit").empty();
						var html="";
		        		$(articleClasss).each(function(i,articleClass){
		        			html += "<option value='" + articleClass.classId + "'>" + articleClass.className + "</option>";
		        		});
		        		$("#article_articleClassObj_classId_edit").html(html);
		        		$("#article_articleClassObj_classId_edit").val(article.articleClassObjPri);
					}
				});
				$("#article_articlePhoto").val(article.articlePhoto);
				$("#article_articlePhotoImg").attr("src", basePath +　article.articlePhoto);
				$("#article_content_edit").val(article.content);
				$("#article_author_edit").val(article.author);
				$("#article_comeFrom_edit").val(article.comeFrom);
				$("#article_addTime_edit").val(article.addTime);
				$('#articleEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除文章信息*/
function articleDelete(articleId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "Article/deletes",
			data : {
				articleIds : articleId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#articleQueryForm").submit();
					//location.href= basePath + "Article/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
}

/*ajax方式提交文章信息表单给服务器端修改*/
function ajaxArticleModify() {
	$.ajax({
		url :  basePath + "Article/" + $("#article_articleId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#articleEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                $("#articleQueryForm").submit();
            }else{
                alert(obj.message);
            } 
		},
		processData: false,
		contentType: false,
	});
}

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

