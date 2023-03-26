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
	<title>게시판 생성 완료</title>
	<style type="text/css">
		.popup {
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			width: 400px;
			background-color: #fff;
			padding: 20px;
			border: 1px solid #ccc;
			text-align: center;
			font-size: 18px;
			box-shadow: 0 0 10px #ccc;
		}
		.btn {
			display: inline-block;
			padding: 10px 20px;
			background-color: #007bff;
			color: #fff;
			font-size: 16px;
			border-radius: 5px;
			margin-top: 20px;
			text-decoration: none;
		}
	</style>
</head>
<body>
	<div class="popup">
		<p>게시판 생성이 완료되었습니다!</p>
		<a href="/game/listgame.do" class="btn">확인</a>
	</div>
</body>
</html>