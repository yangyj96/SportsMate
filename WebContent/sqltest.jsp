<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import=" java.util.*,ex.game.*"
	pageEncoding="UTF-8"
	isELIgnored="false" 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	InitialContext initCtx = new InitialContext();
	Context ctx = new InitialContext();
	Context envContext = (Context) ctx.lookup("java:/comp/env");
	DataSource ds = (DataSource) envContext.lookup("jdbc/game");
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT VERSION()");
	while(rs.next()) {
		out.println("MYSQL Version : " + rs.getString("VERSION()"));
	}
	rs.close();
	stmt.close();
	conn.close();
	initCtx.close();
%>
</body>
</html>