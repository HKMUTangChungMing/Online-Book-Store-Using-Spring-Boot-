package hkmu.comps380f.onlinebookstore.entity;

import jakarta.persistence.*;

import java.io.Serializable;

/**
 * Shopping cart entity class
 *
 */
@Entity
@Table(name ="bookcart")
public class BookCart implements Serializable {
    /**
     * id
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    /**
     * bookid
     */
    private Integer bookid;
    /**
     * userid
     */
    private Integer usid;
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
}
