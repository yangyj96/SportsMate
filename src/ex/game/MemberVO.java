package ex.game;
import java.sql.Date;

public class MemberVO {

	
	private String id; //이메일
	private String pwd; //비밀번호
	private String name; //이름
	private String day; //생년월일
	private Date joinDate;
	private String interest;
	
	public MemberVO() {
		System.out.println("MemberVO 생성자 호출");
	
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

