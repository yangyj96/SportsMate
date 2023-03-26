package ex.game;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/game/*")
public class GameController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    GameDAO gameDAO;

    public void init(ServletConfig config) throws ServletException {
        gameDAO = new GameDAO();
    }

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
        String nextPage = null;
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String action = request.getPathInfo();
        System.out.println("action :" + action);

        if (action == null || action.equals("/listgame.do")) {
            List<GameVO> gameList = gameDAO.listGame();
            request.setAttribute("gameList", gameList);
            nextPage = "/Game.jsp";

        } else if (action.equals("/addGame.do")) {
            String id = request.getParameter("id");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String place = request.getParameter("place");
            String exercise = request.getParameter("exercise");
            GameVO gameVO = new GameVO(id, date, time, place, exercise);
            gameDAO.addGame(gameVO);
            nextPage = "/Game2.jsp";

        } else if(action.equals("/game.do")) {
			nextPage = "/match.jsp";
	
		} else if (action.equals("/soccer.do")) {
        	List<GameVO> gameList = gameDAO.listGameByExercise("축구");
        	gameList.addAll(gameDAO.listGameByExercise("풋볼"));
        	request.setAttribute("gameList", gameList);
        	nextPage = "/Soccer.jsp";
  
        } else if (action.equals("/basketball.do")) {
            List<GameVO> gameList = gameDAO.listGameByExercise("농구");
            request.setAttribute("gameList", gameList);
            nextPage = "/Basketball.jsp";
            
   
        } else if (action.equals("/baseball.do")) {
        	List<GameVO> gameList = gameDAO.listGameByExercise("야구");
        	gameList.addAll(gameDAO.listGameByExercise("소프트볼"));
            request.setAttribute("gameList", gameList);
            nextPage = "/Baseball.jsp";
  

        }else if(action.equals("/copylist.do")) {
        	List<GameVO> gameList = gameDAO.copylistGame();
            request.setAttribute("gameList", gameList);
            
            nextPage = "/Copy.jsp";
            
        }else if (action.equals("/addtocopy.do")) {
            String id = request.getParameter("id");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String place = request.getParameter("place");
            String exercise = request.getParameter("exercise");
            gameDAO.copyGame(id, date, time, place, exercise);
            nextPage = "/game/copylist.do";

        }
        
        else if(action.equals("/complete.do")) {
        	List<GameVO> gameList = gameDAO.completelistGame();
            request.setAttribute("gameList", gameList);
            nextPage = "/Complete.jsp";
            
        }else if (action.equals("/index.do")) {
            List<GameVO> gameList = gameDAO.listGameIndex();
            List<GameVO> completelistGame = gameDAO.completelistGame(); // 추가된 코드
            request.setAttribute("gameList", gameList);
            request.setAttribute("completelistGame", completelistGame); // 추가된 코드
            nextPage = "/index2.jsp";
        }
            
   
        else if (action.equals("/addcomplete.do")) {
        	
            String id = request.getParameter("id");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String place = request.getParameter("place");
            String exercise = request.getParameter("exercise");
            gameDAO.completeGame(id, date, time, place, exercise);
            gameDAO.deleteGame(id, date, time, place, exercise);
            gameDAO.deletecopyGame(id, date, time, place, exercise);
            nextPage = "complete.do";
        }
     
         else {
            List<GameVO> gameList = gameDAO.listGame();
            request.setAttribute("gameList", gameList);
            nextPage = "/Game.jsp";
        }
        try {

            RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
        } catch (Exception e) {
  
            e.printStackTrace();
            request.setAttribute("errorMsg", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
    
}