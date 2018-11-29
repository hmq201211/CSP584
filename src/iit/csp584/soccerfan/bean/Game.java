package iit.csp584.soccerfan.bean;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Game {
    private  int id;
    private String league;
    private String  time;
    private String home_team;
    private String score;
    private String guest_team;
    private String address;

    public Game() {
    }

    public Game(int id, String league, String time, String home_team, String score, String guest_team, String address) {
        this.id = id;
        this.league = league;
        this.time = time;
        this.home_team = home_team;
        this.score = score;
        this.guest_team = guest_team;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLeague() {
        return league;
    }

    public void setLeague(String league) {
        this.league = league;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getHome_team() {
        return home_team;
    }

    public void setHome_team(String home_team) {
        this.home_team = home_team;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getGuest_team() {
        return guest_team;
    }

    public void setGuest_team(String guest_team) {
        this.guest_team = guest_team;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
