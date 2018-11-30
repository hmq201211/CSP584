package iit.csp584.soccerfan.bean;

public class Player {
    private String id;
    private String name;
    private String age;
    private String teamid;
    private String number;
    private String position;

    public Player() {
    }

    public Player(String id, String name, String age, String teamid, String number, String position) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.teamid = teamid;
        this.number = number;
        this.position = position;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getTeamid() {
        return teamid;
    }

    public void setTeamid(String teamid) {
        this.teamid = teamid;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
