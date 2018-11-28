package iit.csp584.soccerfan.bean;

public class Accessory {
    private String id;
    private String name;
    private double price;
    private String maker;
    private double discount;

    public Accessory() {
    }

    public Accessory(String id, String name, double price, String maker, double discount) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.maker = maker;
        this.discount = discount;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getMaker() {
        return maker;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }
}
