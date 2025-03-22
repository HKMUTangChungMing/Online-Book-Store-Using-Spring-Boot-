package hkmu.comps380f.onlinebookstore.entity;

import jakarta.persistence.*;

import java.io.Serializable;

/**
 * Comment entity class
 *
 */
@Entity
@Table(name ="bookcomment")
public class BookComment implements Serializable {
    /**
     * Commentid
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    /**
     * userid
     */
    private Integer uid;
    /**
     * Commenter account
     */
    private String uname;
    /**
     * Comment time
     */
    private String createtime;
    /**
     * comments
     */
    private String content;
    /**
     * Review books
     */
    private String bname;
    /**
     * book id
     */
    private Integer bid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
