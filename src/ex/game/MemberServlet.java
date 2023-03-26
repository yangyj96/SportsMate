package ex.game;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member3")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		MemberDAO dao = new MemberDAO();
		String command = request.getParameter("command");

		if (command != null && command.equals("addMember")) {
			String _id = request.getParameter("id");
			String _pwd = request.getParameter("pwd");
			String _name = request.getParameter("name");
			String _day = request.getParameter("day");
			String _interest = request.getParameter("interest");
			MemberVO vo = new MemberVO();
			vo.setId(_id);
			vo.setPwd(_pwd);
			vo.setName(_name);
			vo.setDay(_day);
			vo.setInterest(_interest);
			dao.addMember(vo);
			out.print("<html><body>");
			out.print("<script>alert('회원가입이 완료되었습니다.'); location.href='/login.html';</script>");
			out.print("</body></html>");
		} else if (command != null && command.equals("delMember")) {
			String id = request.getParameter("id");
			dao.delMember(id);
		}
		;
	}

}