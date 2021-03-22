<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/web/Project/css/header.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/menubar.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/contents.css" rel="stylesheet" type="text/css">
<link href="/web/Project/css/join.css?after" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/web/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음주소 -->
<script type="text/javascript">
	$(function(){
		$("input[name='addressbu']").click(function(){
		 	new daum.Postcode({
				oncomplete:function(data){
					var addr='';
					var extraAddr='';
					
					  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

					  if(data.userSelectedType==='R'){
						  if(data.bname!=='' && test(data.bname)){
							  extraAddr+=data.bname;
						  }
						  if(data.buildingName !=='' && data.apartment ==='Y'){
							  extraAddr += (extraAddr !== '' ? ',' + data.buildingName : data.buildingName);
						  }
						  if(extraAddr !== ''){
							  extraAddr = '('+ extraAddr+ ')';
						  }
						  
						  $("input[name='address4']").val(extraAddr);
						  
					  }else{
						  $("input[name='address4']").val('');
						  
					  }
			
				$("input[name='address1']").val(data.zonecode);
				$("input[name='address2']").val(addr);
			}
			}).open();
		}); 
		
		
		$("#su").click(function(){
		     var year=$("select[name='year']").val();
		     var month=$("select[name='month']").val();
		     var day=$("select[name='day']").val();
		     $("input[name='birth']").val(year+"/"+month+"/"+day);
		     
		     var hp1=$("#hp1").val();
		     var hp2=$("#hp2").val();
		     var hp3=$("#hp3").val();
		     $("input[name='hp']").val(hp1+"-"+hp2+"-"+hp3);
		     
		     var email1=$("#email1").val();
		     var email2=$("#email2").val();
		     $("input[name='email']").val(email1+"@"+email2);
		     
		     var address1=$("input[name='address1']");
	         var address2=$("input[name='address2']");
	         var address3=$("input[name='address3']");
	         $("input[name='address']").val(address1.val()+" "+address2.val()+" "+address3.val());
	         //address값 +
		     
	         var pw1=$("input[name='pw1']");
		      var pw2=$("input[name='pw2']");
		      if(pw1.val()!=pw2.val() || pw1.val().length==0 || pw2.val().length==0){
		         alert('비밀번호를 다시 확인해 주세요.');
		         pw1.val('');
		         pw2.val('');
		         return false;
		      }else{
		         $("input[name='pw']").val(pw1.val());
		      }
		      
		      $("form[name='frm']").submit();
		});
		
		$("input[name='idcheck']").click(function(){
			var id=$("input[name='id']");
			$.ajax({
				url:"/web/idcheck.do",
				type:"POST",
				dataType:"text",
				data:{id:id.val()},
				success:function(v){
					if(v=="success"){
						alert("이미 해당되는 ID가 있습니다. 다른 ID를 입력해 주세요");
						id.val('');
						id.focus();
					}else{
						alert("사용 가능한 ID입니다.");
					}
				},
				error:function(){
					alert('Error');
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
<div class="newjoin">
<form action="/web/membership.do" method="post" name="frm">
<h1 id="main">회원가입</h1>
<label id="joinlist">이름</label>
<input type="text" class="common" id="name" name="name" placeholder="이름" autofocus="autofocus"><br><br>
<label id="joinlist">아이디</label><br>
 <input type="text" class="id" id="id" name="id" placeholder="아이디">&nbsp;&nbsp;
<input type="button" value="중복확인" class="idcheck" name="idcheck"><br><br>
<label id="joinlist">비밀번호</label>
<input type="password" class="common" id="password" name="pw1" placeholder="비밀번호" maxlength="14"><br><br>
<input type="password" class="common" id="password2" name="pw2" placeholder="비밀번호 확인" maxlength="14">
<input type="hidden" name="pw" value="확인">
<p class="birth">
<label id="joinlist">생년월일</label><br>
<select id="year" name="year">
	<option id="year">선택하세요</option>
	<c:forEach step="1" begin="1950" end="2021" var="i">
		<option>${i}</option>
	</c:forEach>
</select>
<span>년</span>&nbsp;

<select id="month" name="month">
	<option id="month">선택하세요</option>
	<c:forEach step="1" begin="1" end="12" var="i">
		<option>${i}</option>
	</c:forEach>
</select>
<span>월</span>&nbsp;

<select id="day" name="day">
	<option id="day">선택하세요</option>
	<c:forEach step="1" begin="1" end="31" var="i">
		<option>${i}</option>
	</c:forEach>
</select>
<span>일</span>
<input type="hidden" value="생년월일" name="birth">
</p>
<label id="joinlist">핸드폰번호</label><br>
<select id="hp1">
	<option>선택하세요</option>
	<option>010</option>
	<option>011</option>
	<option>019</option>
</select>
-
<input type="text" id="hp2" maxlength="4"> - <input type="text" id="hp3" maxlength="4"><br><br>
<input type="hidden" name="hp">
<label id="joinlist">이메일</label><br>
<input type="text" id="email1" placeholder="이메일">&nbsp;@&nbsp;
<select id="email2">
	<option>선택하세요</option>
	<option>naver.com</option>
	<option>daum.net</option>
	<option>yahoo.com</option>
	<option>gmail.com</option>
	<option>nate.com</option>
</select><br><br>
<input type="hidden" name="email">
<label id="joinlist">주소</label><br>
<input type="text" id="address1" name="address1" placeholder="우편번호" readonly="readonly">&nbsp;<input type="button" value="우편번호" id="arsearch" name="addressbu"><br><br>
<input type="text" class="common" id="address2" name="address2" placeholder="도로명주소" readonly="readonly"><br><br>
<input type="text" class="common" id="address3" name="address3" placeholder="상세주소">
<input type="hidden" name="address" value="주소" style="width: 500px;"><br>
<input type="hidden" name="address4" placeholder="참고항목"><br>
<label id="joinlist">질문</label>
<select class="common" id="pwq" name="pwq">
	<option>선택하세요</option>
	<option>아버지 성함은?</option>
	<option>어머니 성함은?</option>
	<option>좋아하는 색깔은?</option>
	<option>좋아하는 음식은?</option>
	<option>졸업한 초등학교는?</option>
</select><br><br>
<input type="text" class="common" id="pwa" name="pwa" placeholder="ID/PW 답"><br><br>
<input type="button" id="su" name="su" value="가입하기">
</form>
</div>
</div>
</body>
</html>