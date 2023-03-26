<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<html>
<head>
    <title>게시판</title>
</head>
<body>
<h2>게시판</h2>
<table border="1">
    <tr>
        <th>번호</th>
        <th>작성자</th>
        <th>날짜</th>
        <th>시간</th>
        <th>장소</th>
        <th>종목</th>
    </tr>
    <%
        Context initContext = null;
        try {
            initContext = new InitialContext();
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
        Context envContext = null;
        try {
            envContext = (Context)initContext.lookup("java:/comp/env");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
        DataSource ds = null;
        try {
            ds = (DataSource)envContext.lookup("jdbc/game");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = ds.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM list ORDER BY num DESC";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int num = rs.getInt("num");
                String id = rs.getString("id");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String place = rs.getString("place");
                String exercise = rs.getString("exercise");
    %>
    <tr>
        <td><%=num%></td>
        <td><%=id%></td>
        <td><%=date%></td>
        <td><%=time%></td>
        <td><%=place%></td>
        <td><%=exercise%></td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</table>
<a href="write.jsp">글쓰기</a>
</body>
</html>
