package ex.game;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GameDAO {
    private DataSource dataSource;

    public GameDAO() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/game");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<GameVO> listGame() {
        List<GameVO> gameList = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM list ORDER BY date ASC");
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                String id = rs.getString("id");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String place = rs.getString("place");
                String exercise = rs.getString("exercise");
                GameVO gameVO = new GameVO(id, date, time, place, exercise);
                gameList.add(gameVO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gameList;
    }
    public List<GameVO> listGameIndex() {
        List<GameVO> gameList = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM list ORDER BY date ASC");
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                String id = rs.getString("id");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String place = rs.getString("place");
                String exercise = rs.getString("exercise");
                GameVO gameVO = new GameVO(id, date, time, place, exercise);
                gameList.add(gameVO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gameList;
    }
    
    public List<GameVO> copylistGame() {
        List<GameVO> gameList = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM copy ORDER BY date ASC");
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                String id = rs.getString("id");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String place = rs.getString("place");
                String exercise = rs.getString("exercise");
                GameVO gameVO = new GameVO(id, date, time, place, exercise);
                gameList.add(gameVO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gameList;
    }
    
    public List<GameVO> completelistGame() {
        List<GameVO> gameList = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM complete ORDER BY date ASC");
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                String id = rs.getString("id");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String place = rs.getString("place");
                String exercise = rs.getString("exercise");
                GameVO gameVO = new GameVO(id, date, time, place, exercise);
                gameList.add(gameVO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gameList;
    }
    
    

    public List<GameVO> listGameByExercise(String exercise) {
        List<GameVO> gameList = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM list WHERE exercise = ? ORDER BY date ASC")) {
            pstmt.setString(1, exercise);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    String date = rs.getString("date");
                    String time = rs.getString("time");
                    String place = rs.getString("place");
                    GameVO gameVO = new GameVO(id, date, time, place, exercise);
                    gameList.add(gameVO);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gameList;
    }

    public void copyGame(String id, String date, String time, String place, String exercise) {
    	try (Connection conn = dataSource.getConnection();
                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO copy (id, date, time, place, exercise) SELECT id, date, time, place, exercise FROM list WHERE id=? AND date=? AND time=? AND place=? AND exercise=?")) {
               pstmt.setString(1, id);
               pstmt.setString(2, date);
               pstmt.setString(3, time);
               pstmt.setString(4, place);
               pstmt.setString(5, exercise);
               pstmt.executeUpdate();
               System.out.println("complted game: id=" + id + ", date=" + date + ", time=" + time);
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }
    public void completeGame(String id, String date, String time, String place, String exercise) {
    	try (Connection conn = dataSource.getConnection();
                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO complete (id, date, time, place, exercise) SELECT id, date, time, place, exercise FROM list WHERE id=? AND date=? AND time=? AND place=? AND exercise=?")) {
               pstmt.setString(1, id);
               pstmt.setString(2, date);
               pstmt.setString(3, time);
               pstmt.setString(4, place);
               pstmt.setString(5, exercise);
               pstmt.executeUpdate();
               System.out.println("complted game: id=" + id + ", date=" + date + ", time=" + time);
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }
    
    public void deleteGame(String id, String date, String time, String place, String exercise) {
    	 try (Connection conn = dataSource.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement("DELETE FROM list WHERE id=? AND date=? AND time=? AND place=? AND exercise=?")) {
                pstmt.setString(1, id);
                pstmt.setString(2, date);
                pstmt.setString(3, time);
                pstmt.setString(4, place);
                pstmt.setString(5, exercise);
                pstmt.executeUpdate();
                System.out.println("Deleted game: id=" + id + ", date=" + date + ", time=" + time);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    
    public void deletecopyGame(String id, String date, String time, String place, String exercise) {
    	 try (Connection conn = dataSource.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement("DELETE FROM copy WHERE id=? AND date=? AND time=? AND place=? AND exercise=?")) {
                pstmt.setString(1, id);
                pstmt.setString(2, date);
                pstmt.setString(3, time);
                pstmt.setString(4, place);
                pstmt.setString(5, exercise);
                pstmt.executeUpdate();
                System.out.println("Deletedcopy game: id=" + id + ", date=" + date + ", time=" + time);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    public void addGame(GameVO m) {
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("INSERT INTO list(id, date, time, place, exercise) VALUES(?, ?, ? ,? ,?)")) {
            pstmt.setString(1, m.getId());
            pstmt.setString(2, m.getDate());
            pstmt.setString(3, m.getTime());
            pstmt.setString(4, m.getPlace());
            pstmt.setString(5, m.getExercise());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   
}

