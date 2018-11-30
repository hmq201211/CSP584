package iit.csp584.soccerfan.bean;

public class UserInfo {
    private String username;
    private int cart;
    private int follow;

    public UserInfo() {
    }

    public UserInfo(String username, int cart, int follow) {
        this.username = username;
        this.cart = cart;
        this.follow = follow;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getCart() {
        return cart;
    }

    public void setCart(int cart) {
        this.cart = cart;
    }

    public int getFollow() {
        return follow;
    }

    public void setFollow(int follow) {
        this.follow = follow;
    }
}
