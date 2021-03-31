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
			var query=$("#query").val();
			var query2=$("#query");
			var data=$("#searchtext").val();
			var data2=$("#searchtext");
			if(query=="empty"||data.length==0){
				alert('No suchElement');
				query2.prop("selectedIndex",0);
				data2.val('');
				return false;
			}
			 document.location.href="/web/noticeSearch.do?query="+query+"&search="+data+"&page=1"; 
			/* document.location.href="/web/noticeSearch.do?search="+data; */
			//원하는 결과가 서치 일 경우만 
			
		});	
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
#query{
	position: relative;
	margin-left:1080px;
	
}
</style>
</head>
<body>
<%@include file="/Project/include/header.jsp" %>
<%@include file="/Project/include/menu.jsp" %>
<div id="contents">
<h1>공지사항</h1>
<div class="aa">
<a href="/web/new.do?page=1" id="neworder">최신순 |</a>&nbsp;
<a href="/web/old.do?page=1" id="oldorder">오래된 순</a>
<select style="width: 200px; height:25px;" id="query" name="query">
<option selected="selected" value="empty">선택하세요</option>
<option value="title">제목</option>
<option value="writer">글쓴이</option>
</select>&nbsp;
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
<div class="page_main" align="center">
 <a href="/web/new.do?page=1"><img alt="" src="/web/Project/img/chevron-double-left.svg"></a>
                  <c:choose>
                    <c:when test="${pageBean.currentBlock > 1 }">
                    <a href="/web/new.do?page=${pageBean.startPage-1 }"><img alt="" src="/web/Project/img/chevron-left.svg"></a>
                    
                    </c:when>
                    <c:otherwise>
                   	<img alt="" src="/web/Project/img/chevron-left.svg">
                    </c:otherwise>
                  </c:choose>                                                        
                  <span id="numberb">
                 <%--  <c:choose>
                    <c:when test="${pageBean.currentPage > 1 }">
                    <a href="/web/new.do?page=${pageBean.currentPage-1 }">Before</a>
                    </c:when>
                    <c:otherwise>
                   Before
                    </c:otherwise>
                  </c:choose> --%>
                  
                  
                  <c:forEach var="i" begin="${pageBean.startPage }" end="${pageBean.endPage }">
                     <c:choose>
                       <c:when test="${pageBean.currentPage eq i }">
                         <a href="#"><font color="red" size="4">[${i}]</font></a>
                       </c:when>
                       <c:otherwise>
                       <a href="/web/new.do?page=${i}"><font size="4">[${i}]</font></a>
                       </c:otherwise>
                     </c:choose>
                   
                     </c:forEach>                     
                  </span>
                 <%--  <c:choose>
                    <c:when test="${pageBean.totalPage > pageBean.currentPage }">
                    	<a href="/web/new.do?page=${pageBean.currentPage+1 }">Next</a>
                    </c:when>
                    <c:otherwise>
                    Next
                    </c:otherwise>
                  </c:choose> --%>
                              
					
					<c:choose>
						<c:when test="${pageBean.totalPage > pageBean.endPage }">
						<a href="/web/new.do?page=${pageBean.endPage+1 }"><img alt="" src="/web/Project/img/chevron-right.svg"></a>
						</c:when>
						<c:otherwise>
							<img alt="" src="/web/Project/img/chevron-right.svg">
						</c:otherwise>
					</c:choose>
                  <a href="/web/new.do?page=${pageBean.totalPage }"><img alt="" src="/web/Project/img/chevron-double-right.svg"></a>
                  
                  
</div>
</div>
</body>
</html>