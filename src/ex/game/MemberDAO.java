package ex.game;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	private Connection con; // Connection 객체 생성 (인스턴스 변수)
	private PreparedStatement pstmt; // PreparedStatement 객체 생성 (인스턴스 변수)
	private DataSource dataFactory; // 데이터 소스 생성

	// 생성자에서 데이터 소스 생성 및 예외처리
	public MemberDAO(){
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/game");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	// 회원 목록을 조회하는 메서드
	public List<MemberVO> listMembers(){
		List<MemberVO> list = new ArrayList<>();
		try {
			con =dataFactory.getConnection(); // Connection 객체를 데이터 소스로부터 생성
			String query = "select * from t_member"; // SQL 쿼리문
			System.out.println("prepareStatememt:" +query); // 쿼리 확인용 출력
			pstmt = con.prepareStatement(query); // PreparedStatement 객체 생성
			ResultSet rs = pstmt.executeQuery(); // 쿼리 실행
			while(rs.next()) { // 결과셋의 각 행을 반복문으로 돌며 MemberVO 객체를 생성하여 리스트에 추가
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String day = rs.getString("day");
				String interest = rs.getString("interest");
				Date joinDate = rs.getDate("joinDate");
				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setDay(day);
				vo.setInterest(interest);
				vo.setJoinDate(joinDate);
				list.add(vo);
			}
			rs.close(); // 결과셋, PreparedStatement, Connection 객체 모두 닫기
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // 조회된 회원 목록 반환
	}

	// 새로운 회원을 추가하는 메서드
	public void addMember(MemberVO memberVO)
	{
		try {
			con =dataFactory.getConnection(); // Connection 객체를 데이터 소스로부터 생성
			String id  = memberVO.getId();
			String pwd  = memberVO.getPwd();
			String name = memberVO.getName();
			String day  = memberVO.getDay();
			String interest = memberVO.getInterest();
			
			String query = "insert into t_member"; // SQL 쿼리문
			query += "(id,pwd,name,day,interest)";
			query += "values(?,?,?,?,?)";
			
			System.out.println("prepareStatememt:" +query); // 쿼리 확인용 출력
			pstmt = con.prepareStatement(query); // PreparedStatement 객체 생성
			pstmt.setString(1, id); // PreparedStatement 객체에 값 바인딩
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, day);
			pstmt.setString(5, interest);
			pstmt.executeUpdate(); // 쿼리 실행
			pstmt.close(); // PreparedStatement, Connection 객체 모두 닫기
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void delMember(String id) {
		try {
			con = dataFactory.getConnection();// Connection 객체를 데이터 소스로부터 생성
			
			String query = "delete from t_member"+ " where id =?";
			System.out.println("prepareStatememt:" +query); // 쿼리 확인용 출력
			pstmt = con.prepareStatement(query); // PreparedStatement 객체 생성
			pstmt.setString(1, id); // PreparedStatement 객체에 값 바인딩
			pstmt.executeUpdate(); // 쿼리 실행
			pstmt.close(); // PreparedStatement, Connection 객체 모두 닫기
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
