package hkmu.comps380f.onlinebookstore.entity;

import jakarta.persistence.*;

import java.io.Serializable;

/**
 * Book entity class
 *
 */
@Entity
@Table(name ="bookinfo")
public class BookInfo implements Serializable {
    /**
     * bookid
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    /**
     * bookname
     */
    private String name;
    /**
     * book cover
     */
    private String fmimg;
    /**
     * book author
     */
    private String author;
    /**
     * book price
     */
    private String price;
    /**
     * Book introduction
     */
    private String intro;

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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }
}
