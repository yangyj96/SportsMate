<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  String num = request.getParameter("num");

  try {
    Context initContext = new InitialContext();
    Context envContext = (Context)initContext.lookup("java:/comp/env");
    DataSource DBConnUtils = (DataSource)envContext.lookup("jdbc/game");

    Connection conn = DBConnUtils.getConnection();
    Statement stmt = conn.createStatement();
    String sql = "DELETE FROM list WHERE num = " + num;
    stmt.executeUpdate(sql);

    stmt.close();
    conn.close();

    response.sendRedirect("list.jsp");
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
