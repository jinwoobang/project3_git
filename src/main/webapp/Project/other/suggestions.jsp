<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/web/Project/css/header.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/menubar.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/contents.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/suggestion.css" rel="stylesheet" type="text/css">

</head>
<body>
<%@include file="/Project/include/header.jsp" %>
<%@include file="/Project/include/menu.jsp" %>
<div id="contents">
<h1>건의사항</h1>
<div class="aa">
<input type="text" id="searchtext">&nbsp;<input type="button" id="searchbutton" value="search">
</div>
<table class="table">
<thead>
<tr>
<th>no</th>
<th>title</th>
<th>writer</th>
<th>regdate</th>
<th>hit</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>건의사항</td>
<td>방진우</td>
<td>2021/01/11</td>
<td>1</td>
</tr>
</tbody>
</table>
<div class="page_main">
<p id="number">1</p>
<p>2</p>
<p>3</p>
</div>
</div>
</body>
</html>