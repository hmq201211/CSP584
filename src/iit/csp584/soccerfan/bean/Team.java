package iit.csp584.soccerfan.bean;

public class Team {
    private String id;
    private String name;
    private String league;
    private String country;
    private String address;

    public Team() {
    }

    public Team(String id, String name, String league, String country, String address) {
        this.id = id;
        this.name = name;
        this.league = league;
        this.country = country;
        this.address = address;
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

    public String getLeague() {
        return league;
    }

    public void setLeague(String league) {
        this.league = league;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
