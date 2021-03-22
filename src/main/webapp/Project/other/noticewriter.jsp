<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/web/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="/web/Project/css/header.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/menubar.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/contents.css" rel="stylesheet" type="text/css">
<style type="text/css">
.noticewriter{
	margin-top: 50px;
	margin-left: 50px;
}

#writerw{
	height: 20px;
	margin-left: 18px;
}

#writert{
	height: 20px;
	margin-left: 50px;
	width: 400px;
}
#upload{
	position : relative;
	margin-left: 350px;
}

#bb{
	font-weight: bold;
}

#title1{
	margin-top: 10px;
}


#saven{
	margin-left: 900px;
	margin-top: 30px;
	background-color: black;
	color: white;
	width: 120px;
	height: 30px;
}

h1{
	margin-left: 500px;
}
</style>
<script type="text/javascript">
$(function(){
	$("input[name='writersave']").click(function(){
		$("form[name='frm']").submit();
	});
});
</script>
</head>
<body>
<%@include file="/Project/include/header.jsp" %>
<%@include file="/Project/include/menu.jsp" %>
<div id="contents">
<form action="/web/noticeWriter.do" method="post" name="frm" enctype="multipart/form-data" >
<h1>공지사항 글쓰기</h1>
<div class="noticewriter">
<label id="bb">작성자명</label>
<input type="text" placeholder="작성자" id="writerw" name="writer"><br>
<div id="title1">
<label id="bb">제목</label>
<input type="text" placeholder="제목" id="writert" name="title">
 <input type="file" id="upload" name="file"><br>
</div>
<div id="title1">
<textarea rows="45" cols="150" name="contents">
</textarea>
</div>
<input type="button" value="저장" id="saven" name="writersave">
</div>
</form>
</div>
</body>
</html>