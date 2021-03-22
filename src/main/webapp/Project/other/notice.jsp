<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="function"  uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/web/Project/css/header.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/menubar.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/contents.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/notices.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/web/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/includeHTML.js"></script>
<script type="text/javascript">
	$(function(){
		$("#writer").click(function(){
			document.location.href="/web/Project/other/noticewriter.jsp";
		});
		
		$("#searchbutton").click(function(){
			var data=$("#searchtext").val();
			document.location.href="/web/noticeSearch.do?search="+data;
			//원하는 결과가 서치 일 경우만 
			
		});
		
	/* 	$("#searchtext").keyup(function(){
			
			$.ajax({
				url:'/web/noticeSearch.do',
				dataType:'text',
				type:'POST',
				data:{data:$("#searchtext").val()},
				success:function(v){
					alert(v);
					var temp =""; 
					temp +=  
				},
				error:function(){
					alert('error');
				}
			});
		}) */
		
		
		
	});
</script>
<style type="text/css">
#writer{
	margin-top: 10px;
	margin-left: 1610px;
	width: 80px;
	height: 30px;
	background-color: black;
	color: white;
}

#info:link{
	color: black;
}
#info:visited {
	color: black;
}

#neworder:link {
	color: #393939;
}

#neworder:visited {
	color: #393939;
}

#oldorder:link {
	color: #393939;
}

#oldorder:visited {
	color: #393939;
}
</style>
</head>
<body>
<%@include file="/Project/include/header.jsp" %>
<%@include file="/Project/include/menu.jsp" %>
<div id="contents">
<h1>공지사항</h1>
<div class="aa">
<a href="/web/new.do" id="neworder">최신순 |</a>&nbsp;
<a href="/web/old.do" id="oldorder">오래된 순</a>
<input type="text" id="searchtext" name="searchtext">&nbsp;<input type="button" id="searchbutton" value="search">
</div>
<table class="table">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>글쓴이</th>
<th>날짜</th>
<th>조회수</th>
</tr>
</thead>
<tbody>
<c:forEach var="i" items="${list }" varStatus="cnt">
<tr>
<td>${cnt.count }</td>
<td><a href="/web/selectInfo.do?job=ninfo&no=${i.no}&filenamez=${i.filename}" id="info">${i.title }</a></td>
<td>${i.writer }</td>
<td>${i.regdate }</td>
<td>${i.hit }</td>
</tr>
</c:forEach>
</tbody>
</table>
<input type="button" id="writer" value="글쓰기">
<div class="page_main">
<p id="number">1</p>
<p>2</p>
<p>3</p>
</div>
</div>
</body>
</html>