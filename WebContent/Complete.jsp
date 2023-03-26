<%@ page language="java" contentType="text/html; charset=UTF-8"
	import=" java.util.*,ex.game.*"
	pageEncoding="UTF-8"
	isELIgnored="false" 
    %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완료된 매치</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/contents.css">
</head>
<body>
	<div id="contents">
		<h1>완료된 매치</h1> 
		<div id="con">
		<table  class="board">
		<tr class=b_title>
				<td>날짜</td>
				<td>시간</td>
				<td>장소</td>
				<td>종목</td>
				<td>사용자</td>
		</tr>
		</table>
		<div id="t_con" style="overflow:scroll;">
		<table class="board">
			<c:choose>
			<c:when test="${empty gameList}">
			<tr align="center">
				<td colspan=5>
					<b>완료된 매칭이 없습니다.</b>
				</td>
			</tr>
			</c:when>
			<c:when test="${!empty gameList}">
			<c:forEach var="ga" items="${gameList }">
			<tr align="center">
				<td>${ga.date }</td>
				<td>${ga.time }</td>
				<td>${ga.place }</td>
				<td>${ga.exercise }</td>
				<td>${ga.id }</td>
			</tr>
			</c:forEach>
			</c:when>
		</c:choose>
		</table>
		</div>
		</div>
		<button type="submit" class="match" onclick="location.href='${contextPath}/game/game.do'">매칭등록</button>
	</div><!--contents-->
	
</body>
</html>