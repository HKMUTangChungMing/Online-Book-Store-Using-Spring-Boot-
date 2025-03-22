package hkmu.comps380f.onlinebookstore.utils;

import java.io.Serializable;

/**
 * Shopping cart return package
 *
 */
public class BookInfoCart implements Serializable {
    /**
     * Shopping cart id
     */
    private Integer id;
    /**
     * book id
     */
    private Integer bookid;
    /**
     * user id
     */
    private Integer usid;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public Integer getUsid() {
        return usid;
    }

    public void setUsid(Integer usid) {
        this.usid = usid;
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
}
