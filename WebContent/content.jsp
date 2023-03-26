<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
  <title>글 내용</title>
  <link rel="stylesheet" href="content.css">
</head>
<body>
<div class="container">
<%
  String num = request.getParameter("num");

  try {
    Context initContext = new InitialContext();
    Context envContext = (Context)initContext.lookup("java:/comp/env");
    DataSource DBConnUtils = (DataSource)envContext.lookup("jdbc/game");

    Connection conn = DBConnUtils.getConnection();
    Statement stmt = conn.createStatement();
    String sql = "SELECT * FROM list WHERE num = " + num;
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();

    String id = rs.getString("id");
    String date = rs.getString("date");
    String time = rs.getString("time");
    String place = rs.getString("place");
    String exercise = rs.getString("exercise");
%>
<h2><%= id %></h2>
<p><%= date %> | <%= time %></p>
<p><%= place %></p>
<p><%= exercise %></p>

<form action="delete.jsp" method="post">
  <input type="hidden" name="num" value="<%= num %>">
  <input type="submit" value="삭제">
</form>

<a href="list.jsp">목록으로</a>

<%
    rs.close();
    stmt.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
</div>
</body>
</html>
