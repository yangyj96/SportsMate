<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String name = (String)session.getAttribute("user_name");
%>

<html>
<head>
    <title>게시판</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <link rel="stylesheet" href="reset.css">
    <link rel="stylesheet" href="mypage.css">
</head>
<body>
<div class="head">
            <h1><a href="index1.jsp"><img src="images/logo.PNG" alt="메인로고" width="200"></a></h1>
            <div class="u_info">
                <a href="index.jsp">로그아웃 |</a>
                <a href="list.jsp">마이페이지</a>
            </div>
</div>
<div id="mypage_wrap">
    <div class="mypage_main_wrap">
        <h2 class="mypage">마이페이지</h2>
        <div class="status">
            <p><img src="images/soccer-player.png" alt="player" width="100" height="100"><span><%=name %></span></p>
        </div>
    </div>
    <div id="match_list">
        <div class="match_on">
            <h3>내가 올린 매치</h3>
            <table>
                <thead>
                <tr>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>시간</th>
                    <th>장소</th>
                    <th>종목</th>
                </tr>
                </thead>
                <%
                    try {
                        Context initContext = new InitialContext();
                        Context envContext = (Context) initContext.lookup("java:/comp/env");
                        DataSource DBConnUtils = (DataSource) envContext.lookup("jdbc/game");

                        Connection conn = DBConnUtils.getConnection();
                        Statement stmt = conn.createStatement();
                        String sql = "SELECT * FROM list ORDER BY num DESC";
                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            int num = rs.getInt("num");
                            String id = rs.getString("id");
                            String date = rs.getString("date");
                            String time = rs.getString("time");
                            String place = rs.getString("place");
                            String exercise = rs.getString("exercise");
                %>
                <tbody>
                <tr>
                    <td><%= id %>
                    </td>
                    <td><%= date %>
                    </td>
                    <td><%= time %>
                    </td>
                    <td><%= place %>
                    </td>
                    <td><%= exercise %>
                    </td>
                </tr>
                </tbody>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <a class="board_write" href="game/game.do">글쓰기</a>
        </div>
        <div class="match_on">
            <h3>관심있는 매치</h3>
            <table>
                <thead>
                <tr>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>시간</th>
                    <th>장소</th>
                    <th>종목</th>
                </tr>
                </thead>
                <%
                    try {
                        Context initContext = new InitialContext();
                        Context envContext = (Context) initContext.lookup("java:/comp/env");
                        DataSource DBConnUtils = (DataSource) envContext.lookup("jdbc/game");

                        Connection conn = DBConnUtils.getConnection();
                        Statement stmt = conn.createStatement();
                        String sql = "SELECT * FROM copy ORDER BY num DESC";
                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            int num = rs.getInt("num");
                            String id = rs.getString("id");
                            String date = rs.getString("date");
                            String time = rs.getString("time");
                            String place = rs.getString("place");
                            String exercise = rs.getString("exercise");
                %>
                <tbody>
                <tr>
                    <td><%= id %>
                    </td>
                    <td><%= date %>
                    </td>
                    <td><%= time %>
                    </td>
                    <td><%= place %>
                    </td>
                    <td><%= exercise %>
                    </td>
                </tr>
                </tbody>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
        <div class="match_on">
            <h3>종료된 매치</h3>
            <table>
                <thead>
                <tr>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>시간</th>
                    <th>장소</th>
                    <th>종목</th>
                </tr>
                </thead>
                <%
                    try {
                        Context initContext = new InitialContext();
                        Context envContext = (Context) initContext.lookup("java:/comp/env");
                        DataSource DBConnUtils = (DataSource) envContext.lookup("jdbc/game");

                        Connection conn = DBConnUtils.getConnection();
                        Statement stmt = conn.createStatement();
                        String sql = "SELECT * FROM complete ORDER BY num DESC";
                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            int num = rs.getInt("num");
                            String id = rs.getString("id");
                            String date = rs.getString("date");
                            String time = rs.getString("time");
                            String place = rs.getString("place");
                            String exercise = rs.getString("exercise");
                %>
                <tbody>
                <tr>
                    <td><%= id %>
                    </td>
                    <td><%= date %>
                    </td>
                    <td><%= time %>
                    </td>
                    <td><%= place %>
                    </td>
                    <td><%= exercise %>
                    </td>
                </tr>
                </tbody>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
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
</body>
</html>
