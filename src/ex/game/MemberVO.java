package ex.game;
import java.sql.Date;

public class MemberVO {

	
	private String id; //�̸���
	private String pwd; //��й�ȣ
	private String name; //�̸�
	private String day; //�������
	private Date joinDate;
	private String interest;
	
	public MemberVO() {
		System.out.println("MemberVO ������ ȣ��");
	
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

}

