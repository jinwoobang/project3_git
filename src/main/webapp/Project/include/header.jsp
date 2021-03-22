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
<style type="text/css">
/*   #join:link {
	color: white;
}
#join:visited {
	color: white;
}
#login:link {
	color: white;
}
#login:visited {
	color: white;
}   */

/* #mains:link{
	color: white;
}
#mains:visited {
	color: white;
} */
</style>
</head>
<body>
<%String pw=(String)session.getAttribute("pw"); %>
<header>
<div id="div1"><a href="/web/Project/index.jsp" id="mains">BoardWeb</a>
<span id="span1"><a href="/web/Project/other/join.jsp" id="join">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%if(pw==null){ %>
<a href="/web/Project/other/login.jsp" id="login">로그인</a>
<%}else{ %>
<a href="/web/logout.do" id="login">${id}님 로그아웃</a>
<%} %>
</span></div>
</header>
</body>
</html>