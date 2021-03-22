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
<link href="/web/Project/css/login.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/web/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	getid();
	  $("#chk").click(function(){
	   saveid();
	  }); 	
});

function saveid() {
	   var expdate = new Date();
	// 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
	   if($("#chk").prop("checked")){
	    expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 1); //1일동안 기억 -> 필요하면 1을 원하는 날짜로 변경 가능
	   } else {
	    expdate.setTime(expdate.getTime() - 1); //쿠키 삭제 
	   }
	   setCookie("saveid", $("input[name='id']").val(), expdate);
	 } 

function setCookie (name, value, expires) {
document.cookie = name + "=" + escape (value) +"; path=/; expires=" + expires.toGMTString();
} 

function getCookie(Name) {
var search = Name + "=";
if (document.cookie.length > 0) { //쿠키 설정이 되어있으면
offset = document.cookie.indexOf(search);
if (offset != -1) { //쿠키가 존재하면
 offset += search.length;
 
 end = document.cookie.indexOf(";", offset);
 
 if (end == -1)
   end = document.cookie.length;
 //쿠키 값의 마지막 위치 인덱스 번호 설정
 return unescape(document.cookie.substring(offset, end));
}
}
return "";
} 

function getid() {
var saveId = getCookie("saveid");
if(saveId != "") {
$("input[name='id']").val(saveId);
$("#chk").prop("checked",true);
}
} 



$(function(){
	$("#loginbt").click(function(){
		var id=$("input[name='id']");
		var pw=$("input[name='pw']");
		
		$.ajax({
			url:"/web/login.do",
			dataType:"text",
			type:"post",
			data:{id:id.val(),pw:pw.val()},
			success:function(v){
				if(v=="success"){
					document.location.href="/web/Project/index.jsp";
				}else{
					alert("아이디와 패스워드가 일치하지 않습니다. 다시 입력해 주세요");
				}
			},
			error:function(){
				alert("Error");
			}
		});
	});
});



</script>
</head>
<body>
<%@include file="/Project/include/header.jsp" %>
<%@include file="/Project/include/menu.jsp" %>
<div id="contents">
<div class="newjoin2">
<h1 align="center">로그인</h1>
<input type="text" placeholder="ID" class="loginid" autofocus="autofocus" name="id">
<input type="password" placeholder="Password" class="loginpw" name="pw"><br><br>
<input type="checkbox" id="chk" name="chk" onclick="saveid(document.new_user_session)">
<input type="text" value="아이디 저장" id="idsave" readonly="readonly" style="border: 0px;" ><br>
<input type="button" value="로그인" id="loginbt">
<div class="bbb">
<a href="/web/Project/other/idfind.jsp">아이디 찾기</a> |
<a href="/web/Project/other/pwfind.jsp">비밀번호 찾기</a> |
<a href="/web/Project/other/join.jsp">회원가입</a>
</div>
</div>
</div>
</body>
</html>