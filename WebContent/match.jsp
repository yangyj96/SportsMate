<%@ page language="java" contentType="text/html; charset=UTF-8"
	import=" java.util.*,ex.game.*"
	pageEncoding="UTF-8"
	isELIgnored="false"
    %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%
	String id = (String)session.getAttribute("user_id");
	 if (id == null) {
%>		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href='/login.html';
		</script>	
	<%
	} else {
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭등록</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/match.css">
<script type="text/javascript">
// 브라우저에서 뒤로가기 버튼 클릭시 폼 내용 초기화
if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
}
</script>
</head>
<body>
	<form method="post" action="${contextPath}/game/addGame.do">
	<div id="m_contents">
		<h1>매칭등록</h1>
		<div id="match_con">
		<table class="match_in">
			<tr>
				<td>날짜</td>
				<td><input type='date' id='currentDate' name="date"/></td>
				<td>시간</td>
				<td><input type="time"  name="time"  required></td>
			</tr>
			<tr>
				<td>스포츠</td>
				<td><input type="text" name="exercise" required></td>
				<td>장소</td>
				<td><input type="text" name="place" required></td>
				<td>아이디</td>
				<td><input type="text" name="id" value="<%=id %>"required readonly></td>
			</tr>
		</table>
		</div>
		<button type="submit" class="match">매칭등록</button>
	</div><!--contents-->
</form>
</body>
<script type="text/javascript">
	document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

</script>
</html>
<%
}
%>