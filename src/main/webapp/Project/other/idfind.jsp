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
<link href="/web/Project/css/idfind.css" rel="stylesheet" type="text/css">

<!-- <style type="text/css">
.newjoin3{
	margin-top : 150px;
	border: 1px solid black;
	width: 500px;
	height: 400px;
	margin-left: 400px;
	border-radius: 20px;
}

.idpwfind{
	margin-top: 40px;
	height: 50px;
}

.idpwfind > a{
	margin-left : 5px;
	padding-left : 20px;
	border: 1px solid black;
	font-size: 30px;
	width: 100px;
	background-color: black;
	color: white;
}

.con{
	margin-top: 30px;
}

.con > #name{
	margin-left: 15px;
}

#nametext{
	margin-left : 15px;
	width: 390px;
	height: 30px;
	border: 1px solid rgba(0, 0, 0, 0.15);
	border-radius: 10px;
}

#question{
	margin-left : 15px;
	width: 390px;
	height: 30px;
	border: 1px solid rgba(0, 0, 0, 0.15);
	border-radius: 10px;
}

#view{
	margin-top : 40px;
	margin-left: 200px;
	width: 80px;
	height: 40px;
	background-color: black;
	color: white;
}
</style> -->
</head>
<body>
<%@include file="/Project/include/header.jsp" %>
<%@include file="/Project/include/menu.jsp" %>
<div id="contents">
<div class="newjoin3">
<div class="idpwfind">
<a href="/web/Project/other/idfind.jsp">아이디 찾기&nbsp;&nbsp;&nbsp;&nbsp;</a>
<a href="/web/Project/other/pwfind.jsp">비밀번호 찾기&nbsp;&nbsp;&nbsp;&nbsp;</a>
</div>
<div class="con">
<label id="name" style="font-size: 20px;">이&nbsp;&nbsp;름</label>
<input type="text" placeholder="이름" id="nametext"><br><br>
<label id="name" style="font-size: 20px;">질&nbsp;&nbsp;문</label>
<select id="question">
	<option>선택하세요</option>
	<option>아버지 성함은?</option>
	<option>어머니 성함은?</option>
	<option>좋아하는 색깔은?</option>
	<option>좋아하는 음식은?</option>
	<option>졸업한 초등학교는?</option>
</select><br><br>
<label id="name" style="font-size: 20px;">답&nbsp;&nbsp;변</label>
<input type="text" placeholder="답변" id="nametext">
<input type="button" value="확인" id="view">
</div>
</div>
</div>
</body>
</html>