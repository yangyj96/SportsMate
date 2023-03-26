<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성 결과</title>
</head>
<body>
<h1>게시글 작성 결과</h1>

<%
    request.setCharacterEncoding("UTF-8");
    String url = "jdbc:mysql://localhost:3306/game";
    String id = "game";
    String pw = "12345";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, id, pw);

        String sql = "INSERT INTO list (id, date, time, place, exercise) VALUES (?, ?, ?, ?, ?)";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, request.getParameter("id"));
        pstmt.setString(2, request.getParameter("date"));
        pstmt.setString(3, request.getParameter("time"));
        pstmt.setString(4, request.getParameter("place"));
        pstmt.setString(5, request.getParameter("exercise"));

        int result = pstmt.executeUpdate();

        if (result == 1) {
%>
<p>게시글이 작성되었습니다.</p>
<%
} else {
%>
<p>게시글 작성에 실패하였습니다.</p>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            pstmt.close();
        } catch (Exception e) {
        }
        try {
            conn.close();
        } catch (Exception e) {
        }
    }
%>

<div class="btn-container">
    <a href="list.jsp" class="btn-back">목록으로 돌아가기</a>
</div>

</body>
</html>
