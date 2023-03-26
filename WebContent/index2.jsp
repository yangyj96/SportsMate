<%@ page language="java" contentType="text/html; charset=UTF-8"
	import=" java.util.*,ex.game.*"
	pageEncoding="UTF-8"
	isELIgnored="false" 
    %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%	String name = (String)session.getAttribute("user_name"); %>
<!DOCTYPE html>
<html lang="ko">
<script>
function filterGameList() {
    // 선택한 종목 가져오기
    var selectedExercise = document.getElementById("exercise-select").value;
    
    // 게임 리스트에서 종목에 맞는 게임만 필터링
    var gameList = document.querySelectorAll("#t_con table.board tr");
    for (var i = 0; i < gameList.length; i++) {
        var gameExercise = gameList[i].querySelectorAll("td")[3].textContent;
        if (selectedExercise === "" || gameExercise === "전체" || gameExercise === selectedExercise) {
            gameList[i].style.display = "table-row";
        } else {
            gameList[i].style.display = "none";
        }
    }
}
function filterGameList2() {
    // 선택한 종목 가져오기
    var selectedExercise = document.getElementById("exercise-select2").value;
    
    // 게임 리스트에서 종목에 맞는 게임만 필터링
    var gameList = document.querySelectorAll("#t_con2 table.board tr");
    for (var i = 0; i < gameList.length; i++) {
        var gameExercise = gameList[i].querySelectorAll("td")[3].textContent;
        if (selectedExercise === "" || gameExercise === "전체" || gameExercise === selectedExercise) {
            gameList[i].style.display = "table-row";
        } else {
            gameList[i].style.display = "none";
        }
    }
}
</script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/index.css">
    <title>Sportsmate</title>

</head>

<body>
    <div class="wrap">
        <div class="head">
            <h1><img src="../images/logo.PNG" alt="메인로고" width="200"></h1>
            <div class="u_info">
           		<p><span class="u_name"><%=name %></span> 님 안녕하세요</p>
                <a href="../list.jsp">마이페이지</a>
            </div>
        </div>
        <div class="main">
            <div class="main1">
                <h1>종목별로 보기</h1>
                <div class="events event1">
                    <h2 class="title">축구/풋살</h2>
                    <a class="more" href="soccer.do">더 보기</a>
                </div>
                <div class="events event2">
                    <h2 class="title">농구<br>(3:3/5:5)</h2>
                    <a class="more" href="basketball.do">더 보기</a>
                </div>
                <div class="events event3">
                    <h2 class="title">야구/소프트볼</h2>
                    <a class="more" href="baseball.do">더 보기</a>
                </div>
                <div class="events event4">
                    <h2 class="title">기타 종목</h2>
                    <a class="more"  href="list.do" >더 보기</a>
                </div>
            </div>
            <div class="main2">
                <div class="main2_1">
                    <h2>모집중인 매치</h2>
                    <select name="exercise" id="exercise-select" onchange="filterGameList()">
    					<option value="">종목</option>
   						<option value="">전체</option>
					    <option value="축구">축구</option>
					    <option value="농구">농구</option>
					    <option value="야구">야구</option>
					</select>
					<div id="con">
					<table  class="board">
					<tr class=b_title>
							<th>날짜</th>
							<th>시간</th>
							<th>장소</th>
							<th>종목</th>
							<th>사용자</th>
					</tr>
					</table>
					<div id="t_con" style="overflow: scroll; height: 400px;">
					<table class="board">
						<c:choose>
						<c:when test="${empty gameList}">
						<tr align="center">
							<td colspan=5>
								<b>등록된 매칭이 없습니다.</b>
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
                    <a class="more2" href="list.do">더 보기</a>
                </div>
                <div class="main2_2">
                    <h2>모집완료된 매치</h2>
                    <select name="exercise" id="exercise-select2" onchange="filterGameList2()">
    					<option value="">종목</option>
   						<option value="">전체</option>
					    <option value="축구">축구</option>
					    <option value="농구">농구</option>
					    <option value="야구">야구</option>
					</select>
                    <div id="con">
					<table  class="board">
					<tr class=b_title>
							<th>날짜</th>
							<th>시간</th>
							<th>장소</th>
							<th>종목</th>
							<th>사용자</th>
					</tr>
					</table>
					<div id="t_con2" style="overflow: scroll; height: 400px;"  >
					<table class="board">
						<c:choose>
						<c:when test="${empty completelistGame}">
						<tr align="center">
							<td colspan=5>
								<b>등록된 매칭이 없습니다.</b>
							</td>
						</tr>
						</c:when>
						<c:when test="${!empty completelistGame}">
						<c:forEach var="cg" items="${completelistGame}">
						<tr align="center">
							<td>${cg.date }</td>
							<td>${cg.time }</td>
							<td>${cg.place }</td>
							<td>${cg.exercise }</td>
							<td>${cg.id }</td>
						</tr>
						</c:forEach>
						</c:when>
					</c:choose>
					</table>
					</div>
					</div>
                    <a class="more2"  href="complete.do">더 보기</a>
                </div>
            </div>
        </div>
        <div class="footer">
            <h2>제작</h2>
            <span class="name">박준익</span>
            <span class="name">김동현</span>
            <span class="name">양윤정</span>
            <span class="name">윤성우</span>
            <p>해당 페이지는 팀 포트폴리오를 목적으로 제작된 페이지입니다.</p>
        </div>
    </div>
   
</body>

</html>