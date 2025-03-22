package hkmu.comps380f.onlinebookstore.entity;

import jakarta.persistence.*;

import java.io.Serializable;

/**
 * Order details entity class
 *
 */
@Entity
@Table(name ="bookitem")
public class BookItem implements Serializable {
    /**
     * id
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    /**
     * order number
     */
    private String orderid;
    /**
     * book id
     */
    private Integer bookid;

    /**
     * book title
     */
    private String name;
    /**
     * book cover
     */
    private String fmimg;
    /**
     * book price
     */
    private String price;
    /**
     * quantity
     */
    private Integer num;

    /**
     * Single amount
     */
    private String pertotal;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getFmimg() {
        return fmimg;
    }

    public void setFmimg(String fmimg) {
        this.fmimg = fmimg;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getPertotal() {
        return pertotal;
    }

    public void setPertotal(String pertotal) {
        this.pertotal = pertotal;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
