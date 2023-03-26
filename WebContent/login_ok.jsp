<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
	// 요청한 캐릭터셋을 UTF-8로 설정합니다.
	request.setCharacterEncoding("UTF-8");

	// 사용자가 입력한 ID와 비밀번호를 가져옵니다.
	String id = request.getParameter("id");
	String pwd = request.getParameter("pw");  // name이 "pw"인 필드를 가져옵니다.
	
	// 데이터베이스 연결에 필요한 변수를 선언합니다.
	String url = "jdbc:mysql://localhost:3306/game";
	String uid = "game";
	String upw = "12345";
	
	// Connection, PreparedStatement, ResultSet 객체를 초기화합니다.
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// SQL 쿼리를 준비합니다.
	String sql = "select * from t_member where id = ? and pwd = ?";
	
	try{
		// Oracle JDBC 드라이버를 로드합니다.
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// Connection 객체를 생성합니다.
		conn = DriverManager.getConnection(url, uid, upw);
		
		// PreparedStatement 객체를 생성합니다.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		
		// SQL 쿼리를 실행하고 결과를 ResultSet 객체에 저장합니다.
		rs = pstmt.executeQuery();
		
		// 로그인에 성공한 경우 (세션을 이용한 인증)
		if(rs.next()){
			id = rs.getString("id");
			String name = rs.getString("name");
		
			// 세션 속성을 설정합니다.
			session.setAttribute("user_id", id);
			session.setAttribute("user_name", name);
			
			// 사용자를 환영 페이지로 리디렉션합니다.
			response.sendRedirect("/game/index.do");
			
		} else{ // 로그인 실패
			// 사용자를 로그인 실패 페이지로 리디렉션합니다.
			response.sendRedirect("login_fail.jsp");
		}
	} catch(Exception e){
		e.printStackTrace();
		// 에러가 발생한 경우 사용자를 로그인 페이지로 리디렉션합니다.
		response.sendRedirect("login.html");
	} finally{
		// Connection, PreparedStatement, ResultSet 객체를 닫습니다.
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
 %>