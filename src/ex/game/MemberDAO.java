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

	private Connection con; // Connection ��ü ���� (�ν��Ͻ� ����)
	private PreparedStatement pstmt; // PreparedStatement ��ü ���� (�ν��Ͻ� ����)
	private DataSource dataFactory; // ������ �ҽ� ����

	// �����ڿ��� ������ �ҽ� ���� �� ����ó��
	public MemberDAO(){
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/game");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	// ȸ�� ����� ��ȸ�ϴ� �޼���
	public List<MemberVO> listMembers(){
		List<MemberVO> list = new ArrayList<>();
		try {
			con =dataFactory.getConnection(); // Connection ��ü�� ������ �ҽ��κ��� ����
			String query = "select * from t_member"; // SQL ������
			System.out.println("prepareStatememt:" +query); // ���� Ȯ�ο� ���
			pstmt = con.prepareStatement(query); // PreparedStatement ��ü ����
			ResultSet rs = pstmt.executeQuery(); // ���� ����
			while(rs.next()) { // ������� �� ���� �ݺ������� ���� MemberVO ��ü�� �����Ͽ� ����Ʈ�� �߰�
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
			rs.close(); // �����, PreparedStatement, Connection ��ü ��� �ݱ�
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // ��ȸ�� ȸ�� ��� ��ȯ
	}

	// ���ο� ȸ���� �߰��ϴ� �޼���
	public void addMember(MemberVO memberVO)
	{
		try {
			con =dataFactory.getConnection(); // Connection ��ü�� ������ �ҽ��κ��� ����
			String id  = memberVO.getId();
			String pwd  = memberVO.getPwd();
			String name = memberVO.getName();
			String day  = memberVO.getDay();
			String interest = memberVO.getInterest();
			
			String query = "insert into t_member"; // SQL ������
			query += "(id,pwd,name,day,interest)";
			query += "values(?,?,?,?,?)";
			
			System.out.println("prepareStatememt:" +query); // ���� Ȯ�ο� ���
			pstmt = con.prepareStatement(query); // PreparedStatement ��ü ����
			pstmt.setString(1, id); // PreparedStatement ��ü�� �� ���ε�
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, day);
			pstmt.setString(5, interest);
			pstmt.executeUpdate(); // ���� ����
			pstmt.close(); // PreparedStatement, Connection ��ü ��� �ݱ�
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void delMember(String id) {
		try {
			con = dataFactory.getConnection();// Connection ��ü�� ������ �ҽ��κ��� ����
			
			String query = "delete from t_member"+ " where id =?";
			System.out.println("prepareStatememt:" +query); // ���� Ȯ�ο� ���
			pstmt = con.prepareStatement(query); // PreparedStatement ��ü ����
			pstmt.setString(1, id); // PreparedStatement ��ü�� �� ���ε�
			pstmt.executeUpdate(); // ���� ����
			pstmt.close(); // PreparedStatement, Connection ��ü ��� �ݱ�
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
