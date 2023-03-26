<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
    <link rel="stylesheet" href="write.css">
</head>
<body>
<h1>게시글 작성</h1>

<form method="post" action="insert.jsp">
    <div>
        <label for="id">작성자</label>
        <input type="text" name="id" id="id" required>
    </div>
    <div>
        <label for="date">날짜</label>
        <input type="date" name="date" id="date" required>
    </div>
    <div>
        <label for="time">시간</label>
        <input type="time" name="time" id="time" required>
    </div>
    <div>
        <label for="place">장소</label>
        <input type="text" name="place" id="place" required>
    </div>
    <div>
        <label for="exercise">종목</label>
        <input type="text" name="exercise" id="exercise" required>
    </div>
    <div class="btn-container">
    <button type="submit">작성 완료</button>
    </div>
    <div class="btn-container">
        <a href="list.jsp" class="btn-cancel">취소</a>
    </div>
</form>


</body>
</html>
