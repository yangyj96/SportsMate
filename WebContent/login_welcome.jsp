<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보</title>
	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			font-size: 14px;
		}
		header {
			background-color: #333;
			color: #fff;
			padding: 20px;
		}
		h1 {
			margin: 0;
			font-size: 24px;
		}
		nav {
			background-color: #f2f2f2;
			padding: 10px;
			margin-bottom: 20px;
		}
		nav a {
			display: inline-block;
			margin-right: 10px;
			color: #333;
			text-decoration: none;
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 5px;
			transition: background-color 0.3s ease;
		}
		nav a:hover {
			background-color: #333;
			color: #fff;
		}
		.container {
			max-width: 960px;
			margin: 0 auto;
			padding: 20px;
		}
	</style>
</head>
<body>
	<header>
		<div class="container">
			<h1>회원 정보</h1>
		</div>
	</header>
	<div class="container">
		<p><%=id %>(<%=name %>)님 안녕하세요</p>
	</div>
	<nav>
		<div class="container">
			<a href="logout.jsp">로그아웃</a>
			<a href="getInfo.jsp">정보수정</a>
			<a href="delete_ok.jsp">회원탈퇴</a>
		</div>
	</nav>
</body>
</html>