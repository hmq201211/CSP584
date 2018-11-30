package iit.csp584.soccerfan.bean;

public class Review {
    private String id;
    private String type;
    private String star;
    private String content;
    private String username;
    private String time;

    public Review() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Review(String id, String type, String star, String content, String username, String time) {
        this.id = id;
        this.type = type;
        this.star = star;
        this.content = content;
        this.username = username;
        this.time = time;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStar() {
        return star;
    }

    public void setStar(String star) {
        this.star = star;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
