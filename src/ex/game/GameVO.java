package ex.game;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GameVO {
	private int num;
    private String id;
    private String date;
    private String time;
    private String place;
    private String exercise;

    public GameVO() {
        System.out.println("GameVO ");
    }

    public GameVO(String id, String date, String time, String place, String exercise) {
        this.id =id;
        this.date = date;
        this.time = time;
        this.place = place;
        this.exercise = exercise;
    }

    public GameVO copy() {
        return new GameVO(this.id, this.date, this.time, this.place, this.exercise);
    }
}