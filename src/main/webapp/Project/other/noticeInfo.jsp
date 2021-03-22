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
<style type="text/css">
table,th,tr,td{
	border-collapse: collapse;
}

#tablemain{
	border: 1px solid black;
	margin-top: 60px;
	
	
}

#tablemain > thead > tr > th{
	font-size: 17px;
}

th{
	width: 430px;
	height: 1px;
}

#thz{
	background-color: black;
	color: white;	
}

.contentss{
	margin-top: 30px;
}

#listn{
	margin-top: 30px;
	width: 70px;
	height: 25px;
	background-color: black;
	color: white;
	margin-left: 1450px;
}

#listm{
	position : relative;
	margin-top: 30px;
	width: 70px;
	height: 25px;
	background-color: black;
	color: white;
	margin-left: 5px;
}

#listd{
	position : relative;
	margin-top: 30px;
	width: 70px;
	height: 25px;
	background-color: black;
	color: white;
	margin-left: 5px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/web/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#listn").click(function(){
		document.location.href="/web/boardList.do";
	});
	
	$("input[name='listDelete']").click(function(){
		alert('삭제되었습니다.');
		document.location.href="/web/boardDelete.do?no=${selectInfo.no}";
	});
	
	$("input[name='listMod']").click(function(){
		document.location.href='/web/boardModify.do?no=${selectInfo.no}&filenamez=${selectInfo.filename}';
	});
});
</script>
</head>
<body>
<%@include file="/Project/include/header.jsp" %>
<%@include file="/Project/include/menu.jsp" %>
<div id="contents">
<input type="hidden" value="${selectInfo.no }">
<div class="layerpop" id="layerbox">
<h1 align="center">공지사항</h1>
<table id="tablemain">
<thead>
<tr id="thz">
<th>번호</th>
<th>제목</th>
<th>글쓴이</th>
<th>날짜</th>
</tr>
</thead>
<tbody>
<c:forEach var="i" items="${list }" varStatus="cnt" begin="0" end="0">
<tr align="center">
<td>${cnt.count }</td>
<td>${selectInfo.title }</td>
<td>${selectInfo.writer }</td>
<td>${selectInfo.regdate }</td>
</tr>
</c:forEach>
<tr>
<td colspan="4" align="center">
<div class="contentss">
 <%String filenamez=request.getParameter("filenamez"); %> 
 <%if(filenamez==""){ %>
 ${selectInfo.contents }
 <%}else{ %>
 <img alt="" src="/web/upload/${selectInfo.filename }" width="300" height="300">
<br><br>
${selectInfo.contents }
 <%} %>
</div>
</td>
</tr>
</tbody>
</table>
<input type="button" id="listn" value="목록">
<input type="button" id="listm" name="listMod" value="수정">
<input type="button" id="listd" name="listDelete" value="삭제">
</div>
</div>
</body>
</html>